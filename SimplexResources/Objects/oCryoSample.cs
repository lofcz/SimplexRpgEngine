using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Text;
using Microsoft.Xna.Framework;
using Microsoft.Xna.Framework.Input;
using MonoGame.Extended;
using SimplexCore;
using static SimplexCore.Sgml;
using Microsoft.Xna.Framework.Graphics;

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
            /*RenderTarget2D surf = surface_create(64, 64);
            surface_resize(ref surf, 1024, 1024);
            surface_set_target(surf);
            draw_circle(Position, 20, true);
            surface_reset_target();
            int value = surface_get_height(surf);
            surface_get_pixels(surf);
            Color[] col = surface_get_pixels(surf);
            surface_free(surf);
            surf = surface_create(64, 64);
            surface_resize(ref surf, 1024, 1024);
            surface_set_target(surf);
            draw_circle(Position, 20, true);
            surface_reset_target();
            string a = "Surf";
            surface_save(surf, a, ImageFormat.Jpg);
            surface_save(surf, "Surf");
            surface_free(surf);*/

        }

        public override void EvtStep()
        {
            
        }

        public override void EvtDraw()
        {
            shader_get("fuck off");
            Vector2 pos1;
            pos1.X = Position.X - 20;
            pos1.Y = Position.Y - 20;

            Vector2 pos2;
            pos2.X = Position.X + 20;
            pos2.Y = Position.Y + 20;

            draw_roundrect(pos1, pos2,true);
            //draw_triangle_new(Position.X-15,Position.Y,Position.X+15,Position.Y,Position.X,Position.Y-15,true,50);
        }
    }
}