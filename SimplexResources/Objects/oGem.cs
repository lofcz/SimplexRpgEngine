using System;
using System.Collections.Generic;
using System.Text;
using MonoGame.Extended;
using SimplexCore;
using static SimplexCore.Sgml;

namespace SimplexResources.Objects
{
    public class oGem : GameObject
    {
        private ColliderRectangle bodyCollider = null;

        public oGem()
        {
            EditorPath = "Items";
            Sprite.TextureSource = "Gem";
            Sprite.Texture = sprite_get("Gem");

            bodyCollider = new ColliderRectangle();
            bodyCollider.Collision = new RectangleF(0, 0, 16, 16);
            bodyCollider.GameObject = this;
            bodyCollider.Name = "main";

            Colliders.Add(bodyCollider);
        }

        public override void EvtCreate()
        {

        }

        public override void EvtStep()
        {
            UpdateColliders();

            CollisionContainer.X = (int)Position.X;
            CollisionContainer.Y = (int)Position.Y;
            CollisionContainer.Width = 16;
            CollisionContainer.Height = 16;
        }

        public override void EvtDraw()
        {
            draw_sprite(Sprite.Texture, -2, Position);
        }
    }
}
