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

            double[,] Grid = grid_set(new Vector2(0, 0), new Vector2(150, 150), 32);
            int size = Grid.GetLength(1);

            for (int i = 0; i < size; i++)
            {
                float Xlol = (float)x1d(i, Grid);
                float Ylol = (float)y1d(i, Grid);
                Debug.WriteLine("x:{0}, y:{1}", Xlol, Ylol);
            }
        }
        double x1d(int index, double[,] Grid2D)
        {
            return Grid2D[0, index] % 10000;
        }

        double y1d(int index, double[,] Grid2D)
        {
            return floor(Grid2D[0, index] / 10000);
        }
        public override void EvtStep()
        {
            
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