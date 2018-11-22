using System;
using System.Collections.Generic;
using System.Diagnostics.PerformanceData;
using System.Runtime.CompilerServices;
using System.Text;
using Microsoft.Xna.Framework;
using Microsoft.Xna.Framework.Graphics;
using SimplexCore;
using SimplexIde;
using static SimplexCore.Sgml;

namespace SimplexResources.Objects
{
    public class Objekt2 : GameObject
    {
        

        public Objekt2()
        {
            Sprite.TextureSource = "Sprites/texture";
        }

        public override void EvtCreate()
        {
            DrawTest.BackgroundColor = RandomColor();

        }
    }
}
