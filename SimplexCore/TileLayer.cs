using System;
using System.Collections.Generic;
using System.Text;
using System.Xml.Serialization;
using SimplexCore;

namespace SimplexCore
{
    [Serializable]
    public class TileLayer : RoomLayer
    {
        [XmlIgnore]
        public int[,] Data;

        public List<Tile> Tiles;
        public string TilelistName;

        [XmlIgnore]
        public Tileset Tileset;

        public TileLayer()
        {
            LayerType = LayerTypes.typeTile;
        }
    }
}
