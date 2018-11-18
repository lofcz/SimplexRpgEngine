using System;
using System.Collections.Generic;
using System.Diagnostics.PerformanceData;
using System.Runtime.CompilerServices;
using System.Text;
using System.Windows.Forms;
using System.Xml.Serialization;
using Microsoft.Xna.Framework;
using Microsoft.Xna.Framework.Graphics;
using SimplexCore;

namespace SimplexResources.Objects
{
    [Serializable]
    public class SampleObject : GameObject
    {
        public override void DrawNode(SpriteBatch s, SpriteFont f)
        {
            s.DrawString(f, "2", Position, Color.White);
        }

        public override void OnCreate()
        {
            ImageScaleTarget = new Vector2(0.5f, 0.5f);
        }
    }
}
