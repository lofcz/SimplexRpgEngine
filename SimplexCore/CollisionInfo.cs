using System;
using System.Collections.Generic;
using System.Text;
using Microsoft.Xna.Framework;

namespace SimplexCore
{
    public class CollisionInfo
    {
        public Vector2 CollisionNormal;
        public double PenetrationDepth;
        public ColliderBase ColliderA;
        public ColliderBase ColliderB;
    }
}
