using System;
using System.Collections.Generic;
using System.Text;
using Microsoft.Xna.Framework;
using Microsoft.Xna.Framework.Graphics;
using MonoGame.Extended;
using MonoGame.Extended.TextureAtlases;
using Color = System.Drawing.Color;
using Texture2D = Microsoft.Xna.Framework.Graphics.Texture2D;

namespace SimplexCore
{
    public static partial class Sgml
    {
        static Texture2D pixel;
        private static VertexPositionColor[] vertices;

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

        public static void draw_triangle(double x1, double y1, double x2, double y2, double x3, double y3, bool outline)
        {
            vertices = new VertexPositionColor[3];
            vertices[0] = new VertexPositionColor(new Vector3((float)x1, (float)y1, 0), Microsoft.Xna.Framework.Color.Red);
            vertices[1] = new VertexPositionColor(new Vector3((float)x2, (float)y2, 0), Microsoft.Xna.Framework.Color.Green);
            vertices[2] = new VertexPositionColor(new Vector3((float)x3, (float)y3, 0), Microsoft.Xna.Framework.Color.Blue);

            vb = new VertexBuffer(sb.GraphicsDevice, typeof(VertexPositionColor), 3, BufferUsage.WriteOnly);
            vb.SetData<VertexPositionColor>(vertices);


            sb.GraphicsDevice.SetVertexBuffer(vb);

            RasterizerState rasterizerState = new RasterizerState();
            rasterizerState.CullMode = CullMode.None;
            rasterizerState.MultiSampleAntiAlias = true;
            sb.GraphicsDevice.RasterizerState = rasterizerState;

            foreach (EffectPass pass in be.CurrentTechnique.Passes)
            {
                pass.Apply();
                sb.GraphicsDevice.DrawPrimitives(PrimitiveType.TriangleList, 0, 1);
            }

            vb.Dispose();
            rasterizerState.Dispose();
        } 




    }
}
