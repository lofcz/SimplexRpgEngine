using System;
using System.Collections.Generic;
using System.Text;
using Microsoft.Xna.Framework;
using Microsoft.Xna.Framework.Input;
using MonoGame.Extended;
using SimplexCore;
using static SimplexCore.Sgml;

namespace SimplexResources.Objects
{
    public class oBall : GameObject
    {
        public oBall()
        {
            EditorPath = "Actors";
        }

        public override void EvtCreate()
        {
            ColliderCircle cr = new ColliderCircle();
            cr.Name = "MainCollider";
            cr.GameObject = this;
            cr.Position = Position;
            cr.Radius = 32;

            Colliders.Add(cr);

            Direction = irandom(360);
            Speed = 8;
        }

        public override void EvtStep()
        {
            UpdateState();
            UpdateColliders();

            CollisionContainer.Height = 32;
            CollisionContainer.Width = 32;
            CollisionContainer.X = (int)Position.X - 16;
            CollisionContainer.Y = (int)Position.Y - 16;


            move_bounce_rectangle_outside(CollisionContainer, currentRoom.Rect);
            if (keyboard_check_pressed(Keys.F))
            {
                Direction -= 45;
            }
        }

        public override void EvtDraw()
        {
            CollisionContainer.Height = 32;
            CollisionContainer.Width = 32;
            CollisionContainer.X = (int)Position.X - 16;
            CollisionContainer.Y = (int)Position.Y - 16;

            draw_circle_fast(Position, 32, 24, DrawColor);
        }
    }
}
