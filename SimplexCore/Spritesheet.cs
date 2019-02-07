using System;
using System.Collections.Generic;
using System.Text;
using Microsoft.Xna.Framework.Graphics;
using Newtonsoft.Json;

namespace SimplexCore
{
    public class Spritesheet
    {
        public string Name { get; set; }
        public int CellWidth { get; set; }
        public int CellHeight { get; set; }
        public int Rows { get; set; }

        public bool TempResource { get; set; }

        public bool OwnTexturePage { get; set; }

        [JsonIgnore]
        public Texture2D Texture { get; set; }
    }
}
