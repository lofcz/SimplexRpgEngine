using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Text;
using Microsoft.Xna.Framework;
using Microsoft.Xna.Framework.Input;
using MonoGame.Extended;
using SimplexCore;
using static SimplexCore.Sgml;
namespace SimplexResources.Objects
{
    public class oPaddle : GameObject
    {
        public oPaddle()
        {
            EditorPath = "Actors";
        }

        public override void EvtCreate()
        {
            ColliderRectangle cr = new ColliderRectangle();
            cr.Name = "MainCollider";
            cr.GameObject = this;
            cr.Collision = new RectangleF(0, 0, 128, 16);

            Colliders.Add(cr);
        }

        public override void EvtStep()
        {
            UpdateColliders();

            if (keyboard_check(Keys.D))
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
            }

        }

        public override void EvtRegisterCollisions()
        {
            RegisterCollider("MainCollider", typeof(oBall), "MainCollider", BallCollision);
        }

        public void BallCollision(GameObject me, GameObject ball)
        {
            move_bounce_rectangle_object(me.CollisionContainer, ball.CollisionContainer, ball);
        }

        public override void EvtDraw()
        {
            CollisionContainer.Height = 16;
            CollisionContainer.Width = 128;
            CollisionContainer.X = (int)Position.X;
            CollisionContainer.Y = (int)Position.Y;

            draw_rectangle(Position, new Vector2(Position.X + 128, Position.Y + 16), true);
        }
    }
}
