using System;
using System.Collections.Generic;
using System.Text;

namespace SimplexCore
{
    public class ObjectLayer : RoomLayer
    {
        public List<GameObject> Objects = new List<GameObject>();

        public ObjectLayer()
        {
            LayerType = LayerTypes.typeObject;
        }
    }
}
