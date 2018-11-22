using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Diagnostics.PerformanceData;
using System.Runtime.CompilerServices;
using System.Text;
using System.Xml.Serialization;
using Microsoft.Xna.Framework;
using Microsoft.Xna.Framework.Graphics;
using Microsoft.Xna.Framework.Input;
using MonoGame.Extended.Sprites;
using MonoGame.Extended.TextureAtlases;
using SimplexCore;
using SimplexIde;

namespace SimplexResources.Objects
{
    [Serializable]
    public class SampleObject : GameObject
    {
        public SampleObject()
        {
            Sprite.TextureSource = "elves";
            Sprite.ImageRectangle = new Rectangle(0, 0, 64, 64);
        }
        

        public override void OnCreate()
        {
           // Sprite.ImageScaleTarget = new Vector2(0.5f, 0.5f);
        }

        public override void OnDraw(SpriteBatch sb)
        {
            // We move up
            if (Input.KeyPressed(Keys.W))
            {
                Position.Y -= 40;
            }

            // Draw
            sb.Draw(Sprite.Texture, Position, new Rectangle(0, 0, 64, 64) , Color.White);

        }

        public override void DrawNode(SpriteBatch s, SpriteFont f, Texture2D objectTexture)
        {
            s.Draw(objectTexture, Position, new Rectangle(0, 0, 64, 64), Color.White);
        }
    }
}
