using Microsoft.Xna.Framework.Graphics;
using System;
using System.Collections.Generic;
using System.Text;

namespace SimplexCore
{
    public class Sprite
    {
        public Texture2D Texture { get; set; }
        public int TextureRows { get; set; }
        public int TextureColumns { get; set; }
        public float ImageSpeed { get; set; }
        public int Size { get; set; }
        public float ImageIndex { get; set; }
    }
}
