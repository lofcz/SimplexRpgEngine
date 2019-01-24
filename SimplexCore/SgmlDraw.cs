using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using Microsoft.Xna.Framework;
using Microsoft.Xna.Framework.Graphics;
using MonoGame.Extended;
using MonoGame.Extended.Sprites;
using MonoGame.Extended.TextureAtlases;
using Color = Microsoft.Xna.Framework.Color;
using Point = Microsoft.Xna.Framework.Point;
using Rectangle = Microsoft.Xna.Framework.Rectangle;
using RectangleF = System.Drawing.RectangleF;
using Texture2D = Microsoft.Xna.Framework.Graphics.Texture2D;

namespace SimplexCore
{
    public static partial class Sgml
    {
        struct Pair
        {
            public float x;
            public float y;
        }
        static Texture2D pixel;
        public static List<VertexPositionColor> vertices = new List<VertexPositionColor>();
        public static GameObject currentObject;
        public static RasterizerState rasterizerState = new RasterizerState();
        public static bool wireframe = false;

        public static RasterizerState rSFIll = new RasterizerState() {FillMode = FillMode.Solid, CullMode = CullMode.None, MultiSampleAntiAlias = false};
        public static RasterizerState rSWire = new RasterizerState() {FillMode =  FillMode.WireFrame, CullMode = CullMode.None, MultiSampleAntiAlias = false};
        static VertexPositionColor generalVertex = new VertexPositionColor();
        static Vector3 generalVector = Vector3.Zero;
        private static Vector3 tempVector;
        static Rectangle GeneralRectangle = Rectangle.Empty;
        static List<Pair> pushedVertices = new List<Pair>();
        static PointF a, b;
        private static bool aaOn = true;
        static Rectangle rect2 = Rectangle.Empty;

        // Internal cool shit
        static Vector2 GetCentroid(Vector3[] nodes)
        {
            float x = 0, y = 0, area = 0, k;
            b = new PointF(nodes[nodes.Length - 1].X, nodes[nodes.Length - 1].Y);

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

        static void RotateVectors(double angle)
        {
            float x = 0, y = 0, area = 0, k;
            Sgml.b.X = pushedVertices[pushedVertices.Count - 1].x;
            Sgml.b.Y = pushedVertices[pushedVertices.Count - 1].y;

            for (int i = 0; i < pushedVertices.Count; i++)
            {
                a.X = pushedVertices[i].x;
                a.Y = pushedVertices[i].y;

                k = a.Y * b.X - a.X * b.Y;
                area += k;
                x += (a.X + b.X) * k;
                y += (a.Y + b.Y) * k;

                b = a;
            }
            area *= 3;

            generalVector.X = x / area;
            generalVector.Y = y / area;

            foreach (Pair v in pushedVertices)
            {
                tempVector.X = v.x;
                tempVector.Y = v.y;

                generalVertex.Position = RotateVec3(tempVector, generalVector, angle);
                vertices.Add(generalVertex);
            }
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
        static void RenderVertices(PrimitiveType pt = PrimitiveType.TriangleList, bool outline = false)
        {
            vb.SetData(vertices.ToArray());
            sb.GraphicsDevice.SetVertexBuffer(vb);
            sb.GraphicsDevice.BlendState = BlendState.Opaque;
            
            if (outline)
            {
                sb.GraphicsDevice.RasterizerState = rSWire;
            }
            else
            {
                sb.GraphicsDevice.RasterizerState = rSFIll;
            }

            foreach (EffectPass pass in be.CurrentTechnique.Passes)
            {
                int primitiveCount = vertices.Count / 3; // Triangle list
                if (pt == PrimitiveType.LineList)
                {
                    primitiveCount = vertices.Count / 2; // Line list
                }
                else if (pt == PrimitiveType.LineStrip)
                {
                    primitiveCount = vertices.Count - 1;
                }

                pass.Apply();
                sb.GraphicsDevice.DrawPrimitives(pt, 0, primitiveCount);
            }
        }

        // Public goodies
        public static void draw_triangle(double x1, double y1, double x2, double y2, double x3, double y3, bool outline, double angle = 0)
        {
            Microsoft.Xna.Framework.Color fc = FinalizeColor(DrawColor);
            vertices.Clear();

            VertexPositionColor v0 = new VertexPositionColor(new Vector3((float)x1, (float)y1, 0), fc);
            VertexPositionColor v1 = new VertexPositionColor(new Vector3((float)x2, (float)y2, 0), fc);
            VertexPositionColor v2 = new VertexPositionColor(new Vector3((float)x3, (float)y3, 0), fc);

            if (Math.Abs(angle) > 0.001)
            {
                Vector2 pp = GetCentroid(new Vector3[] { v0.Position, v1.Position, v2.Position });

               v0.Position = RotateVec3(v0.Position, new Vector3(pp, 0), angle);
               v1.Position = RotateVec3(v1.Position, new Vector3(pp, 0), angle);
               v2.Position = RotateVec3(v2.Position, new Vector3(pp, 0), angle);
            }

            vertices.Add(v0);
            vertices.Add(v1);
            vertices.Add(v2);

            RenderVertices(PrimitiveType.TriangleList, outline);
        }

        static void ClearVertices()
        {
            vertices.Clear();
            pushedVertices.Clear();
        }
        
        public static void draw_triangle(float x1, float y1, float x2, float y2, float x3, float y3, bool outline, double angle = 0)
        {
            ClearVertices();

            if (!outline)
            {
                AddVertex(x1, y1, true);
                AddVertex(x2, y2, true);
                AddVertex(x3, y3, true);
                RotateVectors(angle);
                RenderVertices();
            }
            
            else
            {
                AddVertex(x1, y1, true);
                AddVertex(x2, y2, true);
                AddVertex(x3, y3, true);
                AddVertex(x1, y1, true);
                RotateVectors(angle);
                RenderVertices(PrimitiveType.LineStrip, true);
            }
        }

        public static void draw_rectangle(Vector2 p1, Vector2 p2, bool outline, double angle = 0)
        {
            Color fc = FinalizeColor(DrawColor);
            vertices.Clear();

            VertexPositionColor v0 = new VertexPositionColor(new Vector3((float)p1.X, (float)p1.Y, 0), fc);
            VertexPositionColor v1 = new VertexPositionColor(new Vector3((float)p1.X, (float)p2.Y, 0), fc);
            VertexPositionColor v2 = new VertexPositionColor(new Vector3((float)p2.X, (float)p1.Y, 0), fc);
            VertexPositionColor v3 = new VertexPositionColor(new Vector3((float)p2.X, (float)p2.Y, 0), fc);

            angle = ApplyEpsilon(angle);
            if (angle != 0)
            {              
                Vector3 v = new Vector3(p1.X + (p2.X - p1.X) / 2, p1.Y + (p2.Y - p1.Y) / 2, 0);

                v0.Position = RotateVec3(v0.Position, v, angle);
                v1.Position = RotateVec3(v1.Position, v, angle);
                v2.Position = RotateVec3(v2.Position, v, angle);
                v3.Position = RotateVec3(v3.Position, v, angle);
            }
     
            if (!outline)
            {
                vertices.AddRange(new[] { v0, v1, v3, v0, v3, v2 });
                RenderVertices();
            }
            else
            {
                vertices.AddRange(new[] { v0, v1, v1, v3, v3, v2, v2, v0 });
                RenderVertices(PrimitiveType.LineList, true);
            }
        }

        public static void draw_set_aa(bool on)
        {
            aaOn = on;
        }

        public static void draw_rectangle(MonoGame.Extended.RectangleF rect, bool outline)
        {
            vertices.Clear();
            SetVertexColor(FinalizeColor(DrawColor));

            if (!outline)
            {
                AddVertex(rect.X, rect.Y);
                AddVertex(rect.X, rect.Y + rect.Height);
                AddVertex(rect.X + rect.Width, rect.Y + rect.Height);
                AddVertex(rect.X, rect.Y);
                AddVertex(rect.X + rect.Width, rect.Y + rect.Height);
                AddVertex(rect.X + rect.Width, rect.Y);

                RenderVertices();
            }
            else
            {
                AddVertex(rect.X, rect.Y);
                AddVertex(rect.X, rect.Y + rect.Height);
                AddVertex(rect.X + rect.Width, rect.Y + rect.Height);
                AddVertex(rect.X + rect.Width, rect.Y);
                AddVertex(rect.X, rect.Y);

                RenderVertices(PrimitiveType.LineStrip, true);
            }
        }

        public static void draw_sprite(Texture2D sprite, double subimg, Vector2 position, float xscale = 1, float yscale = 1, float angle = 0)
        {
            if (subimg != -2)
            { 
                int y = ((int) subimg / currentObject.Sprite.TextureCellsPerRow);
                int x = ((int) subimg % currentObject.Sprite.TextureCellsPerRow);

                Rectangle ImageRectangle = new Rectangle(x * currentObject.Sprite.cellW, y * (int) currentObject.Sprite.cellH, (int) currentObject.Sprite.cellW, (int) currentObject.Sprite.cellH);


                if (!batchRunning)
                { 
                    sb.Begin(transformMatrix: m, effect: effect);
                    sb.Draw(sprite, position, ImageRectangle, FinalizeColor(DrawColor), currentObject.Sprite.ImageAngle, new Vector2(0, 0), currentObject.Sprite.ImageScale, SpriteEffects.None, 1);
                    sb.End();
                }
                else
                {
                    effect?.Parameters["FirstTexture"].SetValue(sprite);
                    sb.Draw(sprite, position, ImageRectangle, FinalizeColor(DrawColor), currentObject.Sprite.ImageAngle, new Vector2(0, 0), currentObject.Sprite.ImageScale, SpriteEffects.None, 1);
                }
            }
            else
            {
                if (aaOn)
                {
                    sb.Begin(transformMatrix: m);
                }
                else
                {
                    sb.Begin(transformMatrix: m, samplerState: SamplerState.PointClamp);
                }

                sb.Draw(sprite, position, null, FinalizeColor(DrawColor), MathHelper.ToRadians(angle), new Vector2(0, 0), new Vector2(xscale, yscale), SpriteEffects.None, 1);
                sb.End();
            }
        }

        public static void draw_sprite_part(Texture2D sprite, Rectangle rect, Vector2 position)
        {
            if (aaOn)
            {
                sb.Begin(transformMatrix: m);
            }
            else
            {
                sb.Begin(transformMatrix: m, samplerState: SamplerState.PointClamp);
            }

            sb.Draw(sprite, position, rect, FinalizeColor(DrawColor), 0, new Vector2(0, 0),1, SpriteEffects.None, 1);
            sb.End();
        }

        public static void draw_line(Vector2 pos1, Vector2 pos2)
        {
            vertices.Clear();
            SetVertexColor(FinalizeColor(DrawColor));
            
            VertexPositionColor v1 = new VertexPositionColor(new Vector3(pos1, 0), FinalizeColor(DrawColor));
            VertexPositionColor v2 = new VertexPositionColor(new Vector3(pos2, 0), FinalizeColor(DrawColor));

            vertices.Add(v1);
            vertices.Add(v2);

            RenderVertices(PrimitiveType.LineList);
        }
        
        public static void draw_line(float pos1x, float pos1y, float pos2x, float pos2y)
        {
            vertices.Clear();
            SetVertexColor(FinalizeColor(DrawColor));
            
            AddVertex(pos1x, pos1y);
            AddVertex(pos2x, pos2y);
            
            RenderVertices(PrimitiveType.LineStrip);
        }
        

        public static void draw_line_color(Vector2 pos1, Vector2 pos2, Color c1, Color c2)
        {
            vertices.Clear();
            VertexPositionColor v1 = new VertexPositionColor(new Vector3(pos1, 0), FinalizeColor(c1));
            VertexPositionColor v2 = new VertexPositionColor(new Vector3(pos2, 0), FinalizeColor(c2));

            vertices.Add(v1);
            vertices.Add(v2);

            RenderVertices(PrimitiveType.LineList);
        }

        public static void draw_point(Vector2 p)
        {
            vertices.Clear();
            VertexPositionColor v1 = new VertexPositionColor(new Vector3(p, 0), FinalizeColor(DrawColor));

            vertices.Add(v1);
            vertices.Add(v1);

            RenderVertices(PrimitiveType.LineList);
        }
        
        public static void draw_point(float posX, float posY)
        {
            vertices.Clear();
            
            AddVertex(posX, posY);
            AddVertex(posX, posY);

            RenderVertices(PrimitiveType.LineList);
        }

        public static void draw_point_color(Vector2 p, Color c)
        {
            vertices.Clear();
            VertexPositionColor v1 = new VertexPositionColor(new Vector3(p, 0), FinalizeColor(c));

            vertices.Add(v1);
            vertices.Add(v1);

            RenderVertices(PrimitiveType.LineList);
        }

        public static void draw_line_width(Vector2 pos1, Vector2 pos2, int width, double angle = 0)
        {
            vertices.Clear();

            Vector2 newVec = pos2 - pos1;
            Vector3 newVector = Vector3.Cross(new Vector3(newVec, 0), Vector3.Forward);
            newVector.Normalize();
            newVec.X = newVector.X;
            newVec.Y = newVector.Y;

            Vector2 x1 =  width * newVec + pos2;
            Vector2 x2 = -width * newVec + pos1;
            Vector2 x3 = -width * newVec + pos2;
            Vector2 x4 =  width * newVec + pos1;

            VertexPositionColor v1 = new VertexPositionColor(new Vector3(x1, 0), FinalizeColor(DrawColor));
            VertexPositionColor v2 = new VertexPositionColor(new Vector3(x2, 0), FinalizeColor(DrawColor));
            VertexPositionColor v3 = new VertexPositionColor(new Vector3(x3, 0), FinalizeColor(DrawColor));
            VertexPositionColor v4 = new VertexPositionColor(new Vector3(x4, 0), FinalizeColor(DrawColor));

            angle = ApplyEpsilon(angle);
            if (angle != 0)
            {
                Vector2 c = GetCentroid(new Vector3[] {v1.Position, v3.Position, v2.Position, v4.Position});
                v1.Position = RotateVec3(v1.Position, new Vector3(c, 0), angle);
                v2.Position = RotateVec3(v2.Position, new Vector3(c, 0), angle);
                v3.Position = RotateVec3(v3.Position, new Vector3(c, 0), angle);
                v4.Position = RotateVec3(v4.Position, new Vector3(c, 0), angle);
            }

            vertices.AddRange(new []{v1, v3, v2, v2, v4, v1});
           
            RenderVertices();
        }

        public static void draw_arrow(Vector2 p1, Vector2 p2, int size)
        {
            Vector2 newVec = p2 - p1;
            Vector3 newVector = Vector3.Cross(new Vector3(newVec, 0), Vector3.Forward);
            newVector.Normalize();
            newVec.X = newVector.X;
            newVec.Y = newVector.Y;

            Vector2 x1 = size * newVec + p2;
            Vector2 x2 = -size * newVec + p1;
            Vector2 x3 = -size * newVec + p2;
            Vector2 x4 = size * newVec + p1;

            Vector2 vv = newVec * size;

            double dir = point_direction(p1.X, p1.Y, p2.X, p2.Y);

            if (p1.X > p2.X) { dir = -dir; }
            else if (p1.Y > p2.Y) { dir = -dir; }

            if (p1.X < p2.X && p1.Y < p2.Y) { dir = point_direction(p1.X, p2.Y, p2.X, p1.Y); }

            draw_line(p1, p2);
            draw_triangle(x1.X, x1.Y, x3.X, x3.Y, p2.X + lengthdir_x(size, dir), p2.Y + lengthdir_y(size, dir), false);
        }

        // todo reowrk
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

            vb = new DynamicVertexBuffer(sb.GraphicsDevice, typeof(VertexPositionColor), verticles.Count, BufferUsage.WriteOnly);
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
            vertices.Clear();

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


            vertices.Add(v1);
            vertices.Add(v2);
            vertices.Add(v3);

            vertices.Add(v4);
            vertices.Add(v5);
            vertices.Add(v6);

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

            vertices.Add(v1);
            vertices.Add(v2);
            vertices.Add(v3);

            v1 = new VertexPositionColor(new Vector3(x1, y1, 0), FinalizeColor(DrawColor));
            v2 = new VertexPositionColor(new Vector3(x3, y3, 0), FinalizeColor(DrawColor));
            v3 = new VertexPositionColor(new Vector3(x4, y4, 0), FinalizeColor(DrawColor));

            vertices.Add(v1);
            vertices.Add(v2);
            vertices.Add(v3);

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

            vertices.Add(v1);
            vertices.Add(v2);
            vertices.Add(v3);

            v1 = new VertexPositionColor(new Vector3(x1, y1, 0), FinalizeColor(DrawColor));
            v2 = new VertexPositionColor(new Vector3(x3, y3, 0), FinalizeColor(DrawColor));
            v3 = new VertexPositionColor(new Vector3(x4, y4, 0), FinalizeColor(DrawColor));

            vertices.Add(v1);
            vertices.Add(v2);
            vertices.Add(v3);

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

            vertices.Add(v1);
            vertices.Add(v2);
            vertices.Add(v3);

            v1 = new VertexPositionColor(new Vector3(x1, y1, 0), FinalizeColor(DrawColor));
            v2 = new VertexPositionColor(new Vector3(x3, y3, 0), FinalizeColor(DrawColor));
            v3 = new VertexPositionColor(new Vector3(x4, y4, 0), FinalizeColor(DrawColor));

            vertices.Add(v1);
            vertices.Add(v2);
            vertices.Add(v3);

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

            vertices.Add(v1);
            vertices.Add(v2);
            vertices.Add(v3);

            v1 = new VertexPositionColor(new Vector3(x1, y1, 0), FinalizeColor(DrawColor));
            v2 = new VertexPositionColor(new Vector3(x3, y3, 0), FinalizeColor(DrawColor));
            v3 = new VertexPositionColor(new Vector3(x4, y4, 0), FinalizeColor(DrawColor));

            vertices.Add(v1);
            vertices.Add(v2);
            vertices.Add(v3);

            RenderVertices();

            // TOP-LEFT CIRCLE
             draw_circle(new Vector2(pos1.X + r, pos1.Y + r), r * 2, false, 180, 90);
             draw_circle(new Vector2(pos2.X - r, pos1.Y + r), r * 2, false, 90, 90);
             draw_circle(new Vector2(pos1.X + r, pos2.Y - r), r * 2, false, 270, 90);
             draw_circle(new Vector2(pos2.X - r, pos2.Y - r), r * 2, false, 0, 90);
        }

        public static void draw_line_width_color(Vector2 pos1, Vector2 pos2, int width, Microsoft.Xna.Framework.Color c1, Microsoft.Xna.Framework.Color c2, Microsoft.Xna.Framework.Color c3, Microsoft.Xna.Framework.Color c4, double angle = 0)
        {
            vertices.Clear();

            Vector2 newVec = pos2 - pos1;
            Vector3 newVector = Vector3.Cross(new Vector3(newVec, 0), Vector3.Forward);
            newVector.Normalize();
            newVec.X = newVector.X;
            newVec.Y = newVector.Y;

            Vector2 x1 =  width * newVec + pos2;
            Vector2 x2 = -width * newVec + pos1;
            Vector2 x3 = -width * newVec + pos2;
            Vector2 x4 =  width * newVec + pos1;

            VertexPositionColor v1 = new VertexPositionColor(new Vector3(x1, 0), FinalizeColor(c1));
            VertexPositionColor v2 = new VertexPositionColor(new Vector3(x2, 0), FinalizeColor(c2));
            VertexPositionColor v3 = new VertexPositionColor(new Vector3(x3, 0), FinalizeColor(c3));
            VertexPositionColor v4 = new VertexPositionColor(new Vector3(x4, 0), FinalizeColor(c4));

            angle = ApplyEpsilon(angle);
            if (angle != 0)
            {
                Vector2 c = GetCentroid(new Vector3[] { v1.Position, v3.Position, v2.Position, v4.Position });
                v1.Position = RotateVec3(v1.Position, new Vector3(c, 0), angle);
                v2.Position = RotateVec3(v2.Position, new Vector3(c, 0), angle);
                v3.Position = RotateVec3(v3.Position, new Vector3(c, 0), angle);
                v4.Position = RotateVec3(v4.Position, new Vector3(c, 0), angle);
            }

            vertices.AddRange(new[] { v1, v3, v2, v2, v4, v1 });

            RenderVertices();
        }

        // todo
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


            vb = new DynamicVertexBuffer(sb.GraphicsDevice, typeof(VertexPositionColor), vertices.Length,
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

        //
        public static void draw_circle(Vector2 pos, int r, bool outline, int startAngle = 0, int totalAngle = 360, int distance = 0)
        {          
            r *= 2;
            Microsoft.Xna.Framework.Color fc = FinalizeColor(DrawColor);
            totalAngle += startAngle;

            if (outline) {distance = r - 4;}

            vertices.Clear();
               
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
                    vertices.Add(new VertexPositionColor(new Vector3(x3, y3, 0), fc));
                    vertices.Add(new VertexPositionColor(new Vector3(x1, y1, 0), fc));
                    vertices.Add(new VertexPositionColor(new Vector3(x2, y2, 0), fc));
                }
                else
                {
                    vertices.Add(new VertexPositionColor(new Vector3(x3, y3, 0), fc));
                    vertices.Add(new VertexPositionColor(new Vector3(x1, y1, 0), fc));
                    vertices.Add(new VertexPositionColor(new Vector3(x2, y2, 0), fc));
                    vertices.Add(new VertexPositionColor(new Vector3(x2, y2, 0), fc));
                    vertices.Add(new VertexPositionColor(new Vector3(x3, y3, 0), fc));

                    angle = ((i + 10)/ 57.3f);
                    x3 = xPos + ((distance / 2f) * (float)Math.Sin(angle));
                    y3 = yPos + ((distance / 2f) * (float)Math.Cos(angle));
                    vertices.Add(new VertexPositionColor(new Vector3(x3, y3, 0), fc));
                }

                y1 = y2;
                x1 = x2;
            }

            RenderVertices();
        }

        static void AddVertex(float x, float y, bool add = false)
        {
            if (add)
            {
                pushedVertices.Add(new Pair() { x = x, y = y });
            }
            else
            {
                generalVector.X = x;
                generalVector.Y = y;
                generalVertex.Position = generalVector;
                vertices.Add(generalVertex);
            }
        }

        static void SetVertexColor(Color c)
        {
            generalVertex.Color = c;
        }

        public static void draw_circle_fast(Vector2 pos, int r, int segments, Color color, float startAngle = 0, float totalAngle = 360)
        {
            r /= 2;
            vertices.Clear();
            Color fc = FinalizeColor(color);

            float theta = (MathHelper.TwoPi / segments) * (totalAngle / 360);
            float tv = (float) Math.Tan(theta);
            float rv = (float) Math.Cos(theta);

            float x = r * (float) cos(degtorad(startAngle));
            float y = r * (float) sin(degtorad(startAngle));

            SetVertexColor(fc);
            AddVertex(x + pos.X, y + pos.Y);

            for (int i = 0; i < segments; i++)
            {
                AddVertex(x + pos.X, y + pos.Y);

                float tx = -y;
                float ty = x;

                x += tx * tv;
                y += ty * tv;

                x *= rv;
                y *= rv;
            }

            AddVertex(x + pos.X, y + pos.Y);
            RenderVertices(PrimitiveType.LineStrip, false);
        }

        public static void draw_circle_color(Vector2 pos, int r, bool outline, Microsoft.Xna.Framework.Color c1, Microsoft.Xna.Framework.Color c2, int startAngle = 0, int totalAngle = 360, int distance = 0)
        {
            r *= 2;
            Microsoft.Xna.Framework.Color fc1 = FinalizeColor(c1);
            Microsoft.Xna.Framework.Color fc2 = FinalizeColor(c2);

            if (outline) {distance = r - 4;}

            vertices.Clear();

            float xPos = pos.X;
            float yPos = pos.Y;

            float x1 = xPos;
            float y1 = yPos;

            float angle = 0;
            for (int i = startAngle; i <= totalAngle; i += 10)
            {
                angle = (i / 57.2961161551924f);

                float x2 = xPos + ((r / 2f) * (float)Math.Sin(angle));
                float y2 = yPos + ((r / 2f) * (float)Math.Cos(angle));

                float x3 = xPos + ((distance / 2f) * (float)Math.Sin(angle));
                float y3 = yPos + ((distance / 2f) * (float)Math.Cos(angle));

                if (distance == 0)
                {
                    vertices.Add(new VertexPositionColor(new Vector3(x3, y3, 0), fc1));
                    vertices.Add(new VertexPositionColor(new Vector3(x1, y1, 0), fc2));
                    vertices.Add(new VertexPositionColor(new Vector3(x2, y2, 0), fc2));
                }
                else
                {
                    vertices.Add(new VertexPositionColor(new Vector3(x3, y3, 0), fc1));
                    vertices.Add(new VertexPositionColor(new Vector3(x1, y1, 0), fc2));
                    vertices.Add(new VertexPositionColor(new Vector3(x2, y2, 0), fc2));
                    vertices.Add(new VertexPositionColor(new Vector3(x2, y2, 0), fc2));
                    vertices.Add(new VertexPositionColor(new Vector3(x3, y3, 0), fc1));

                    angle = ((i + 10) / 57.3f);
                    x3 = xPos + ((distance / 2f) * (float)Math.Sin(angle));
                    y3 = yPos + ((distance / 2f) * (float)Math.Cos(angle));
                    vertices.Add(new VertexPositionColor(new Vector3(x3, y3, 0), fc1));
                }

                y1 = y2;
                x1 = x2;
            }

            RenderVertices();
        }

        public static void draw_text(Vector2 position, string text)
        {
            sb.Begin(transformMatrix: m);
            sb.DrawString(drawFont, text, position, FinalizeColor(DrawColor));
            sb.End();
        }

        public static void draw_surface(Vector2 position, RenderTarget2D surface)
        {
            GeneralRectangle.X = (int) position.X;
            GeneralRectangle.Y = (int) position.Y;
            GeneralRectangle.Width = surface.Width;
            GeneralRectangle.Height = surface.Height;

            sb.Begin(transformMatrix: m, samplerState: SamplerState.PointClamp);
            sb.Draw(surface, GeneralRectangle, DrawColor);
            sb.End();
        }

        public static void draw_surface_stretched(Vector2 position, RenderTarget2D surface, Vector2 size)
        {
            GeneralRectangle.X = (int)position.X;
            GeneralRectangle.Y = (int)position.Y;
            GeneralRectangle.Width = (int)size.X;
            GeneralRectangle.Height = (int) size.Y;

            sb.Begin(transformMatrix: m, samplerState: SamplerState.PointClamp);
            sb.Draw(surface, GeneralRectangle, DrawColor);
            sb.End();
        }

        public static void draw_video(Vector2 position, Vector2 size)
        {
            GeneralRectangle.X = (int)position.X;
            GeneralRectangle.Y = (int)position.Y;
            GeneralRectangle.Width = (int)size.X;
            GeneralRectangle.Height = (int)size.Y;

            sb.Begin(transformMatrix: m, samplerState: SamplerState.PointClamp);
            sb.Draw(videoPlayer.GetTexture(), GeneralRectangle, null, FinalizeColor(DrawColor));
            sb.End();
        }
    }
}
