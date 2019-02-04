using System;
using System.Collections.Generic;
using System.Text;
using Microsoft.Xna.Framework;

namespace SimplexCore
{
    public class Triangle
    {
        public Vector2 Point1;
        public Vector2 Point2;
        public Vector2 Point3;

        public Triangle()
        {

        }

        public Triangle(Vector2 p1, Vector2 p2, Vector2 p3)
        {
            Point1 = p1;
            Point2 = p2;
            Point3 = p3;
        }
    }
}
