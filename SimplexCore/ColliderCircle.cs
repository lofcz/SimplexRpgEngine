using System;
using System.Collections.Generic;
using System.Text;
using System.Windows.Forms;
using Microsoft.Xna.Framework;
using static SimplexCore.Sgml;

namespace SimplexCore
{
    public class ColliderCircle : ColliderBase
    {
        public double Radius;
        public Vector2 Position;

        public static bool CircleInCircle(ColliderCircle a, ColliderCircle b)
        {
            double r = a.Radius + b.Radius;

            var k = r > Math.Sqrt(((a.Position.X - b.Position.X) * (a.Position.X - b.Position.X)) + ((a.Position.Y - b.Position.Y) * (a.Position.Y - b.Position.Y)));

            return k;
        }

        public static CollisionInfo CircleCircleCollision(ColliderCircle a, ColliderCircle b)
        {
            Vector2 difVec = b.Position - a.Position;
            double r2 = a.Radius + b.Radius;
            r2 *= r2;

            // Collision didn't happen
            if (difVec.LengthSquared() > r2)
            {
                return null;
            }
            
            // Collsion approved
            double d = difVec.Length();

            // Setup CollInfo
            CollisionInfo ci = new CollisionInfo();
            ci.ColliderA = a;
            ci.ColliderB = b;

            if (d != 0)
            {
                ci.PenetrationDepth = r2 - d;
                ci.CollisionNormal = new Vector2();
            }
            else // circles are next to each other
            {

            }

            return null;
        }
    }
}
