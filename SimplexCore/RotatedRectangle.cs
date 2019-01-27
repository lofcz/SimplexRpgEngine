using System;
using System.Collections.Generic;
using System.Text;
using Microsoft.Xna.Framework;

namespace SimplexCore
{
    public class RotatedRectangle
    {
        public Vector2 Point1 { get; set; }
        public Vector2 Point2 { get; set; }
        public Vector2 Point3 { get; set; }
        public Vector2 Point4 { get; set; }
        public float Angle { get; set; }

        public RotatedRectangle(Vector2 p1, Vector2 p2, Vector2 p3, Vector2 p4)
        {
            Point1 = p1;
            Point2 = p2;
            Point3 = p3;
            Point4 = p4;
        }

        float isLeft(Vector2 P0, Vector2 P1, Vector2 P2)
        {
            return (P1.X - P0.X) * (P2.Y - P0.Y) - (P2.X - P0.X) * (P1.Y - P0.Y);
        }

        public bool Contains(Vector2 point)
        {
            return (Sgml.point_in_triangle(Point1, Point2, Point3, point) || Sgml.point_in_triangle(Point3, Point4, Point1, point));
        }
    }


}
