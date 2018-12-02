using System;
using System.Collections.Generic;
using System.Text;
using System.Xml.Serialization;
using Microsoft.Xna.Framework;
using Microsoft.Xna.Framework.Content;
using Microsoft.Xna.Framework.Graphics;
using MonoGame.Extended;

namespace SimplexCore
{
    public class Tile
    {
        [XmlIgnore]
        public Texture2D SourceTexture { get; set; }

        public Rectangle DrawRectangle { get; set; }
        public int Index { get; set; }
        public int Bits { get; set; }
        public int PosX { get; set; }
        public int PosY { get; set; }
        public int Score { get; set; }
    }
}
