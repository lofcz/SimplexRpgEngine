using System;
using System.Collections.Generic;
using System.Text;
using System.Xml.Serialization;
using Microsoft.Xna.Framework;

namespace SimplexCore
{
    [Serializable]
    public class GameRoom
    {
        public Vector2 Size { get; set; }
        public string Name { get; set; }
        public Vector2 ViewSize { get; set; }

        [XmlIgnore]
        public List<RoomLayer> Layers;

        public GameRoom()
        {
            Size = new Vector2(1024, 768);
            Name = "Unnamed room";
            ViewSize = new Vector2(Size.X, Size.Y);
            Layers = new List<RoomLayer>();
        }
    }
}
