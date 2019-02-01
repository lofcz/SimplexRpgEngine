using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Text;
using Microsoft.Xna.Framework;
using Microsoft.Xna.Framework.Audio;
using Microsoft.Xna.Framework.Input;
using MonoGame.Extended;
using SimplexCore;
using static SimplexCore.Sgml;
using Microsoft.Xna.Framework.Graphics;
using SimplexIde;

namespace SimplexResources.Objects
{
    public class oCryoSample : GameObject
    {
        
        
        public oCryoSample()
        {
            EditorPath = "Actors";
        }

        public override void EvtCreate()
        {
            
        }
        
        public override void EvtStep()
        {
            
        }

        public override void EvtDraw()
        {
            draw_circle(Position, 20, true, 0);
            //draw_triangle_new(Position.X-15,Position.Y,Position.X+15,Position.Y,Position.X,Position.Y-15,true,50);
        }

       
    }
}