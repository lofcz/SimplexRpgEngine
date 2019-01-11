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
    public class oGeorge : GameObject
    {
        FrameManager frameManager = new FrameManager();
        private float speed = 5;
        private float imgSpd = .1f;
        private ColliderRectangle bodyCollider = null;


        public oGeorge()
        {
            EditorPath = "Actors";
            Sprite.TextureSource = "george";

            bodyCollider = new ColliderRectangle();
            bodyCollider.Collision = new RectangleF(0, 0, 48, 48);
            bodyCollider.GameObject = this;
            bodyCollider.Name = "main";

            Colliders.Add(bodyCollider);
        }

        public override void EvtRegisterCollisions()
        {
            RegisterCollider("main", typeof(oGem), "main", GemCollision);
        }

        public void GemCollision(GameObject me, GameObject other)
        {
            instance_destroy(other);
        }

        public override void EvtCreate()
        {
            Sprite.Texture = sprite_get("george");

            frameManager.AddAnimation("george", new[] { 0, 1, 2, 3  }, "south"); 
            frameManager.AddAnimation("george", new[] { 4, 5, 6, 7  }, "west"); 
            frameManager.AddAnimation("george", new[] { 8, 9, 10, 11 }, "north"); 
            frameManager.AddAnimation("george", new[] { 12, 13, 14, 15 }, "east"); 

        }

        public override void EvtStep()
        {
            UpdateState();
            UpdateColliders();

            CollisionContainer.X = (int)Position.X;
            CollisionContainer.Y = (int)Position.Y;
            CollisionContainer.Width = 48;
            CollisionContainer.Height = 48;

            Sprite.UpdateImageRectangle();

            if (keyboard_check(Keys.W))
            {
                frameManager.ApplyAnimation("george", "north");
                Position.Y -= speed;
                ImageSpeed = imgSpd;
            }
            else if (keyboard_check(Keys.S))
            {
                frameManager.ApplyAnimation("george", "south");
                Position.Y += speed;
                ImageSpeed = imgSpd;
            }
            else if (keyboard_check(Keys.A))
            {
                frameManager.ApplyAnimation("george", "west");
                Position.X -= speed;
                ImageSpeed = imgSpd;
            }
            else if (keyboard_check(Keys.D))
            {
                frameManager.ApplyAnimation("george", "east");
                Position.X += speed;
                ImageSpeed = imgSpd;
            }
            else
            {
                ImageSpeed = 0;
                ImageIndex = ((int)ImageIndex / 4) * 4;
            }


        }

        public override void EvtDraw()
        {
            draw_sprite(Sprite.Texture, ImageIndex, Position);
        }
    }
}
