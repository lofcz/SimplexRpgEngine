using Microsoft.Xna.Framework.Graphics;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.IO;
using System.Text;
using Microsoft.Xna.Framework;

namespace SimplexCore
{
    public static partial class Sgml
    {
        public static string convert_to_base(int a, int baseSize)
        {
            return Convert.ToString(a, baseSize);
        }

        public static Bitmap convert_to_bitmap(Texture2D tex)
        {
            MemoryStream ms = new MemoryStream();
            tex.SaveAsPng(ms, tex.Width, tex.Height);

            return new Bitmap(ms);
        }

        public static Bitmap convert_to_bitmap(Texture2D tex, int w, int h)
        {
            MemoryStream m = new MemoryStream();
            RenderTarget2D surface = surface_create(tex.Width, tex.Height);
            surface_set_target(surface);
            draw_sprite(tex, -2, Vector2.Zero);
            tex.SaveAsPng(m, w, h);
            surface_reset_target();

            MemoryStream ms = surface_save_ext_memory(surface, w,h);
            return new Bitmap(ms);
        }
    }
}
