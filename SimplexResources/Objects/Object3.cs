using System;
using System.Collections.Generic;
using System.Drawing;
using System.Text;
using Microsoft.Xna.Framework;
using Microsoft.Xna.Framework.Graphics;
using Microsoft.Xna.Framework.Input;
using MonoGame.Extended.TextureAtlases;
using SimplexCore;
using static SimplexCore.Sgml;
using Color = Microsoft.Xna.Framework.Color;


namespace SimplexResources.Objects
{
    public class Object3 : GameObject
    {
        double r = 0;
        private bool flag = false;
        List<Spring> springs = new List<Spring>();

        public Object3()
        {
            Sprite.TextureSource = "texture";
            EditorPath = "Colliders";

            for (int i = 0; i < 50; i++)
            {
                springs.Add(new Spring());
            }

            int index = irandom(50);
            //springs[index].Splash(10);
        }

        public override void EvtDraw(SpriteBatch s, SpriteFont f, Texture2D objectTexture, VertexBuffer vb, BasicEffect be, Matrix m)
        {
            DrawStart(s, vb, be, m, this);


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
                r = lerp(r, 180, 0.1);
            }
            else
            {
                r = lerp(r, 0, 0.1);
            }

            if (Input.KeyboardState.IsKeyDown(Keys.D))
            {
                int index = irandom(50);
                springs[index].Height = 400;


            }
            
            draw_ellipse(Position, new Vector2(50, 100), (float)r);
           // draw_fluid(Spring.UpdateSprings(springs.ToArray()).ToArray());
           //draw_circle(Position, 64, false);
             // draw_roundrect(Position, new Vector2(Position.X + 200, Position.Y + 200), false, (int)r);
        }
    }
}
