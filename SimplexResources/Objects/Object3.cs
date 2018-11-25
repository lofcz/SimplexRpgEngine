using System;
using System.Collections.Generic;
using System.Drawing;
using System.Text;
using Microsoft.Xna.Framework.Graphics;
using MonoGame.Extended.TextureAtlases;
using SimplexCore;
using static SimplexCore.Sgml;


namespace SimplexResources.Objects
{
    public class Object3 : GameObject
    {
        public Object3()
        {
            Sprite.TextureSource = "elves";

        }

        public override void DrawNode(SpriteBatch s, SpriteFont f, Texture2D objectTexture)
        {
          //s.Draw(objectTexture, Position, Color.White);
        }
    }
}
