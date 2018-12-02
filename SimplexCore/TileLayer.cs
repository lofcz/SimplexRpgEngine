using System;
using System.Collections.Generic;
using System.Text;
using System.Xml.Serialization;

namespace SimplexCore
{
    [Serializable]
    public class TileLayer : RoomLayer
    {
        [XmlIgnore]
        public int[,] Data;

        public List<Tile> Tiles = new List<Tile>();
        public string TilelistName;

        [XmlIgnore]
        public Tileset Tileset;

        public TileLayer()
        {
            LayerType = LayerTypes.typeTile;
        }
    }
}
