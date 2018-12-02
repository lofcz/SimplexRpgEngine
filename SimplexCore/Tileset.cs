using System;
using System.Collections.Generic;
using System.Text;

namespace SimplexCore
{
    public class Tileset
    {
        public string Name { get; set; }
        public int TileSize { get; set; }
        public List<AutotileDefinition> AutotileLib { get; set; }
    }
}
