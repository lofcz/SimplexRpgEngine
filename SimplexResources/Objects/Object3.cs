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
using Rectangle = Microsoft.Xna.Framework.Rectangle;

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
        private int timeToRed = 0;
        public Object3()
        {
            Sprite.TextureSource = "texture";
            EditorPath = "Colliders";
            Mass = 32;

            for (int i = 0; i < 50; i++)
            {
                //springs.Add(new Spring());
            }

         //   Speed = random_range(0.5, 2);
          //  Friction = 0.05;

            int index = irandom(50);
            //springs[index].Splash(10);
            endPos = new Vector2(irandom_range(-100, 100), irandom_range(-100, 100));

            // This creates a new circle collider
            // setting some properties
            cc = new ColliderCircle(this);
            cc.Radius = 64;
            cc.Name = "main";
            cc.GameObject = this;

            // Add collider to the list of active colliders
           // Colliders.Add(cc);

            EditorOptions = new[] {"I can have", "My own options", "Here"};

                
        }

        public override void EvtRegisterCollisions()
        {
            // Trigger action MyCollision, once our "main" collider hits with collider "main" of any other object3   
           // RegisterCollider("main", typeof(Object3), "main", MyCollision);
        }

        public override void EvtCreate()
        {
            Speed = 3;
            Direction = random_range(0, 360);
        }

        // "other" is the object we've hit
        void MyCollision(GameObject me, GameObject other)
        {

        }

        public override void EvtDraw()
        {
            color = Color.White;
            UpdateState();
            UpdateColliders();

            if (!currentRoom.Rect.Intersects(new Rectangle((int) Position.X, (int) Position.Y, 64, 64)))
            {
               color = Color.Red;

               if (Position.X <= 0 || Position.X >= 1024)
               {
                   Direction = 180 - Direction;
               }
               else if (Position.Y <= 0 || Position.Y >= 768)
               {
                   Direction = 360 - Direction;
               }

                // Direction = point_direction(Position, PositionPrevious);
                if (timeToRed > 1)
                {
                    Direction = point_direction(Position, new Vector2(1024 / 2, 768 / 2));
                    move_towards_point(new Vector2(1024 / 2, 768 / 2), 4);
                   // Debug.WriteLine("kokot");
                }

                Position = PositionPrevious;
                timeToRed++;

            }
            else
            {
                timeToRed = 0;
            }
            
            time++;
          //  draw_sprite(objectTexture, 0, Position);
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
                window_center();
            }

            draw_rectangle(new Vector2(-32, -32), new Vector2(1024 + 32, 768 + 32), true);
            Sprite.ImageRectangle = new Microsoft.Xna.Framework.Rectangle(0, 0, 64, 64);


         /*     draw_triangle(Position.X, Position.Y, Position.X + 100, Position.Y, Position.X + 50, Position.Y + 50, true, r);
              draw_line(Position, new Vector2(Position.X, Position.Y - 100));
              draw_line_width(Position, new Vector2(Position.X, Position.Y - 100), 5, r);
              draw_ellipse(Position, new Vector2(50, 100), (float)r);
              draw_fluid(Spring.UpdateSprings(springs.ToArray()).ToArray());
              draw_circle(Position, 64, false);
              draw_roundrect(Position, new Vector2(Position.X + 200, Position.Y + 200), false, (int)r);
              draw_line_width_color(Position, new Vector2(Position.X, Position.Y - 100), 5, Color.Red, Color.Lime, Color.DarkRed, Color.Yellow, r);
              draw_rectangle(Position, new Vector2(Position.X + 100, Position.Y + 100), true, r); // scale * (abs(sin(degtorad(time))) * .1)
              draw_arrow(Position, Position + endPos, 16);
              Speed = 1;
              move_wrap(true, true, 64);
              move_towards_point(mouse, 3);
              draw_circle(new Vector2(Position.X + 32, Position.Y + 32), (int)r, true);
              draw_circle_fast(new Vector2(Position.X + 32, Position.Y + 32), (int)r, 24, color);*/

            //draw_circle_fast((Colliders[0] as ColliderCircle).Position, (int)(Colliders[0] as ColliderCircle).Radius, 24, color, 90, 270);

       // draw_rectangle(new Vector2(Position.X - 64, Position.Y - 64), new Vector2(Position.X + 64, Position.Y + 64), true);
            //       Direction = point_direction(new Vector2(Position.X + 32, Position.Y + 32), Input.MousePosition);
            //     draw_line(new Vector2(Position.X + 32, Position.Y + 32), new Vector2(Position.X + 32 + (float)lengthdir_x(32, Direction), Position.Y + 32 + (float)lengthdir_y(32, Direction)));

            // ((ColliderCircle)Colliders[0])
        }
    }
}
