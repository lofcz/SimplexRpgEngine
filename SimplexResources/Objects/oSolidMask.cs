using System;
using System.Collections.Generic;
using System.Text;
using Microsoft.Xna.Framework;
using MonoGame.Extended;
using SimplexCore;
using static SimplexCore.Sgml;

namespace SimplexResources.Objects
{
    public class oSolidMask : GameObject
    {
        ColliderRectangle cr = new ColliderRectangle();
        public oSolidMask()
        {
            EditorPath = "Solid";
            Sprite.TextureSource = "texture";
            Sprite.Texture = sprite_get("texture");

            cr.Collision = new RectangleF(0, 0, 32, 32);
            cr.Name = "main";
            cr.GameObject = this;

            Colliders.Add(cr);
        }

        public override void EvtStep()
        {
            UpdateColliders();

            CollisionContainer.X = (int)Position.X;
            CollisionContainer.Y = (int)Position.Y;
            CollisionContainer.Width = 32;
            CollisionContainer.Height = 32;
        }

        public override void EvtDraw()
        {


            draw_set_color(Color.Red);
            draw_set_alpha(0.5);
          //  draw_rectangle(Position, new Vector2(Position.X + 32, Position.Y + 32), false);
            draw_set_color(Color.White);
            draw_set_alpha(1);
        }
    }
}
