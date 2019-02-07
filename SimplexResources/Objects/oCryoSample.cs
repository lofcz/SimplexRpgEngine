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
using static SimplexCore.Sgml;
using RectangleF = MonoGame.Extended.RectangleF;

namespace SimplexResources.Objects
{
    public class oCryoSample : GameObject
    {
        
        List<Vector2> pos = new List<Vector2>();
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
            if (mp_linear_step(10, 10, 16) == true)
            {
                show_message("lol");
            }
        }

        public override void EvtDraw()
        {
            draw_circle(Position, 20, true, 0);
            mp_grid_clear();
            if (mouse_check_button_pressed(MouseButtons.mb_right))
            {
                pos.Add(new Vector2(mouse.X / 32, mouse.Y / 32));
            }
            mp_grid_set_instance(this);
            //draw_triangle_new(Position.X-15,Position.Y,Position.X+15,Position.Y,Position.X,Position.Y-15,true,50);
        }

       
    }
}