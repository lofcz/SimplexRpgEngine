using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Text;
using Microsoft.Xna.Framework;
using Microsoft.Xna.Framework.Graphics;
using MonoGame.Extended;
using MonoGame.Extended.Sprites;
using MonoGame.Extended.TextureAtlases;
using Color = System.Drawing.Color;
using Point = Microsoft.Xna.Framework.Point;
using Rectangle = Microsoft.Xna.Framework.Rectangle;
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
        public static Vector2 GetCentroid(Vector3[] nodes)
        {
            float x = 0, y = 0, area = 0, k;
            PointF a, b = new PointF(nodes[nodes.Length - 1].X, nodes[nodes.Length - 1].Y);

            for (int i = 0; i < nodes.Length; i++)
            {
                a = new PointF(nodes[i].X, nodes[i].Y);

                k = a.Y * b.X - a.X * b.Y;
                area += k;
                x += (a.X + b.X) * k;
                y += (a.Y + b.Y) * k;

                b = a;
            }
            area *= 3;

            return (area == 0) ? Vector2.Zero : new Vector2(x /= area, y /= area);
        }

        static Vector3 RotateVec3(Vector3 pointToRotate, Vector3 centerPoint, double angleInDegrees)
        {
            double angleInRadians = angleInDegrees * (Math.PI / 180);
            double cosTheta = Math.Cos(angleInRadians);
            double sinTheta = Math.Sin(angleInRadians);
            return new Vector3
            {
                X =
                    (float)
                    (cosTheta * (pointToRotate.X - centerPoint.X) -
                     sinTheta * (pointToRotate.Y - centerPoint.Y) + centerPoint.X),
                Y =
                    (float)
                    (sinTheta * (pointToRotate.X - centerPoint.X) +
                     cosTheta * (pointToRotate.Y - centerPoint.Y) + centerPoint.Y),
                Z = 0
            };
        }

        public static void draw_triangle(double x1, double y1, double x2, double y2, double x3, double y3, bool outline, double angle = 0)
        {
            Microsoft.Xna.Framework.Color fc = FinalizeColor(DrawColor);

            vertices = new VertexPositionColor[3];
            vertices[0] = new VertexPositionColor(new Vector3((float)x1, (float)y1, 0), fc);
            vertices[1] = new VertexPositionColor(new Vector3((float)x2, (float)y2, 0), fc);
            vertices[2] = new VertexPositionColor(new Vector3((float)x3, (float)y3, 0), fc);

            if (Math.Abs(angle) > 0.001)
            {
                Vector2 pp = GetCentroid(new Vector3[] { vertices[0].Position, vertices[1].Position, vertices[2].Position });

                vertices[0].Position = RotateVec3(vertices[0].Position, new Vector3(pp, 0), angle);
                vertices[1].Position = RotateVec3(vertices[1].Position, new Vector3(pp, 0), angle);
                vertices[2].Position = RotateVec3(vertices[2].Position, new Vector3(pp, 0), angle);
            }


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

        public static void draw_fluid(Spring[] springs)
        {
            List<VertexPositionColor> verticles = new List<VertexPositionColor>();

            // stretch the springs' x positions to take up the entire window
            float scale = 800 / (springs.Length - 1f); // be sure to use float division

            for (int i = 1; i < springs.Length; i++)
            {
                // create the four corners of our triangle.
                Vector2 p1 = new Vector2((i - 1) * scale, springs[i - 1].Height);
                Vector2 p2 = new Vector2(i * scale, springs[i].Height);
                Vector2 p3 = new Vector2(p2.X, 400);
                Vector2 p4 = new Vector2(p1.X, 400);

                VertexPositionColor v1 = new VertexPositionColor(new Vector3(p1, 0), FinalizeColor(DrawColor));
                VertexPositionColor v2 = new VertexPositionColor(new Vector3(p2, 0), FinalizeColor(DrawColor));
                VertexPositionColor v3 = new VertexPositionColor(new Vector3(p3, 0), FinalizeColor(DrawColor));
                VertexPositionColor v4 = new VertexPositionColor(new Vector3(p4, 0), FinalizeColor(DrawColor));

                verticles.Add(v1);
                verticles.Add(v2);
                verticles.Add(v3);

                verticles.Add(v1);
                verticles.Add(v3);
                verticles.Add(v4);
            }

            vb = new VertexBuffer(sb.GraphicsDevice, typeof(VertexPositionColor), verticles.Count, BufferUsage.WriteOnly);
            vb.SetData<VertexPositionColor>(verticles.ToArray());

            sb.GraphicsDevice.SetVertexBuffer(vb);

            RasterizerState rasterizerState = new RasterizerState();
            rasterizerState.CullMode = CullMode.None;
            rasterizerState.MultiSampleAntiAlias = true;
            rasterizerState.FillMode = FillMode.Solid;

            sb.GraphicsDevice.RasterizerState = rasterizerState;

            foreach (EffectPass pass in be.CurrentTechnique.Passes)
            {
                pass.Apply();
                sb.GraphicsDevice.DrawPrimitives(PrimitiveType.TriangleList, 0, verticles.Count / 3);
            }

            vb.Dispose();
            rasterizerState.Dispose();

        }

        public static void draw_roundrect(Vector2 pos1, Vector2 pos2, bool outline, int r = 32)
        {
            List<VertexPositionColor> verticles = new List<VertexPositionColor>();

            // Core rectangle
            float x1 = pos1.X + r;
            float y1 = pos1.Y + r;

            float x2 = pos2.X - r;
            float y2 = pos2.Y - r;

            float x3 = pos1.X + r;
            float y3 = pos2.Y - r;

            float x4 = pos2.X - r;
            float y4 = pos1.Y + r;

            VertexPositionColor v1 = new VertexPositionColor(new Vector3(x1, y1, 0), FinalizeColor(DrawColor));
            VertexPositionColor v2 = new VertexPositionColor(new Vector3(x2, y2, 0), FinalizeColor(DrawColor));
            VertexPositionColor v3 = new VertexPositionColor(new Vector3(x3, y3, 0), FinalizeColor(DrawColor));

            VertexPositionColor v4 = new VertexPositionColor(new Vector3(x1, y1, 0), FinalizeColor(DrawColor));
            VertexPositionColor v5 = new VertexPositionColor(new Vector3(x4, y4, 0), FinalizeColor(DrawColor));
            VertexPositionColor v6 = new VertexPositionColor(new Vector3(x2, y2, 0), FinalizeColor(DrawColor));


            verticles.Add(v1);
            verticles.Add(v2);
            verticles.Add(v3);

            verticles.Add(v4);
            verticles.Add(v5);
            verticles.Add(v6);

            // Top rectangle
            x1 = pos1.X + r;
            y1 = pos1.Y;

            x2 = pos1.X + r;
            y2 = pos1.Y + r;

            x3 = pos2.X - r;
            y3 = pos1.Y + r;

            x4 = pos2.X - r;
            y4 = pos1.Y;

            v1 = new VertexPositionColor(new Vector3(x1, y1, 0), FinalizeColor(DrawColor));
            v2 = new VertexPositionColor(new Vector3(x2, y2, 0), FinalizeColor(DrawColor));
            v3 = new VertexPositionColor(new Vector3(x3, y3, 0), FinalizeColor(DrawColor));

            verticles.Add(v1);
            verticles.Add(v2);
            verticles.Add(v3);

            v1 = new VertexPositionColor(new Vector3(x1, y1, 0), FinalizeColor(DrawColor));
            v2 = new VertexPositionColor(new Vector3(x3, y3, 0), FinalizeColor(DrawColor));
            v3 = new VertexPositionColor(new Vector3(x4, y4, 0), FinalizeColor(DrawColor));

            verticles.Add(v1);
            verticles.Add(v2);
            verticles.Add(v3);

            // Left rectangle
            x1 = pos1.X;
            y1 = pos1.Y + r;

            x2 = pos1.X + r;
            y2 = pos1.Y + r;

            x3 = pos1.X;
            y3 = pos2.Y - r;

            x4 = pos1.X + r;
            y4 = pos2.Y - r;

            v1 = new VertexPositionColor(new Vector3(x1, y1, 0), FinalizeColor(DrawColor));
            v2 = new VertexPositionColor(new Vector3(x2, y2, 0), FinalizeColor(DrawColor));
            v3 = new VertexPositionColor(new Vector3(x4, y4, 0), FinalizeColor(DrawColor));

            verticles.Add(v1);
            verticles.Add(v2);
            verticles.Add(v3);

            v1 = new VertexPositionColor(new Vector3(x1, y1, 0), FinalizeColor(DrawColor));
            v2 = new VertexPositionColor(new Vector3(x3, y3, 0), FinalizeColor(DrawColor));
            v3 = new VertexPositionColor(new Vector3(x4, y4, 0), FinalizeColor(DrawColor));

            verticles.Add(v1);
            verticles.Add(v2);
            verticles.Add(v3);

            // Bottom rectangle
            x1 = pos1.X + r;
            y1 = pos2.Y - r;

            x2 = pos1.X + r;
            y2 = pos2.Y;

            x3 = pos2.X - r;
            y3 = pos2.Y;

            x4 = pos2.X - r;
            y4 = pos2.Y - r;

            v1 = new VertexPositionColor(new Vector3(x1, y1, 0), FinalizeColor(DrawColor));
            v2 = new VertexPositionColor(new Vector3(x2, y2, 0), FinalizeColor(DrawColor));
            v3 = new VertexPositionColor(new Vector3(x3, y3, 0), FinalizeColor(DrawColor));

            verticles.Add(v1);
            verticles.Add(v2);
            verticles.Add(v3);

            v1 = new VertexPositionColor(new Vector3(x1, y1, 0), FinalizeColor(DrawColor));
            v2 = new VertexPositionColor(new Vector3(x3, y3, 0), FinalizeColor(DrawColor));
            v3 = new VertexPositionColor(new Vector3(x4, y4, 0), FinalizeColor(DrawColor));

            verticles.Add(v1);
            verticles.Add(v2);
            verticles.Add(v3);

            // Right rectangle
            x1 = pos2.X - r;
            y1 = pos1.Y + r;

            x2 = pos2.X;
            y2 = pos1.Y + r;

            x3 = pos2.X - r;
            y3 = pos2.Y - r;

            x4 = pos2.X;
            y4 = pos2.Y - r;

            v1 = new VertexPositionColor(new Vector3(x1, y1, 0), FinalizeColor(DrawColor));
            v2 = new VertexPositionColor(new Vector3(x2, y2, 0), FinalizeColor(DrawColor));
            v3 = new VertexPositionColor(new Vector3(x4, y4, 0), FinalizeColor(DrawColor));

            verticles.Add(v1);
            verticles.Add(v2);
            verticles.Add(v3);

            v1 = new VertexPositionColor(new Vector3(x1, y1, 0), FinalizeColor(DrawColor));
            v2 = new VertexPositionColor(new Vector3(x3, y3, 0), FinalizeColor(DrawColor));
            v3 = new VertexPositionColor(new Vector3(x4, y4, 0), FinalizeColor(DrawColor));

            verticles.Add(v1);
            verticles.Add(v2);
            verticles.Add(v3);

            // TOP-LEFT CIRCLE
            draw_circle(new Vector2(pos1.X + r, pos1.Y + r), r * 2, false, 180, 270);
            draw_circle(new Vector2(pos2.X - r, pos1.Y + r), r * 2, false, 90, 180);
            draw_circle(new Vector2(pos1.X + r, pos2.Y - r), r * 2, false, 270, 360);
            draw_circle(new Vector2(pos2.X - r, pos2.Y - r), r * 2, false, 0, 90);

            // Draw batch here
            // -----------------------------------------------------------------------------------------------------------------
            vb = new VertexBuffer(sb.GraphicsDevice, typeof(VertexPositionColor), verticles.Count, BufferUsage.WriteOnly);
            vb.SetData<VertexPositionColor>(verticles.ToArray());

            sb.GraphicsDevice.SetVertexBuffer(vb);

            RasterizerState rasterizerState = new RasterizerState();
            rasterizerState.CullMode = CullMode.None;
            rasterizerState.MultiSampleAntiAlias = true;
            rasterizerState.FillMode = FillMode.Solid;

            sb.GraphicsDevice.RasterizerState = rasterizerState;

            foreach (EffectPass pass in be.CurrentTechnique.Passes)
            {
                pass.Apply();
                sb.GraphicsDevice.DrawPrimitives(PrimitiveType.TriangleList, 0, verticles.Count / 3);
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

        public static void draw_ellipse(Vector2 pos, Vector2 exct, float theta)
        {
            Microsoft.Xna.Framework.Color fc = FinalizeColor(DrawColor);
            int vertexCount = 40;

            VertexPositionColor[] vertices = new VertexPositionColor[vertexCount];
            //Drawing an Ellipse with its major axis parallel to the x-axis. Rotation can be applied to change this.
            Vector3 position = Vector3.One;
            const float max = MathHelper.Pi;
            //2 * max since we're moving from -Pi to +Pi in the loop.
            float step = 2 * max / (float) vertexCount;
            int i = 0;
            //Optional Axis and angle rotation for the ellipse (See later notes):
            //Vector3 axis = new Vector3(0, 0, -1);
            float angle = MathHelper.ToRadians(theta);

            for (float t = -max; t <= max; t += step)
            {
                //Formula shamelessly taken from wikipedia
                position = new Vector3(exct.X + pos.X * (float)Math.Cos((double)t), exct.Y + pos.Y * (float)Math.Sin((double)t), 0f);
                //Optional Rotation for the Ellipse:
                position = Vector3.Transform(position, Matrix.CreateFromAxisAngle(new Vector3(0, 0, angle), angle));
                vertices[i] = new VertexPositionColor(position, fc);
                i++;
            }

            //Optional Rotation for the Ellipse:
         
            //then add the first vector again so it's a complete loop (sounds familiar)
            position = new Vector3(exct.X + pos.X * (float)Math.Cos((double)-max), exct.Y + pos.Y * (float)Math.Sin((double)-max), 0f);
            position = Vector3.Transform(position, Matrix.CreateFromAxisAngle(new Vector3(0, 0, angle), angle));
            vertices[vertexCount - 1] = new VertexPositionColor(position, fc);


            vb = new VertexBuffer(sb.GraphicsDevice, typeof(VertexPositionColor), vertices.Length,
                BufferUsage.WriteOnly);
            vb.SetData<VertexPositionColor>(vertices.ToArray());


            sb.GraphicsDevice.SetVertexBuffer(vb);

            RasterizerState rasterizerState = new RasterizerState();
            rasterizerState.CullMode = CullMode.None;
            rasterizerState.MultiSampleAntiAlias = true;
            rasterizerState.FillMode = FillMode.Solid;

            sb.GraphicsDevice.RasterizerState = rasterizerState;

            foreach (EffectPass pass in be.CurrentTechnique.Passes)
            {
                pass.Apply();
                sb.GraphicsDevice.DrawPrimitives(PrimitiveType.LineStrip, 0, (vertices.Length - 1));
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
                distance = (int)r - 4;
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
                    angle = (i / 57.2961161551924f);

                    float x2 = xPos + (((int)r / 2f) * (float) Math.Sin(angle));
                    float y2 = yPos + (((int)r / 2f) * (float) Math.Cos(angle));

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
