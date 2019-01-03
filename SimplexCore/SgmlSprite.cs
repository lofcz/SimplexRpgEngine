using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Microsoft.Xna.Framework.Graphics;

namespace SimplexCore
{
    public static partial class Sgml
    {
        public static Texture2D sprite_get(string name)
        {
            return Sprites.FirstOrDefault(x => x.Name == name).Texture;
        }
    }
}
