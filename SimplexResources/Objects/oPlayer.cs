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

        public float speed = 4;
        public float LastImageIndex = 0;
        public int time;
        public ColliderRectangle bodyCollider;

        public oPlayer()
        {
            Sprite.TextureSource = "elves2";
            EditorPath = "Actors";
            ImageSpeed = 0.01f;

            bodyCollider = new ColliderRectangle(this) {Collision = new RectangleF(16, 48, 32, 16), AttachToRoot = true};
            Colliders.Add(bodyCollider);
        }
        
        // Defines what happens once instance is placed in the room editor
        public override void EvtCreate()
        {
            show_message("Test");
        }

        public override void EvtLoad()
        {
            //time = 0;
        }

        // This actual GMS-like Create event
        public override void OnCreate()
        {
            show_message("Test");

            if (place_empty(Position))
            {
                //instanc
            }
        }

        public override void EvtStep()
        {
           // Gravity.X = 1;
            currentObject = this;
           // Velocity.Y = min(Velocity.Y, 60);

           
            time++;
            //this.Sprite.UpdateImageAngle();
            //this.Sprite.UpdateImageScale();
           
            UpdateColliders();
            UpdateState();
            Sprite.UpdateImageRectangle();

            RectangleF bRR = (Colliders[0] as ColliderRectangle).CollisionTransformed;
            if (instance_place(new Vector2(bRR.X + 32, bRR.Y + 68), typeof(Object3)) != null)
            {
                if (Velocity.Y > 0)
                {
                    // Speed.Y *= -0.5f;
                   // Velocity.Y *= -0.9f;
                    //Position.Y -= 32;
                }
            }

            if (Input.KeyboardState.IsKeyDown(Keys.D) || Input.KeyboardState.IsKeyDown(Keys.W) || Input.KeyboardState.IsKeyDown(Keys.S) || Input.KeyboardState.IsKeyDown(Keys.A))
            {
                ImageSpeed = 0.3f;
                ImageIndex += ImageSpeed;
            }
            else
            {
                ImageIndex = ((int)LastImageIndex / 9) * 9;
            }

            if (Input.KeyboardState.IsKeyDown(Keys.D))
            {
                ImageIndex = (float)clamp(ImageIndex, 27, 36);

                if (place_empty_rectangle(bodyCollider.CollisionTransformed))
                {
                    X += speed;
                }

                LastImageIndex = ImageIndex;
            }
            else if (Input.KeyboardState.IsKeyDown(Keys.A))
            {
                ImageIndex = (float)clamp(ImageIndex, 9, 18);
                if (ImageIndex == 18) { ImageIndex = 9;}

                if (place_empty_rectangle(bodyCollider.CollisionTransformed))
                {
                    X -= speed;
                }

                LastImageIndex = ImageIndex;
            }
            else if (Input.KeyboardState.IsKeyDown(Keys.W))
            {
                ImageIndex = (float)clamp(ImageIndex, 0, 9);
                if (ImageIndex == 9) { ImageIndex = 0; }

                if (place_empty_rectangle(bodyCollider.CollisionTransformed))
                {
                    Y -= speed;
                }

                LastImageIndex = ImageIndex;
            }
            else if (Input.KeyboardState.IsKeyDown(Keys.S))
            {
                ImageIndex = (float)clamp(ImageIndex, 18, 27);
                if (ImageIndex == 27) { ImageIndex = 18; }

                if (place_empty_rectangle(bodyCollider.CollisionTransformed))
                {
                    Y += speed;
                }

                LastImageIndex = ImageIndex;
            }
        }

        public override void EvtDraw()
        {
            draw_self();

            draw_text(Position.X + 64, Position.Y, "X: " + round(Position.X) + "\n" + "Y: " + round(Position.Y));
            draw_text(Position.X + 64, Position.Y + 64, "S_X: " + round(PositionStart.X) + "\n" + "S_Y: " + round(PositionStart.Y));

        }
    }
}