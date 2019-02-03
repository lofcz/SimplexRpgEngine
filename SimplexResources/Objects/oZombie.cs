using System;
using System.Collections.Generic;
using System.Text;
using Microsoft.Xna.Framework;
using SimplexCore;
using static SimplexCore.Sgml;
using Color = Microsoft.Xna.Framework.Color;

namespace SimplexResources.Objects
{
    public class oZombie : GameObject
    {

        public oZombie()
        {
            EditorPath = "Objects/Actors/oBrick";
        }

        public override void EvtDraw()
        {
            Color c = Color.White;
            Vector2? vp;
            vp = line_intersects_rectangle_rotate(new Vector2(200, 200), mouse, rr);

            if (vp.HasValue)
            {
                c = Color.Red;
            }

            draw_set_color(c);
            draw_line(200f, 200f, mouse.X, mouse.Y);

            if (vp.HasValue)
            {
                draw_circle_fast(vp.Value, 8, 24, Color.Red);
            }

            draw_set_color(Color.White);
        }
    }
}
