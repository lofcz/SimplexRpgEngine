using System;
using System.Collections.Generic;
using System.Text;

namespace SimplexCore
{
    public class ColliderBase
    {
        public string Name;
        public GameObject GameObject;
        public ColliderBase AttachToColider;
        public bool AttachToRoot;
        public GameObject Root;

        public static void RegisterCollider(string collider1, Type obj, string collider2, Action<ColliderBase> callback, bool eachFrame)
        {

        }

        public ColliderBase(GameObject root)
        {
            Root = root;
            GameObject = root;
        }

        public ColliderBase()
        {

        }
    }
}
