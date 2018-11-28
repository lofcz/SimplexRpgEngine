using Microsoft.Xna.Framework;
using MonoGame.Extended;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SimplexCore.Ext
{
    public abstract class PrimitiveBatcherBase<TVertex, TMatrix, TTexture> : IPrimitiveBatcher
    {
        private class DrawInfo
        {
            public readonly TTexture Texture;

            public DrawInfo(TTexture texture)
            {
                Texture = texture;
            }

            public bool Equals(DrawInfo other)
            {
                return ReferenceEquals(Texture, other.Texture);
            }
        }

        private class BatchInfo
        {
            public readonly DrawInfo DrawInfo;
            public readonly int Startindex;
            public readonly int IndexCount;

            public BatchInfo(DrawInfo drawInfo, int startindex, int indexCount)
            {
                DrawInfo = drawInfo;
                Startindex = startindex;
                IndexCount = indexCount;
            }
        }

        public const int DefaultMaxVertices = 2048;
        public const int DefaultMaxIndices = 4096;

        private readonly TVertex[] _vb;
        private readonly int[] _ib;
        public TMatrix TransformMatrix { get; set; }

        private int _nextToDraw;
        private int _indicesInBatch;
        private DrawInfo _lastDrawInfo;
        private int _verticesSubmitted;

        private readonly List<BatchInfo> _batches;

        // Render state
        public TTexture Texture { get; set; }
        public TTexture FontTexture { get; protected set; }

        protected PrimitiveBatcherBase()
        {
            _vb = new TVertex[DefaultMaxVertices];
            _ib = new int[DefaultMaxIndices];

            _batches = new List<BatchInfo>();
        }

        #region Abstract Methods

        protected abstract TVertex CreateVertex(Vector2 p, Vector2 uv, Color color);
        protected abstract void TransformVertexPosition(ref TVertex vertexPositionColorTexture, TMatrix matrix);
        protected abstract void SetTexture(TTexture textureId);
        protected abstract void BeginFlush(TVertex[] vertices, int vertexCount, int[] indices, int indexCount);
        protected abstract void DrawBatch(int vertexCount, int indexOffset, int indexCount);

        #endregion

        #region Line

        public void DrawLine(Vector2 p1, Vector2 p2, Color color, float lineWidth = 1)
        {
            Vector2 d = Vector2.Normalize(p2 - p1);
            var dt = d * (lineWidth / 2f);
            var v1 = CreateVertex(p1 - dt, Vector2.Zero, color);
            var v2 = CreateVertex(p1 + dt, Vector2.Zero, color);
            var v3 = CreateVertex(p2 + dt, Vector2.Zero, color);
            var v4 = CreateVertex(p2 - dt, Vector2.Zero, color);
            FillQuad(v1, v2, v3, v4);
        }

        public void DrawLineStrip(IEnumerable<Vector2> points, Color color, float lineWidth = 1)
        {
            using (var enumerator = points.GetEnumerator())
            {

                enumerator.MoveNext();
                var p1 = enumerator.Current;

                while (enumerator.MoveNext())
                {
                    var p2 = enumerator.Current;
                    DrawLine(p1, p2, color, lineWidth);
                    p1 = p2;
                }
            }
        }

        #endregion

        #region Rectangle

        public void DrawRect(RectangleF rect, Color color, float lineWidth = 1)
        {
            var p1 = new Vector2(rect.Left, rect.Top);
            var p2 = new Vector2(rect.Right, rect.Top);
            var p3 = new Vector2(rect.Right, rect.Bottom);
            var p4 = new Vector2(rect.Left, rect.Bottom);

            DrawLine(p1, p2, color, lineWidth);
            DrawLine(p2, p3, color, lineWidth);
            DrawLine(p3, p4, color, lineWidth);
            DrawLine(p4, p1, color, lineWidth);
        }

        public void DrawRoundedRect(RectangleF rectangle, float radius, int segments, Color color, int lineWidth = 1)
        {
            DrawRoundedRect(rectangle, radius, segments, radius, segments, radius, segments, radius, segments, color, lineWidth);
        }

        public void DrawRoundedRect(RectangleF rectangle,
            float radiusTl, int segmentsTl,
            float radiusTr, int segmentsTr,
            float radiusBr, int segmentsBr,
            float radiusBl, int segmentsBl,
            Color color, int lineWidth = 1)
        {
            if (radiusTl > rectangle.Width / 2f || radiusTl > rectangle.Height / 2f ||
                radiusTr > rectangle.Width / 2f || radiusTr > rectangle.Height / 2f ||
                radiusBr > rectangle.Width / 2f || radiusBr > rectangle.Height / 2f ||
                radiusBl > rectangle.Width / 2f || radiusBl > rectangle.Height / 2f)
                throw new Exception("Radius too large");

            if (radiusTl == 0 && radiusTr == 0 && radiusBr == 0 && radiusBl == 0)
            {
                DrawRect(rectangle, color, lineWidth);
                return;
            }

            var outerRect = rectangle;

            var tl = new Vector2(outerRect.Left + radiusTl, outerRect.Top + radiusTl);
            var tr = new Vector2(outerRect.Right - radiusTr, outerRect.Top + radiusTr);
            var bl = new Vector2(outerRect.Left + radiusBl, outerRect.Bottom - radiusBl);
            var br = new Vector2(outerRect.Right - radiusBr, outerRect.Bottom - radiusBr);

            DrawLine(new Vector2(tl.X, outerRect.Top), new Vector2(tr.X, outerRect.Top), color, lineWidth);
            DrawLine(new Vector2(outerRect.Right, tr.Y), new Vector2(outerRect.Right, br.Y), color, lineWidth);
            DrawLine(new Vector2(br.X, outerRect.Bottom), new Vector2(bl.X, outerRect.Bottom), color, lineWidth);
            DrawLine(new Vector2(outerRect.Left, bl.Y), new Vector2(outerRect.Left, tr.Y), color, lineWidth);
            if (radiusTl > 0)
                DrawCircleSegment(tl, radiusTl, LeftAngle, TopAngle, color, segmentsTl, lineWidth);
            if (radiusTr > 0)
                DrawCircleSegment(tr, radiusTr, TopAngle, RightEndAngle, color, segmentsTr, lineWidth);
            if (radiusBr > 0)
                DrawCircleSegment(br, radiusBr, RightStartAngle, BotAngle, color, segmentsBr, lineWidth);
            if (radiusBl > 0)
                DrawCircleSegment(bl, radiusBl, BotAngle, LeftAngle, color, segmentsBl, lineWidth);
        }

        public void FillQuad(TVertex v0, TVertex v1, TVertex v2, TVertex v3)
        {
            var di = new DrawInfo(Texture);
            CheckFlush(di);

            var i1 = AddVertex(v0);
            var i2 = AddVertex(v1);
            var i3 = AddVertex(v2);
            var i4 = AddVertex(v3);
            AddIndex(i1);
            AddIndex(i2);
            AddIndex(i4);
            AddIndex(i4);
            AddIndex(i2);
            AddIndex(i3);
        }

        public void FillRect(RectangleF rect, Color c)
        {
            FillRect(rect, c, c, c, c);
        }

        public void FillRect(RectangleF rect, Color c1, Color c2, Color c3, Color c4)
        {
            var v1 = CreateVertex(new Vector2(rect.Left, rect.Top), Vector2.Zero, c1);
            var v2 = CreateVertex(new Vector2(rect.Right, rect.Top), Vector2.UnitX, c2);
            var v3 = CreateVertex(new Vector2(rect.Right, rect.Bottom), Vector2.One, c3);
            var v4 = CreateVertex(new Vector2(rect.Left, rect.Bottom), Vector2.UnitY, c4);
            FillQuad(v1, v2, v3, v4);
        }

        public void FillRoundedRect(RectangleF rectangle, float radius, int segments, Color color)
        {
            if (radius > rectangle.Width / 2f || radius > rectangle.Height / 2f)
                throw new Exception("Radius too large");

            if (radius == 0)
            {
                FillRect(rectangle, color);
                return;
            }

            var outerRect = rectangle;
            var innerRect = rectangle;
            innerRect.Inflate(-radius, -radius);

            FillRect(innerRect, color);
            // TODO UV's
            FillRect(new RectangleF(outerRect.Left, innerRect.Top, radius, innerRect.Height), color); // left
            FillRect(new RectangleF(innerRect.Right, innerRect.Top, radius, innerRect.Height), color); // right
            FillRect(new RectangleF(innerRect.Left, outerRect.Top, innerRect.Width, radius), color); // top
            FillRect(new RectangleF(innerRect.Left, innerRect.Bottom, innerRect.Width, radius), color); // top
            var tl = new Vector2(innerRect.Left, innerRect.Top);
            var tr = new Vector2(innerRect.Right, innerRect.Top);
            var bl = new Vector2(innerRect.Left, innerRect.Bottom);
            var br = new Vector2(innerRect.Right, innerRect.Bottom);
            FillCircleSegment(tl, radius, LeftAngle, TopAngle, color, segments);
            FillCircleSegment(tr, radius, TopAngle, RightEndAngle, color, segments);
            FillCircleSegment(br, radius, RightStartAngle, BotAngle, color, segments);
            FillCircleSegment(bl, radius, BotAngle, LeftAngle, color, segments);
        }

        #endregion

        #region Circle

        private const float LeftAngle = (float)Math.PI;
        private const float TopAngle = (float)(1.5 * Math.PI);
        private const float RightStartAngle = 0;
        private const float RightEndAngle = (float)(2 * Math.PI);
        private const float BotAngle = (float)(.5 * Math.PI);

        public void DrawCircle(Vector2 center, float radius, Color color, int sides, float lineWidth = 1)
        {
            DrawCircleSegment(center, radius, RightStartAngle, RightEndAngle, color, sides, lineWidth);
        }

        public void DrawCircleSegment(Vector2 center, float radius, float start, float end, Color color, int sides, float lineWidth = 1)
        {
            var ps = CreateCircleSegment(center, radius, sides, start, end);
            DrawLineStrip(ps, color, lineWidth);
        }

        public void FillCircle(Vector2 center, float radius, Color color, int sides)
        {
            FillCircleSegment(center, radius, RightStartAngle, RightEndAngle, color, sides);
        }

        public void FillCircleSegment(Vector2 center, float radius, float start, float end, Color color, int sides)
        {
            var ps = CreateCircleSegment(center, radius, sides, start, end);
            FillTriangleFan(center, ps, color);
        }

        public abstract void DrawString(StringBuilder text, Vector2 position, float size, Color color);

        private static IEnumerable<Vector2> CreateCircleSegment(Vector2 center, float radius, int sides, float start, float end)
        {
            var step = (end - start) / sides;
            var theta = start;

            for (var i = 0; i < sides; i++)
            {
                yield return center + new Vector2((float)(radius * Math.Cos(theta)), (float)(radius * Math.Sin(theta)));
                theta += step;
            }
            yield return center + new Vector2((float)(radius * Math.Cos(end)), (float)(radius * Math.Sin(end)));
        }

        #endregion

        #region Low level

        public void FillTriangleStrip(IEnumerable<Vector2> ps, Color? c = null)
        {
            var di = new DrawInfo(Texture);
            CheckFlush(di);

            var color = c ?? Color.White;
            using (var en = ps.GetEnumerator())
            {
                en.MoveNext();
                var v1 = AddVertex(en.Current, color);
                en.MoveNext();
                var v2 = AddVertex(en.Current, color);

                while (en.MoveNext())
                {
                    var v3 = AddVertex(en.Current, color);
                    AddIndex(v1);
                    AddIndex(v2);
                    AddIndex(v3);
                    v1 = v2;
                    v2 = v3;
                }
            }
        }

        public void FillTriangleFan(Vector2 center, IEnumerable<Vector2> ps, Color color)
        {
            // TODO UV's
            FillTriangleFan(CreateVertex(center, Vector2.Zero, color), ps.Select(p => CreateVertex(p, Vector2.Zero, color)));
        }

        public void FillTriangleFan(TVertex center, IEnumerable<TVertex> ps)
        {
            var di = new DrawInfo(Texture);
            CheckFlush(di);

            using (var en = ps.GetEnumerator())
            {
                en.MoveNext();
                var centerIndex = AddVertex(center);
                var v0 = AddVertex(en.Current);
                var v1 = v0;
                while (en.MoveNext())
                {
                    var v2 = AddVertex(en.Current);
                    AddIndex(centerIndex);
                    AddIndex(v1);
                    AddIndex(v2);
                    v1 = v2;
                }
            }
        }

        #endregion

        #region Flush

        public void Clear()
        {
            _batches.Clear();
            _nextToDraw = 0;
            _indicesInBatch = 0;
            _verticesSubmitted = 0;
            _lastDrawInfo = null;
        }

        public void Flush()
        {
            // register last batch
            RegisterFlush();

            if (!_batches.Any())
                return;

            BeginFlush(_vb, _verticesSubmitted, _ib, _nextToDraw);

            foreach (var b in _batches)
            {
                SetTexture(b.DrawInfo.Texture);

                DrawBatch(_verticesSubmitted, b.Startindex, b.IndexCount);
            }

            Clear();
        }

        private void CheckFlush(DrawInfo di)
        {
            if (_lastDrawInfo != null && !_lastDrawInfo.Equals(di))
                RegisterFlush();

            _lastDrawInfo = di;
        }

        private void RegisterFlush()
        {
            // if nothing to flush
            if (_indicesInBatch == 0)
                return;

            var bi = new BatchInfo(_lastDrawInfo, _nextToDraw, _indicesInBatch);
            _batches.Add(bi);

            _nextToDraw = _nextToDraw + _indicesInBatch;
            _indicesInBatch = 0;
        }

        #endregion

        private int AddVertex(Vector2 position, Color color)
        {
            return AddVertex(CreateVertex(position, Vector2.Zero, color));
        }

        private int AddVertex(Vector2 position, Color color, Vector2 uv)
        {
            return AddVertex(CreateVertex(position, uv, color));
        }

        private int AddVertex(TVertex v)
        {
            TransformVertexPosition(ref v, TransformMatrix);
            var i = _verticesSubmitted;
            _vb[i] = v;
            _verticesSubmitted++;
            return i;
        }

        private void AddIndex(int index)
        {
            var i = _nextToDraw + _indicesInBatch;
            _ib[i] = index;
            _indicesInBatch++;
        }
    }
}
