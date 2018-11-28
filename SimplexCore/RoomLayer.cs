using System;
using System.Collections.Generic;
using System.Text;

namespace SimplexCore
{

    [Serializable]
    public class RoomLayer
    {
        public enum LayerTypes
        {
            typeObject,
            typeTile,
            typeAsset
        }

        public string Name { get; set;}
        public LayerTypes LayerType { get; set; }
        public int Position { get; set; }
        public int Depth { get; set; }
    }
}
