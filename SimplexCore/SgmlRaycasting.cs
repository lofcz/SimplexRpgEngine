using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Text;
using Microsoft.Xna.Framework;
using MonoGame.Extended;

namespace SimplexCore
{
    public static partial class Sgml
    {
        public static bool point_in_rectangle(Point2 point, RectangleF rectangle)
        {
            return rectangle.Contains(point);
        }

        public static bool point_in_triangle(Vector2 p0, Vector2 p1, Vector2 p2, Vector2 p)
        {
            var s = p0.Y * p2.X - p0.X * p2.Y + (p2.Y - p0.Y) * p.X + (p0.X - p2.X) * p.Y;
            var t = p0.X * p1.Y - p0.Y * p1.X + (p0.Y - p1.Y) * p.X + (p1.X - p0.X) * p.Y;

            if ((s < 0) != (t < 0))
                return false;

            var A = -p1.Y * p2.X + p0.Y * (p2.X - p1.X) + p0.X * (p1.Y - p2.Y) + p1.X * p2.Y;

            return A < 0 ? (s <= 0 && s + t >= A) : (s >= 0 && s + t <= A);
        }


        public static RotatedRectangle rectangle_rotate(Rectangle r, Vector2 point, double angle)
        {
            Vector2 p1 = new Vector2(r.X, r.Y);
            p1 = rotate_vector2(p1, point, angle);

            Vector2 p2 = new Vector2(r.X + r.Width, r.Y);
            p2 = rotate_vector2(p2, point, angle);

            Vector2 p3 = new Vector2(r.X, r.Y + r.Height);
            p3 = rotate_vector2(p3, point, angle);

            Vector2 p4 = new Vector2(r.X + r.Width, r.Y + r.Height);
            p4 = rotate_vector2(p4, point, angle);

            return new RotatedRectangle(p1, p2, p3, p4);
        }

        
    }
}
