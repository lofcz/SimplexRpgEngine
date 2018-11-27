using System;
using System.Collections.Generic;
using System.Text;
using Microsoft.Xna.Framework;
using Microsoft.Xna.Framework.Graphics;
using MonoGame.Extended;
using MonoGame.Extended.TextureAtlases;
using SharpDX.Direct3D11;
using Color = System.Drawing.Color;
using Texture2D = Microsoft.Xna.Framework.Graphics.Texture2D;

namespace SimplexCore
{
    public static partial class Sgml
    {
        static Texture2D pixel;

        public static void draw_circle(double x, double y, double r, bool outline, double thickness = 1)
        {
            if (outline)
            {
                sb.DrawCircle((float)x, (float)y, (float)r, drawCirclePrecision, DrawColor, (float)thickness);
            }
            else
            {
                sb.DrawCircle((float)x, (float)y, (float)r, drawCirclePrecision, DrawColor, (float)r);
            }
        }

        public static void draw_circle(Vector2 position, double r, bool outline, double thickness = 1)
        {
            if (outline)
            {
                sb.DrawCircle((float)position.X, (float)position.Y, (float)r, drawCirclePrecision, DrawColor, (float)thickness);
            }
            else
            {
                sb.DrawCircle((float)position.X, (float)position.Y, (float)r, drawCirclePrecision, DrawColor, (float)r);
            }
        }

        public static void draw_circle(Vector2 position, int r, bool outline, Microsoft.Xna.Framework.Color c, double thickness = 1)
        {
            if (outline)
            {
                sb.DrawCircle((float)position.X, (float)position.Y, (float)r, drawCirclePrecision, FinalizeColor(c), (float)thickness);
            }
            else
            {
                sb.DrawCircle((float)position.X, (float)position.Y, (float)r, drawCirclePrecision, FinalizeColor(c), (float)r);
            }


            /*
            Microsoft.Xna.Framework.Color cc = FinalizeColor(c);
            for (int y = -r; y <= r; y++)
            {
                for (int x = -r; x <= r; x++)
                {
                    if (x * x + y * y <= r * r)
                    {
                        sb.DrawPoint(position.X + x, position.Y + y, cc, 1);
                    }                
                }
            }*/
        }




    }
}
