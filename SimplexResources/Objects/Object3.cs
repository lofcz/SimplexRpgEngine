using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Drawing;
using System.Speech.Synthesis;
using System.Text;
using Microsoft.Xna.Framework;
using Microsoft.Xna.Framework.Graphics;
using Microsoft.Xna.Framework.Input;
using MonoGame.Extended;
using MonoGame.Extended.TextureAtlases;
using SimplexCore;
using static SimplexCore.Sgml;
using Color = Microsoft.Xna.Framework.Color;
using Point = Microsoft.Xna.Framework.Point;

namespace SimplexResources.Objects
{
    public class Object3 : GameObject
    {
        public Color color = Color.White;
        public double r = 32;
        private double scale = 1;
        private bool flag = false;
        List<Spring> springs = new List<Spring>();
        private int time = 0;
        private Vector2 endPos;
        private ColliderCircle cc;
        public Object3()
        {
            Sprite.TextureSource = "texture";
            EditorPath = "Colliders";
            Mass = 32;

            for (int i = 0; i < 50; i++)
            {
                //springs.Add(new Spring());
            }

            synth_set_rate(5);
            synth_speak_async("Welcome to Simplex engine");

         //   Speed = random_range(0.5, 2);
          //  Friction = 0.05;

            int index = irandom(50);
            //springs[index].Splash(10);
            endPos = new Vector2(irandom_range(-100, 100), irandom_range(-100, 100));

            // This creates a new circle collider
            // setting some properties
            cc = new ColliderCircle();
            cc.Radius = 64;
            cc.Name = "main";
            cc.GameObject = this;

            // Add collider to the list of active colliders
            Colliders.Add(cc);

            // This will trigger script "MyCollision" when our collider main collides with collider "main" of any "Object3"
            // last arg ensures that the check will be triggered on each frame without explicit ask for it
            RegisterCollider(cc, typeof(Object3), "main", typeof(ColliderRectangle), MyCollision, true);          
        }

        // "other" is the collider we've hit and contains reference to the object it belongs to
        void MyCollision(ColliderBase other)
        {

        }

        public override void EvtDraw(SpriteBatch s, SpriteFont f, Texture2D objectTexture, DynamicVertexBuffer vb, BasicEffect be, Matrix m)
        {
            UpdateState();
            UpdateColliders();

            DrawStart(s, vb, be, m, this);

            time++;
          //  draw_sprite(objectTexture, 0, Position);
            sb.Begin(transformMatrix: m);
           // sb.DrawString(f, Sprite.cellW.ToString(), Position, Color.Chartreuse);
            sb.End();
            // DrawRectangle(Position, new Vector2(32, 32), true, 3);

            //draw_line(Position, new Vector2(Position.X, Position.Y - 100));
            //draw_line_width_color(Position, new Vector2(Position.X, Position.Y - 100), 4, Color.Orange, Color.Lime, Color.Red, Color.Gold);

            if (Input.KeyboardState.IsKeyDown(Keys.Q))
            {
                flag = true;
                //MessageBox.Show("ok", "kkk", new string[] {"kokot"});
            }

            if (Input.KeyboardState.IsKeyDown(Keys.E))
            {
                flag = false;
                //MessageBox.Show("ok", "kkk", new string[] {"kokot"});
            }

            if (flag)
            {
               // r = lerp(r, 180, 0.1);
            }
            else
            {
               // r = lerp(r, 0, 0.1);
            }

            if (Input.KeyboardState.IsKeyDown(Keys.D))
            {
             //   int dir = irandom_range(0, 360);
            //    Velocity.X = (float)lengthdir_x(5, dir);
            //    Velocity.Y = (float)lengthdir_y(5, dir);
           
            }

            if (keyboard_check_released(Keys.L))
            {
                MessageBox.Show("kokot", "koko", new[] {"bléééééé"});
                
            }

            //  draw_triangle(Position.X, Position.Y, Position.X + 100, Position.Y, Position.X + 50, Position.Y + 50, true, r);
            //  draw_line(Position, new Vector2(Position.X, Position.Y - 100));
            //  draw_line_width(Position, new Vector2(Position.X, Position.Y - 100), 5, r);
            //  draw_ellipse(Position, new Vector2(50, 100), (float)r);
            //  draw_fluid(Spring.UpdateSprings(springs.ToArray()).ToArray());
            //  draw_circle(Position, 64, false);
            //  draw_roundrect(Position, new Vector2(Position.X + 200, Position.Y + 200), false, (int)r);
            //  draw_line_width_color(Position, new Vector2(Position.X, Position.Y - 100), 5, Color.Red, Color.Lime, Color.DarkRed, Color.Yellow, r);
            //  draw_rectangle(Position, new Vector2(Position.X + 100, Position.Y + 100), true, r); // scale * (abs(sin(degtorad(time))) * .1)
            //  draw_arrow(Position, Position + endPos, 16);
            //  Speed = 1;
          Sprite.ImageRectangle = new Microsoft.Xna.Framework.Rectangle(0, 0, 64, 64);

        //  draw_circle(new Vector2(Position.X + 32, Position.Y + 32), (int)r, true);
        //draw_circle_fast(new Vector2(Position.X + 32, Position.Y + 32), (int)r, 24, color);

       draw_circle_fast((Colliders[0] as ColliderCircle).Position, (int)(Colliders[0] as ColliderCircle).Radius, 24, color);

       // draw_rectangle(new Vector2(Position.X - 64, Position.Y - 64), new Vector2(Position.X + 64, Position.Y + 64), true);
            //       Direction = point_direction(new Vector2(Position.X + 32, Position.Y + 32), Input.MousePosition);
            //     draw_line(new Vector2(Position.X + 32, Position.Y + 32), new Vector2(Position.X + 32 + (float)lengthdir_x(32, Direction), Position.Y + 32 + (float)lengthdir_y(32, Direction)));

            // ((ColliderCircle)Colliders[0])
        }
    }
}
