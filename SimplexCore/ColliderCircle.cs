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

        public static Vector2 CircleCircleCollisionPoint(ColliderCircle a, ColliderCircle b)
        {
            Vector2 point = Vector2.Zero;
            point.X = (float)(((a.Position.X * b.Radius) + (b.Position.X * a.Radius)) / (a.Radius + b.Radius));
            point.Y = (float)(((a.Position.Y * b.Radius) + (b.Position.Y * a.Radius)) / (a.Radius + b.Radius));

            return point;
        }

        public static void ResolveCircleCircleCollisionElastic(GameObject a, GameObject b, ColliderCircle c1, ColliderCircle c2)
        {
            double colAngle = point_direction(c1.Position.X, c1.Position.Y, c2.Position.X, c2.Position.Y);

            double v1x = a.Speed * cos(degtorad(a.Direction - colAngle));
            double v1y = a.Speed * sin(degtorad(a.Direction - colAngle));
            double v2x = b.Speed * cos(degtorad(b.Direction - colAngle));
            double v2y = b.Speed * sin(degtorad(b.Direction - colAngle));


            a.Velocity.X = (a.Velocity.X * (float)(a.Mass - b.Mass) + (2 * (float)b.Mass * b.Velocity.X)) / (float)(a.Mass + b.Mass);
            a.Velocity.Y = (a.Velocity.Y * (float)(a.Mass - b.Mass) + (2 * (float)b.Mass * b.Velocity.Y)) / (float)(a.Mass + b.Mass);
            b.Velocity.X = (b.Velocity.X * (float)(a.Mass - b.Mass) + (2 * (float)b.Mass * a.Velocity.X)) / (float)(a.Mass + b.Mass);
            b.Velocity.Y = (b.Velocity.Y * (float)(a.Mass - b.Mass) + (2 * (float)b.Mass * a.Velocity.Y)) / (float)(a.Mass + b.Mass);

            a.Position.X += a.Velocity.X;
            a.Position.Y += a.Velocity.Y;
            b.Position.X += b.Velocity.X;
            b.Position.Y += b.Velocity.Y;
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
