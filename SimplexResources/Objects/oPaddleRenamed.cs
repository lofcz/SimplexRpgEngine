using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Text;
using Microsoft.Xna.Framework;
using Microsoft.Xna.Framework.Graphics;
using Microsoft.Xna.Framework.Input;
using MonoGame.Extended;
using SimplexCore;
using SimplexResources.Rooms;
using static SimplexCore.Sgml;
namespace SimplexResources.Objects
{
    public class oPaddleRenamed : GameObject
    {
        private RenderTarget2D MySurface;

        public oPaddleRenamed()
        {
            EditorPath = "Actors";
            Persistent = true;
        }

        public override void EvtCreate()
        {            
            ColliderRectangle cr = new ColliderRectangle(this);
            cr.Name = "MainCollider";
            cr.GameObject = this;
            cr.Collision = new RectangleF(0, 0, 128, 16);

            Colliders.Add(cr);

            MySurface = surface_create(640, 480);

            //point_in_rectangle_rotated()
        }

        public override void EvtStep()
        {
            UpdateColliders();

            //move_towards_point(mouse, 4);

            /* if (keyboard_check(Keys.D))
             {
                 Position.X += 8;
             }
             else if (keyboard_check(Keys.A))
             {
                 Position.X -= 8;
             }
             else if (keyboard_check(Keys.W))
             {
                 Position.Y -= 8;
             }
             else if (keyboard_check(Keys.S))
             {
                 Position.Y += 8;
             }*/
        }

        public override void EvtRegisterCollisions()
        {
            RegisterCollider("MainCollider", typeof(oBall), "MainCollider", BallCollision);
        }

        public void BallCollision(GameObject me, GameObject ball)
        {
            move_bounce_rectangle_object(me.CollisionContainer, ball.CollisionContainer, ball);
        }

        public override void EvtDrawToSurfaces()
        {
            surface_set_target(MySurface);
            draw_circle_fast(new Vector2(100, 100), 64, 24, Color.Red);
            draw_text(new Vector2(100, 200), "Hello I'm a cool surface!");
            surface_reset_target();
        }

        public override void EvtDraw()
        {
            if (mouse_wheel_up())
            {
               //room_restart();
            }

            CollisionContainer.Height = 16;
            CollisionContainer.Width = 128;
            CollisionContainer.X = (int)Position.X;
            CollisionContainer.Y = (int)Position.Y;

            draw_rectangle(Position, new Vector2(Position.X + 128, Position.Y + 16), true);

            //draw_triangle_new(Position.X, Position.Y, Position.X + 100, Position.Y, Position.X + 50, Position.Y - 50, true, 70);
            //draw_surface(Position, MySurface);
        }
    }
}
