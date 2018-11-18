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
using SimplexCore;

namespace SimplexResources.Objects
{
    [Serializable]
    public class SampleObject : GameObject
    {
        public SampleObject()
        {
            Sprite.TextureSource = "Sprites/elves";
        }

        public override void DrawNode(SpriteBatch s, SpriteFont f)
        {
            s.DrawString(f, "2", Position, Color.White);
        }

        public override void OnCreate()
        {
           // Sprite.ImageScaleTarget = new Vector2(0.5f, 0.5f);
        }

        public override void OnDraw(SpriteBatch sb)
        {
            if (Input.KeyPressed(Keys.W))
            {
                Position.Y -= 40;
            }
            //Position.Y--;
            //Debug.WriteLine("Hello" + Id);
        }
    }
}
