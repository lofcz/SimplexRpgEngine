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
using static SimplexCore.Sgml;

namespace SimplexResources.Objects
{
    [Serializable]
    public class SampleObject : GameObject
    {
        private float lineThickness = 0;
        private float time = 0;
        public SampleObject()
        {
            Sprite.TextureSource = "elves";
            Sprite.ImageRectangle = new Rectangle(0, 0, 64, 64);
            EditorPath = "Actors";
        }
        

        public override void OnCreate()
        {
           // Sprite.ImageScaleTarget = new Vector2(0.5f, 0.5f);
        }

        public override void OnDraw(SpriteBatch sb)
        {
            // We move up
            if (Input.KeyPressed(Keys.W) && PlaceEmpty(Position))
            {
                Position.Y -= 40;
            }

            // Draw
            sb.Draw(Sprite.Texture, Position, new Rectangle(0, 0, 64, 64) , Color.White);

            DrawRectangle(Position, new Vector2(64, 64), true);

        }

        public override void DrawNode(SpriteBatch s, SpriteFont f, Texture2D objectTexture)
        {
            Sgml.sb = s;

           DrawSetAlpha(0.5f);
           DrawRectangle(Position, new Vector2(64, 64), false, 1);
           DrawSetAlpha(1);

        }
    }
}
