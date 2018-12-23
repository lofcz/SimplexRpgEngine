using System;
using System.Collections.Generic;
using System.Text;
using Microsoft.Xna.Framework;
using MonoGame.Extended;
using SimplexCore;
using static SimplexCore.Sgml;

namespace SimplexResources.Objects
{
    public class oBrick : GameObject
    {
        public oBrick()
        {
            EditorPath = "Actors";

            ColliderRectangle cr = new ColliderRectangle();
            cr.Name = "MainCollider";
            cr.GameObject = this;
            cr.Collision = new RectangleF(0, 0, 64, 32);

            Colliders.Add(cr);
        }

        public override void EvtRegisterCollisions()
        {
            RegisterCollider("MainCollider", typeof(oBall), "MainCollider", BallCollision);
        }

        public void BallCollision(GameObject me, GameObject ball)
        {
            move_bounce_rectangle_object(me.CollisionContainer, ball.CollisionContainer, ball);
            instance_destroy(me);
        }

        public override void EvtStep()
        {
            UpdateState();
            UpdateColliders();
        }

        public override void EvtDraw()
        {
            CollisionContainer.Height = 32;
            CollisionContainer.Width = 64;
            CollisionContainer.X = (int)Position.X;
            CollisionContainer.Y = (int)Position.Y;

            draw_rectangle(Position, new Vector2(Position.X + 64, Position.Y + 32), true);
        }
    }
}
