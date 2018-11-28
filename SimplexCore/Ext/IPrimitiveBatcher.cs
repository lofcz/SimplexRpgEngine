using Microsoft.Xna.Framework;
using MonoGame.Extended;
using System;
using System.Collections.Generic;
using System.Text;

namespace SimplexCore.Ext
{
    interface IPrimitiveBatcher
    {

        void DrawLine(Vector2 p1, Vector2 p2, Color color, float lineWidth);
        void DrawLineStrip(IEnumerable<Vector2> points, Color color, float lineWidth);

        void DrawRect(RectangleF rect, Color color, float lineWidth);
        void DrawRoundedRect(RectangleF rectangle, float radius, int segments, Color color, int lineWidth);
        void DrawRoundedRect(RectangleF rectangle,
            float radiusTl, int segmentsTl,
            float radiusTr, int segmentsTr,
            float radiusBr, int segmentsBr,
            float radiusBl, int segmentsBl,
            Color color, int lineWidth = 1);

        void FillRect(RectangleF rect, Color c);
        void FillRoundedRect(RectangleF rectangle, float radius, int segments, Color color);

        void DrawCircle(Vector2 center, float radius, Color color, int sides, float lineWidth);
        void DrawCircleSegment(Vector2 center, float radius, float start, float end, Color color, int sides, float lineWidth);
        void FillCircle(Vector2 center, float radius, Color color, int sides);
        void FillCircleSegment(Vector2 center, float radius, float start, float end, Color color, int sides);

        void DrawString(StringBuilder text, Vector2 position, float size, Color color);

        void Clear();
        void Flush();
    }
}
