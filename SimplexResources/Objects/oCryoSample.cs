using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Drawing;
using System.Text;
using Microsoft.Xna.Framework;
using Microsoft.Xna.Framework.Graphics;
using Microsoft.Xna.Framework.Input;
using Microsoft.Xna.Framework.Media;
using SimplexCore;
using SimplexIde;
using static SimplexCore.Sgml;
using RectangleF = MonoGame.Extended.RectangleF;

namespace SimplexResources.Objects
{
    public class oCryoSample : GameObject
    {
        
        List<Vector2> pos = new List<Vector2>();
        GamePath path = new GamePath();
        public oCryoSample()
        {
            EditorPath = "Actors";
        }

        public override void EvtCreate()
        {
            mp_grid_create(new System.Drawing.Rectangle(0, 0, 1024, 768), new Size(16,16));
            
        }
        
        public override void EvtStep()
        {
           /* if (mp_linear_objects(10,10,20,new []{typeof(oBrick), typeof(oGem)}) == false)
            {
                mp_linear_path(path);
            }*/
        }

        public override void EvtDraw()
        {
           draw_rectangle(new Vector2(Position.X + 100, Position.Y + 100), Position, true);
        }

       
    }
}