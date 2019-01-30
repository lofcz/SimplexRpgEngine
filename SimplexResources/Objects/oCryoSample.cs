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
using SimplexIde.PathFinder;

namespace SimplexResources.Objects
{
    public class oCryoSample : GameObject
    {
        private FindPath path;
        
        public oCryoSample()
        {
            EditorPath = "Actors";
        }

        public override void EvtCreate()
        {    
            path = new FindPath(Position);
            double[,] Grid =  grid_set(new Vector2(0,0), new Vector2(96,96), 32);
        }

        public override void EvtStep()
        {
            path.find_path();
        }
        
      /*  public override void EvtCreate()
        {
            timeline_add("random name");
        }
        

        public override void EvtStep()
        {
            UpdateState();

            if (timeline_count("random name") == 300)
            {
                Debug.WriteLine("pindík");
            }
        }*/

        public override void EvtDraw()
        {
            draw_circle(Position, 20, true, 0);
            //draw_triangle_new(Position.X-15,Position.Y,Position.X+15,Position.Y,Position.X,Position.Y-15,true,50);
        }
    }
}