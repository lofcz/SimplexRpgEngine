using System;
using System.Collections.Generic;
using System.Text;
using Microsoft.Xna.Framework;
using Microsoft.Xna.Framework.Graphics;
using MonoGame.Extended;
using MonoGame.Extended.Sprites;
using MonoGame.Extended.TextureAtlases;
using Color = System.Drawing.Color;
using Texture2D = Microsoft.Xna.Framework.Graphics.Texture2D;

namespace SimplexCore
{
    public static partial class Sgml
    {
        static Texture2D pixel;
        private static VertexPositionColor[] vertices;
        public static GameObject currentObject;

       /* public static void draw_circle(double x, double y, double r, bool outline, double thickness = 1)
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
       // }
   // */
        public static void draw_triangle(double x1, double y1, double x2, double y2, double x3, double y3, bool outline)
        {
            Microsoft.Xna.Framework.Color fc = FinalizeColor(DrawColor);

            vertices = new VertexPositionColor[3];
            vertices[0] = new VertexPositionColor(new Vector3((float)x1, (float)y1, 0), fc);
            vertices[1] = new VertexPositionColor(new Vector3((float)x2, (float)y2, 0), fc);
            vertices[2] = new VertexPositionColor(new Vector3((float)x3, (float)y3, 0), fc);

            vb = new VertexBuffer(sb.GraphicsDevice, typeof(VertexPositionColor), 3, BufferUsage.WriteOnly);
            vb.SetData<VertexPositionColor>(vertices);


            sb.GraphicsDevice.SetVertexBuffer(vb);

            RasterizerState rasterizerState = new RasterizerState();
            rasterizerState.CullMode = CullMode.None;
            rasterizerState.MultiSampleAntiAlias = false;

            if (outline)
            {
                rasterizerState.FillMode = FillMode.WireFrame;
            }

            sb.GraphicsDevice.RasterizerState = rasterizerState;

            foreach (EffectPass pass in be.CurrentTechnique.Passes)
            {
                pass.Apply();
                sb.GraphicsDevice.DrawPrimitives(PrimitiveType.TriangleList, 0, 1);
            }

            vb.Dispose();
            rasterizerState.Dispose();
        }

        public static void draw_sprite(Texture2D sprite, double subimg, Vector2 position)
        {
                int y = ((int) subimg / currentObject.Sprite.TextureCellsPerRow);
                int x = ((int) subimg % currentObject.Sprite.TextureCellsPerRow);

                //Debug.WriteLine("x:" + x + " y: " + y);

                Rectangle ImageRectangle = new Rectangle(x * currentObject.Sprite.cellW,
                    y * (int) currentObject.Sprite.cellH, (int) currentObject.Sprite.cellW,
                    (int) currentObject.Sprite.cellH);

                sb.Begin(transformMatrix: m);
                sb.Draw(sprite, position, ImageRectangle, FinalizeColor(DrawColor), currentObject.Sprite.ImageAngle, new Vector2(0, 0), currentObject.Sprite.ImageScale, SpriteEffects.None, 1);
                sb.End();

        }

        public static void draw_line(Vector2 pos1, Vector2 pos2)
        {
            VertexPositionColor v1 = new VertexPositionColor(new Vector3(pos1, 0), FinalizeColor(DrawColor));
            VertexPositionColor v2 = new VertexPositionColor(new Vector3(pos2, 0), FinalizeColor(DrawColor));

            vb = new VertexBuffer(sb.GraphicsDevice, typeof(VertexPositionColor), 2, BufferUsage.WriteOnly);
            vb.SetData<VertexPositionColor>(new []{v1, v2});

            sb.GraphicsDevice.SetVertexBuffer(vb);

            RasterizerState rasterizerState = new RasterizerState();
            rasterizerState.CullMode = CullMode.None;
            rasterizerState.MultiSampleAntiAlias = true;
            rasterizerState.FillMode = FillMode.Solid;

            sb.GraphicsDevice.RasterizerState = rasterizerState;

            foreach (EffectPass pass in be.CurrentTechnique.Passes)
            {
                pass.Apply();
                sb.GraphicsDevice.DrawPrimitives(PrimitiveType.LineList, 0, 1);
            }

            vb.Dispose();
            rasterizerState.Dispose();

        }

        public static void draw_line_width(Vector2 pos1, Vector2 pos2, int width)
        {
            Vector2 newVec = pos2 - pos1;
            Vector3 newVector = Vector3.Cross(new Vector3(newVec, 0), Vector3.Forward);
            newVector.Normalize();
            newVec.X = newVector.X;
            newVec.Y = newVector.Y;

            Vector2 x1 = width * newVec + pos2;
            Vector2 x2 = -width * newVec + pos1;
            Vector2 x3 = -width * newVec + pos2;
            Vector2 x4 = width * newVec + pos1;

            VertexPositionColor v1 = new VertexPositionColor(new Vector3(x1, 0), FinalizeColor(DrawColor));
            VertexPositionColor v2 = new VertexPositionColor(new Vector3(x2, 0), FinalizeColor(DrawColor));
            VertexPositionColor v3 = new VertexPositionColor(new Vector3(x3, 0), FinalizeColor(DrawColor));
            VertexPositionColor v4 = new VertexPositionColor(new Vector3(x4, 0), FinalizeColor(DrawColor));

            vb = new VertexBuffer(sb.GraphicsDevice, typeof(VertexPositionColor), 6, BufferUsage.WriteOnly);
            vb.SetData<VertexPositionColor>(new[] { v1, v3, v2, v2, v4, v1 });

            sb.GraphicsDevice.SetVertexBuffer(vb);

            RasterizerState rasterizerState = new RasterizerState();
            rasterizerState.CullMode = CullMode.None;
            rasterizerState.MultiSampleAntiAlias = true;
            rasterizerState.FillMode = FillMode.Solid;

            sb.GraphicsDevice.RasterizerState = rasterizerState;

            foreach (EffectPass pass in be.CurrentTechnique.Passes)
            {
                pass.Apply();
                sb.GraphicsDevice.DrawPrimitives(PrimitiveType.TriangleList, 0, 2);
            }

            vb.Dispose();
            rasterizerState.Dispose();

        }

        public static void draw_line_width_color(Vector2 pos1, Vector2 pos2, int width, Microsoft.Xna.Framework.Color c1, Microsoft.Xna.Framework.Color c2, Microsoft.Xna.Framework.Color c3, Microsoft.Xna.Framework.Color c4)
        {
            Vector2 newVec = pos2 - pos1;
            Vector3 newVector = Vector3.Cross(new Vector3(newVec, 0), Vector3.Forward);
            newVector.Normalize();
            newVec.X = newVector.X;
            newVec.Y = newVector.Y;

            Vector2 x1 = width * newVec + pos2;
            Vector2 x2 = -width * newVec + pos1;
            Vector2 x3 = -width * newVec + pos2;
            Vector2 x4 = width * newVec + pos1;

            VertexPositionColor v1 = new VertexPositionColor(new Vector3(x1, 0), FinalizeColor(c1));
            VertexPositionColor v2 = new VertexPositionColor(new Vector3(x2, 0), FinalizeColor(c2));
            VertexPositionColor v3 = new VertexPositionColor(new Vector3(x3, 0), FinalizeColor(c3));
            VertexPositionColor v4 = new VertexPositionColor(new Vector3(x4, 0), FinalizeColor(c4));

            vb = new VertexBuffer(sb.GraphicsDevice, typeof(VertexPositionColor), 6, BufferUsage.WriteOnly);
            vb.SetData<VertexPositionColor>(new[] { v1, v3, v2, v2, v4, v1 });

            sb.GraphicsDevice.SetVertexBuffer(vb);

            RasterizerState rasterizerState = new RasterizerState();
            rasterizerState.CullMode = CullMode.None;
            rasterizerState.MultiSampleAntiAlias = true;
            rasterizerState.FillMode = FillMode.Solid;

            sb.GraphicsDevice.RasterizerState = rasterizerState;

            foreach (EffectPass pass in be.CurrentTechnique.Passes)
            {
                pass.Apply();
                sb.GraphicsDevice.DrawPrimitives(PrimitiveType.TriangleList, 0, 2);
            }

            vb.Dispose();
            rasterizerState.Dispose();

        }

        public static void draw_circle(Vector2 pos, int r, bool outline, int startAngle = 0, int totalAngle = 360, int distance = 0)
        {
            Microsoft.Xna.Framework.Color fc = FinalizeColor(DrawColor);

            if (outline)
            {
                outline = false;
                distance = r - 4;
            }

            List<VertexPositionColor> circle = new List<VertexPositionColor>();
                //Center of the circle
                float xPos = pos.X;
                float yPos = pos.Y;

                float x1 = xPos;
                float y1 = yPos;

                float angle = 0;
                for (int i = startAngle; i <= totalAngle; i += 10)
                {
                    angle = (i / 57.3f);
                    //angle += (363f / 3f) * ((float)Math.PI / 180f);
                    float x2 = xPos + ((r / 2f) * (float) Math.Sin(angle));
                    float y2 = yPos + ((r / 2f) * (float) Math.Cos(angle));

                    float x3 = xPos + ((distance / 2f) * (float)Math.Sin(angle));
                    float y3 = yPos + ((distance / 2f) * (float)Math.Cos(angle));

                    if (distance == 0)
                    {
                        circle.Add(new VertexPositionColor(new Vector3(x3, y3, 0), fc));

                        circle.Add(new VertexPositionColor(new Vector3(x1, y1, 0), fc));
                        circle.Add(new VertexPositionColor(new Vector3(x2, y2, 0), fc));
                    }
                    else
                    {
                        circle.Add(new VertexPositionColor(new Vector3(x3, y3, 0), fc));

                        circle.Add(new VertexPositionColor(new Vector3(x1, y1, 0), fc));
                        circle.Add(new VertexPositionColor(new Vector3(x2, y2, 0), fc));


                        circle.Add(new VertexPositionColor(new Vector3(x2, y2, 0), fc));
                        circle.Add(new VertexPositionColor(new Vector3(x3, y3, 0), fc));

                        angle = ((i + 10)/ 57.3f);
                        x3 = xPos + ((distance / 2f) * (float)Math.Sin(angle));
                        y3 = yPos + ((distance / 2f) * (float)Math.Cos(angle));
                        circle.Add(new VertexPositionColor(new Vector3(x3, y3, 0), fc));
                    }

                    y1 = y2;
                    x1 = x2;
                }

                vb = new VertexBuffer(sb.GraphicsDevice, typeof(VertexPositionColor), circle.Count,
                    BufferUsage.WriteOnly);
                vb.SetData<VertexPositionColor>(circle.ToArray());


                sb.GraphicsDevice.SetVertexBuffer(vb);

                RasterizerState rasterizerState = new RasterizerState();
                rasterizerState.CullMode = CullMode.None;
                rasterizerState.MultiSampleAntiAlias = true;
                rasterizerState.FillMode = FillMode.Solid;

                sb.GraphicsDevice.RasterizerState = rasterizerState;

                foreach (EffectPass pass in be.CurrentTechnique.Passes)
                {
                    pass.Apply();
                    sb.GraphicsDevice.DrawPrimitives(PrimitiveType.TriangleList, 0, (circle.Count / 3));
                }

                vb.Dispose();
                rasterizerState.Dispose();
            }

        public static void draw_circle_color(Vector2 pos, int r, bool outline, Microsoft.Xna.Framework.Color c1, Microsoft.Xna.Framework.Color c2, int startAngle = 0, int totalAngle = 360, int distance = 0)
        {
            Microsoft.Xna.Framework.Color fc1 = FinalizeColor(c1);
            Microsoft.Xna.Framework.Color fc2 = FinalizeColor(c2);

            if (outline)
            {
                outline = false;
                distance = r - 4;
            }

            List<VertexPositionColor> circle = new List<VertexPositionColor>();
            //Center of the circle
            float xPos = pos.X;
            float yPos = pos.Y;

            float x1 = xPos;
            float y1 = yPos;

            float angle = 0;
            for (int i = startAngle; i <= totalAngle; i += 10)
            {
                angle = (i / 57.3f);
                //angle += (363f / 3f) * ((float)Math.PI / 180f);
                float x2 = xPos + ((r / 2f) * (float)Math.Sin(angle));
                float y2 = yPos + ((r / 2f) * (float)Math.Cos(angle));

                float x3 = xPos + ((distance / 2f) * (float)Math.Sin(angle));
                float y3 = yPos + ((distance / 2f) * (float)Math.Cos(angle));

                if (distance == 0)
                {
                    circle.Add(new VertexPositionColor(new Vector3(x3, y3, 0), fc1));

                    circle.Add(new VertexPositionColor(new Vector3(x1, y1, 0), fc2));
                    circle.Add(new VertexPositionColor(new Vector3(x2, y2, 0), fc2));
                }
                else
                {
                    circle.Add(new VertexPositionColor(new Vector3(x3, y3, 0), fc1));

                    circle.Add(new VertexPositionColor(new Vector3(x1, y1, 0), fc2));
                    circle.Add(new VertexPositionColor(new Vector3(x2, y2, 0), fc2));


                    circle.Add(new VertexPositionColor(new Vector3(x2, y2, 0), fc2));
                    circle.Add(new VertexPositionColor(new Vector3(x3, y3, 0), fc1));

                    angle = ((i + 10) / 57.3f);
                    x3 = xPos + ((distance / 2f) * (float)Math.Sin(angle));
                    y3 = yPos + ((distance / 2f) * (float)Math.Cos(angle));
                    circle.Add(new VertexPositionColor(new Vector3(x3, y3, 0), fc1));
                }

                y1 = y2;
                x1 = x2;
            }

            vb = new VertexBuffer(sb.GraphicsDevice, typeof(VertexPositionColor), circle.Count,
                BufferUsage.WriteOnly);
            vb.SetData<VertexPositionColor>(circle.ToArray());


            sb.GraphicsDevice.SetVertexBuffer(vb);

            RasterizerState rasterizerState = new RasterizerState();
            rasterizerState.CullMode = CullMode.None;
            rasterizerState.MultiSampleAntiAlias = true;
            rasterizerState.FillMode = FillMode.Solid;

            sb.GraphicsDevice.RasterizerState = rasterizerState;

            sb.GraphicsDevice.BlendState = BlendState.Additive;
            foreach (EffectPass pass in be.CurrentTechnique.Passes)
            {
                pass.Apply();
                sb.GraphicsDevice.DrawPrimitives(PrimitiveType.TriangleList, 0, (circle.Count / 3));
               
            }

            vb.Dispose();
            rasterizerState.Dispose();
        }
    }
}
