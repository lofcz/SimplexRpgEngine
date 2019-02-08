using Microsoft.Xna.Framework.Graphics;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.Globalization;
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

        public static Microsoft.Xna.Framework.Color merge_color(Microsoft.Xna.Framework.Color color, Microsoft.Xna.Framework.Color backColor, double amount)
        {
            byte r = (byte)((color.R * amount) + backColor.R * (1 - amount));
            byte g = (byte)((color.G * amount) + backColor.G * (1 - amount));
            byte b = (byte)((color.B * amount) + backColor.B * (1 - amount));
            return Microsoft.Xna.Framework.Color.FromNonPremultiplied(r, g, b, 255);
        }

        public static Microsoft.Xna.Framework.Color color_from_hsl(float h, float s, float l)
        {
            var hsl = new Vector4(h, s, l, 1);
            var color = new Vector4(0, 0, 0, hsl.W);


            if (hsl.Y == 0.0f)
            {
                color.X = color.Y = color.Z = hsl.Z;
            }
            else
            {
                var q = hsl.Z < 0.5f ? hsl.Z * (1.0f + hsl.Y) : hsl.Z + hsl.Y - hsl.Z * hsl.Y;
                var p = 2.0f * hsl.Z - q;

                color.X = HueToRgb(p, q, hsl.X + 1.0f / 3.0f);
                color.Y = HueToRgb(p, q, hsl.X);
                color.Z = HueToRgb(p, q, hsl.X - 1.0f / 3.0f);
            }

            return new Microsoft.Xna.Framework.Color(color);
        }

        private static float HueToRgb(float p, float q, float t)
        {
            if (t < 0.0f) t += 1.0f;
            if (t > 1.0f) t -= 1.0f;
            if (t < 1.0f / 6.0f) return p + (q - p) * 6.0f * t;
            if (t < 1.0f / 2.0f) return q;
            if (t < 2.0f / 3.0f) return p + (q - p) * (2.0f / 3.0f - t) * 6.0f;
            return p;
        }

        public static string color_to_hex(Microsoft.Xna.Framework.Color color)
        {
            var rx = $"{color.R:x2}";
            var gx = $"{color.G:x2}";
            var bx = $"{color.B:x2}";
            var ax = $"{color.A:x2}";
            return $"#{rx}{gx}{bx}{ax}";
        }

        public static Microsoft.Xna.Framework.Color color_from_hex(string value)
        {
            if (string.IsNullOrEmpty(value))
                return Microsoft.Xna.Framework.Color.Transparent;
            var startIndex = 0;
            if (value.StartsWith("#"))
                startIndex++;
            var r = int.Parse(value.Substring(startIndex, 2), NumberStyles.HexNumber);
            var g = int.Parse(value.Substring(startIndex + 2, 2), NumberStyles.HexNumber);
            var b = int.Parse(value.Substring(startIndex + 4, 2), NumberStyles.HexNumber);
            var a = value.Length > 6 + startIndex ? int.Parse(value.Substring(startIndex + 6, 2), NumberStyles.HexNumber) : 255;

            return new Microsoft.Xna.Framework.Color(r, g, b, a);
        }
    }
}
