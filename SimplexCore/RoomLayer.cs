using System;
using System.Collections.Generic;
using System.Text;
using System.Xml.Serialization;

namespace SimplexCore
{

    [Serializable]
    [XmlInclude(typeof(TileLayer))]
    public class RoomLayer
    {
        public enum LayerTypes
        {
            typeObject,
            typeTile,
            typeAsset
        }

        public string Name { get; set; }
        public LayerTypes LayerType { get; set; }
        public int Position { get; set; }
        public int Depth { get; set; }
        public bool Visible;

        public RoomLayer()
        {
            Visible = true;
        }
    }
}
