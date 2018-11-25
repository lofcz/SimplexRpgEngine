using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Diagnostics.PerformanceData;
using System.Runtime.CompilerServices;
using System.Text;
using System.Windows.Forms;
using System.Xml.Serialization;
using Microsoft.Xna.Framework;
using Microsoft.Xna.Framework.Graphics;
using MonoGame.Extended.Sprites;
using MonoGame.Extended.TextureAtlases;
using SimplexCore;
using SimplexIde;
using static SimplexCore.Sgml;
using Keys = Microsoft.Xna.Framework.Input.Keys;

namespace SimplexResources.Objects
{
    [Serializable]
    public class SampleObject : GameObject
    {
        private float lineThickness = 0;
        private float time = 0;
        private float alpha = 0;
        public SampleObject()
        {
            Sprite.TextureSource = "elves";
            Sprite.ImageRectangle = new Rectangle(0, 0, 64, 64);
            EditorPath = "Actors";

            EditorOptions.Clear(); // get rid of default options
            EditorOptions.Add("Oh you can overload this?");
            EditorOptions.Add(new ToolStripSeparator());
            EditorOptions.Add("You can have images, buttons, textboxes and whatever you want here");

            
        }

        public override void EvtContextMenuSelected(ToolStripItem e)
        {
            if (e.Text == "Oh you can overload this?")
            {
                Debug.WriteLine("Yes you can");
            }
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
           time++;
           ImageAlpha = Math.Abs((float)Math.Sin(MathHelper.ToRadians(time)));

           DrawSetAlpha(ImageAlpha);
           DrawRectangle(Position, new Vector2(64, 64), false, 1);
           DrawSetAlpha(1);

        }
    }
}
