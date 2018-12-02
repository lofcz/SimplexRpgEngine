using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Diagnostics.PerformanceData;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Text;
using System.Xml.Linq;
using System.Xml.Serialization;
using Microsoft.Xna.Framework;
using Microsoft.Xna.Framework.Graphics;
using Microsoft.Xna.Framework.Input;
using MonoGame.Extended;
using MonoGame.Extended.Shapes;
using MonoGame.Extended.TextureAtlases;
using SimplexCore;
using SimplexIde;
using static SimplexCore.Sgml;

namespace SimplexResources.Objects
{
    public class oPlayer : GameObject
    {
        public Color c1;
        public Color c2;

        public double speed = 4;

        public float LastImageIndex = 0;

        // all variables to be serialized have to be public
        public int time;

        public oPlayer()
        {
            Sprite.TextureSource = "elves2";
            EditorPath = "Colliders";
            ImageSpeed = 0.01;

            Colliders.Add(new ColliderRectangle() {Collision = new RectangleF(16, 48, 32, 16)});
        }
        
        // Defines what happens once instance is placed in the room editor
        public override void EvtCreate()
        {
            c1 = RandomColor();
            c2 = RandomColor();

            time = 0;
        }

        public override void EvtLoad()
        {
            //time = 0;
        }

        // This actual GMS-like Create event
        public override void OnCreate()
        {
            Debug.WriteLine("Hello c#");
        }

        public override void EvtStep()
        {
            currentObject = this;

            time++;
            this.Sprite.UpdateImageAngle();
            this.Sprite.UpdateImageScale();
            this.Sprite.UpdateImageRectangle();
            UpdateColliders();

            if (Input.KeyboardState.IsKeyDown(Keys.D) || Input.KeyboardState.IsKeyDown(Keys.W) || Input.KeyboardState.IsKeyDown(Keys.S) || Input.KeyboardState.IsKeyDown(Keys.A))
            {
                ImageSpeed = 0.3;
                ImageIndex += (float)ImageSpeed;             
            }
            else
            {
                ImageIndex = ((int)LastImageIndex / 9) * 9;
            }

            if (Input.KeyboardState.IsKeyDown(Keys.D))
            {
                ImageIndex = (float)clamp(ImageIndex, 27, 36);

                RectangleF bR = (Colliders[0] as ColliderRectangle).CollisionTransformed;
                bR.X += (float)speed;
                if (PlaceEmptyRectangle(bR))
                {
                    Position.X += (float) speed;
                }

                LastImageIndex = ImageIndex;
            }
            else if (Input.KeyboardState.IsKeyDown(Keys.A))
            {
                ImageIndex = (float)clamp(ImageIndex, 9, 18);
                if (ImageIndex == 18) { ImageIndex = 9;}

                RectangleF bR = (Colliders[0] as ColliderRectangle).CollisionTransformed;
                bR.X -= (float)speed;
                if (PlaceEmptyRectangle(bR))
                {
                    Position.X -= (float) speed;
                }

                LastImageIndex = ImageIndex;
            }
            else if (Input.KeyboardState.IsKeyDown(Keys.W))
            {
                ImageIndex = (float)clamp(ImageIndex, 0, 9);
                if (ImageIndex == 9) { ImageIndex = 0; }

                RectangleF bR = (Colliders[0] as ColliderRectangle).CollisionTransformed;
                bR.Y -= (float)speed;
                if (PlaceEmptyRectangle(bR))
                {
                    Position.Y -= (float) speed;
                }

                LastImageIndex = ImageIndex;
            }
            else if (Input.KeyboardState.IsKeyDown(Keys.S))
            {
                ImageIndex = (float)clamp(ImageIndex, 18, 27);
                if (ImageIndex == 27) { ImageIndex = 18; }

                RectangleF bR = (Colliders[0] as ColliderRectangle).CollisionTransformed;
                bR.Y += (float)speed;
                if (PlaceEmptyRectangle(bR))
                {
                    Position.Y += (float) speed;
                }

                LastImageIndex = ImageIndex;
            }
        }

        public override void EvtDraw(SpriteBatch s, SpriteFont f, Texture2D objectTexture, VertexBuffer vb, BasicEffect be, Matrix transform)
        {
            currentObject = this;

            // Initialize render engine for this instance
            DrawStart(s, vb, be, transform, this);
            //    s.Draw(objectTexture, Position, DrawColor);
            // Actual code starts here
            // draw_set_alpha(0.5);
            // draw_triangle(Position.X, Position.Y, Position.X + 100, Position.Y, Position.X + 50, Position.Y + 50, false);
  
            draw_set_alpha(1);
            draw_sprite(objectTexture, ImageIndex, Position);

            s.Begin(transformMatrix: transform);
            //s.DrawLine(Position.X, Position.Y, Position.X - 4, Position.Y, Color.Aqua);
           // s.DrawRectangle((Colliders[0] as ColliderRectangle).CollisionTransformed, Color.Aqua);
            //s.DrawString(f, ImageIndex.ToString(), Position, Color.White);
            s.End();
            draw_set_alpha(abs(sin(degtorad(time))));
            draw_circle_color(new Vector2(Position.X + 32, Position.Y + 32), 128 + (int)(128 * abs(sin(degtorad(time)))), false, c1, Microsoft.Xna.Framework.Color.Transparent);
            draw_set_alpha(1);
            //draw_set_alpha(1);
            // sb.Draw(objectTexture, Position, Color.White);
        }
    }
}