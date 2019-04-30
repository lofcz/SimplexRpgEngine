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
            // Local function
            int helper()
            {
                return irandom(10);
            }

            X = helper();
            Y = helper();

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
            Gravity.X = 1;
            currentObject = this;
            Velocity.Y = min(Velocity.Y, 60);

           
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
                    Velocity.Y *= -0.9f;
                    //Position.Y -= 32;
                }
            }

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
                    X += (float) speed;
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
                    X -= (float) speed;
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
                    Y -= (float) speed;
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
                    Y += (float) speed;
                }

                LastImageIndex = ImageIndex;
            }
        }

        public override void EvtDraw()
        {

        }
    }
}