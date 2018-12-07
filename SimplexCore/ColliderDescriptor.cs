using System;
using System.Collections.Generic;
using System.Text;
using Microsoft.Xna.Framework;

namespace SimplexCore
{
    public class ColliderDescriptor
    {
        public ColliderBase Collider1;
        public Type ColliderType1;
        public string ColliderName;

        public Type TargetObject;
        public Type ColliderType2;
        public string ColliderName2;

        public bool EachFrame;

        public Action<ColliderBase> Method;
    }
}
