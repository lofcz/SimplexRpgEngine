using System;
using System.Collections.Generic;
using System.Text;
using Microsoft.Xna.Framework;
using Microsoft.Xna.Framework.Graphics;

namespace SimplexCore.Ext
{
    class MgPrimitiveBatcher : PrimitiveBatcherBase<VertexPositionColorTexture, Matrix, Texture2D>
    {

        private readonly GraphicsDevice _graphicsDevice;
        private readonly SpriteBatch _spriteBatch;
        private readonly SpriteFont _font;

        private readonly BasicEffect _basicEffect;

        private readonly VertexBuffer _vb;
        private readonly IndexBuffer _ib;

        public Matrix world;
        public Matrix view;
        public Matrix projection;

        public Texture2D BlankTexture { get; }

        public MgPrimitiveBatcher(GraphicsDevice gd, SpriteFont font)
        {
            _graphicsDevice = gd ?? throw new ArgumentNullException(nameof(gd));
            _font = font ?? throw new ArgumentNullException(nameof(font));

            _spriteBatch = new SpriteBatch(gd);
            _basicEffect = new BasicEffect(gd)
            {
                VertexColorEnabled = true,
                LightingEnabled = false,
                TextureEnabled = true,
                FogEnabled = false,
            };

            BlankTexture = new Texture2D(gd, 1, 1);
            BlankTexture.SetData(new[] { Color.White.PackedValue });
            Texture = BlankTexture;

            FontTexture = _font.Texture;

            var viewport = gd.Viewport;
            TransformMatrix = Matrix.CreateOrthographicOffCenter(0, viewport.Width, viewport.Height, 0, 0, 1);

            _vb = new VertexBuffer(gd, VertexPositionColorTexture.VertexDeclaration, DefaultMaxVertices, BufferUsage.WriteOnly);
            _ib = new IndexBuffer(gd, IndexElementSize.ThirtyTwoBits, DefaultMaxVertices, BufferUsage.WriteOnly);
        }

        protected override VertexPositionColorTexture CreateVertex(Vector2 p, Vector2 uv, Color color)
        {
            return new VertexPositionColorTexture(new Vector3(p.X, p.Y, 0), new Color(color.PackedValue), new Vector2(uv.X, uv.Y));
        }

        protected override void TransformVertexPosition(ref VertexPositionColorTexture v, Matrix transform)
        {
            v.Position = Vector3.Transform(v.Position, transform);
        }

        protected override void SetTexture(Texture2D texture)
        {
            if (texture == null)
                throw new ArgumentNullException(nameof(texture));
            if (texture != _basicEffect.Texture)
                _basicEffect.Texture = texture;
        }

        protected override void BeginFlush(VertexPositionColorTexture[] vertices, int vertexCount, int[] indices, int indexCount)
        {
            _graphicsDevice.BlendState = BlendState.NonPremultiplied;
            _graphicsDevice.DepthStencilState = DepthStencilState.None;
            _graphicsDevice.RasterizerState = RasterizerState.CullNone;
            _graphicsDevice.SamplerStates[0] = SamplerState.LinearWrap;

           // _basicEffect.World = world;
          //  _basicEffect.View = view;
           // _basicEffect.Projection = projection;

            _vb.SetData(vertices, 0, vertexCount);
            _ib.SetData(indices, 0, indexCount);
            _graphicsDevice.SetVertexBuffer(_vb);
            _graphicsDevice.Indices = _ib;
        }

        protected override void DrawBatch(int vertexCount, int indexOffset, int indexCount)
        {
            _basicEffect.CurrentTechnique.Passes[0].Apply();
            _graphicsDevice.DrawIndexedPrimitives(
                PrimitiveType.TriangleList,
                0, indexOffset, indexCount / 3);
        }

        public override void DrawString(StringBuilder text, Vector2 position, float size, Color color)
        {
            _spriteBatch.Begin();
            _spriteBatch.DrawString(_font, text, new Vector2(position.X, position.Y), new Color(color.PackedValue));
            _spriteBatch.End();
        }
    }
}
