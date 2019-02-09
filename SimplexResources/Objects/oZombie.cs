using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Text;
using Microsoft.Xna.Framework;
using Microsoft.Xna.Framework.Graphics;
using SimplexCore;
using static SimplexCore.Sgml;
using Color = Microsoft.Xna.Framework.Color;

namespace SimplexResources.Objects
{
    public class oZombie : GameObject
    {
        Triangle t1 = new Triangle(new Vector2(400, 400), new Vector2(500, 400), new Vector2(450, 350));
        Triangle t2 = new Triangle();
        List<Vector2> randomVectors = new List<Vector2>();
        List<Vector2> kkt = new List<Vector2>();
        Vector2 selected = Vector2.One;
        public oZombie()
        {
            EditorPath = "Objects/Actors/oBrick";
        }

        public override void EvtCreate()
        {
            Texture2D[] x = new Texture2D[500];

            for (var i = 0; i < 500; i++)
            {
                int k = choose(4, 8, 16, 32, 64, 128);
                int w = choose(4, 8, 16, 32, 64, 128);//k;//irandom_range(64, 256);
                int h = choose(4, 8, 16, 32, 64, 128);//k;//irandom_range(64, 256);
                Texture2D t = new Texture2D(Sgml.GraphicsDevice, w, h);
                Color[] data = new Color[w * h];
                Color c = choose(Color.Red, Color.Gray, Color.Lime, Color.Beige, Color.Aqua, Color.Green, Color.Yellow, Color.Chocolate, Color.Black, Color.Fuchsia);
                for (var j = 0; j < w * h; j++)
                {
                    data[j] = c;
                }

                t.SetData(data);
                x[i] = t;
            }
            Stopwatch s = new Stopwatch();
            s.Start();
            //SimplexTexurePacker.PackTextures(x, 1048, 0);
            s.Stop();
            //Sgml.show_message(s.ElapsedMilliseconds.ToString());

            for (int i = 0; i < 400; i++)
            {
                Vector2 v = new Vector2(irandom_range(200, 800), irandom_range(200, 800));
                randomVectors.Add(v);                                                
            }

             kkt = new List<Vector2>(randomVectors.ToArray());
        }

        public override void EvtDraw()
        {
            Color c = Color.White;
            Vector2? vp;
            vp = line_in_rectangle_rotated_nearest(new Vector2(200, 200), mouse, rr);

            if (vp.HasValue)
            {
                c = Color.Red;
            }

            draw_set_color(c);
           // draw_line(200f, 200f, mouse.X, mouse.Y);

            if (vp.HasValue)
            {
            //    draw_circle_fast(vp.Value, 8, 24, Color.Red);
            }

            draw_set_color(Color.White);
            t2.Point1 = mouse;
            t2.Point2 = new Vector2(mouse.X + 100, mouse.Y);
            t2.Point3 = new Vector2(mouse.X + 50, mouse.Y - 50);

            List<Vector2> p = triangle_in_triangle_all(t1, t2);

            foreach (Vector2 v in p)
            {
                draw_circle_fast(v, 8, 24, Color.Red);
            }

         //   draw_triangle(t1, true, 0);
          // draw_triangle(t2, true, 0);

       
            List<Vector2> sorted = convex_hull(randomVectors);

            for (int i = 0; i < randomVectors.Count; i++)
            {
                Vector2 v = randomVectors[i];

                draw_set_color(Color.White);

                if (point_in_circle(v, mouse, 8))
                {
                    draw_set_color(Color.Lime);

                    if (mouse_check_button_pressed(MouseButtons.Left))
                    {
                        selected = v;
                    }
                }

                if (v == selected)
                {
                    v.X = mouse.X;
                    v.Y = mouse.Y;

                    randomVectors[i] = v;
                }

                draw_circle_fast(v, 16, 24, DrawGetColor());
            }

            if (mouse_check_button_released(MouseButtons.Left))
            {
                selected = Vector2.One;                
            }

            Vector2 s = sorted[0];
            Vector2 last = sorted[0];

            draw_set_color(Color.Red);
            foreach (Vector2 v in sorted)
            {             
                draw_line(s, v);
                s = v;

            }

            draw_line(s, last);
            draw_set_color(Color.White);
        }
    }
}
