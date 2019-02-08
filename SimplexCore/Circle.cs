using System;
using System.Collections.Generic;
using System.Text;
using Microsoft.Xna.Framework;

namespace SimplexCore
{
    public class Circle
    {
        public Vector2 Position;
        public float Radius;

        public Circle()
        {

        }

        public Circle(Vector2 position, float radius)
        {
            Position = position;
            Radius = radius;
        }

    }
}

