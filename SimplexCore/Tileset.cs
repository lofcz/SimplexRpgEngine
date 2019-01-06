using System;
using System.Collections.Generic;
using System.Text;
using System.Xml.Serialization;
using Microsoft.Xna.Framework.Graphics;
using Newtonsoft.Json;

namespace SimplexCore
{
    public class Tileset
    {
        [JsonIgnore]
        [XmlIgnore]
        public Texture2D Texture { get; set; }
        public string Name { get; set; }
        public int TileSize { get; set; }
        public List<AutotileDefinition> AutotileLib { get; set; }
    }
}
