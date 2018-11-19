using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.Xna.Framework;
using Microsoft.Xna.Framework.Input;
using MonoGame.Forms.Controls;

namespace SimplexIde3
{
    class PreviewEditor : UpdateWindow
    {
        GameTime g = new GameTime();

        protected override void Update(GameTime gameTime)
        {
            g = gameTime;
            base.Update(gameTime);
        }

        protected override void Draw()
        {
            base.Draw();
            
            double framerate = (1 / g.ElapsedGameTime.TotalSeconds);

            Editor.spriteBatch.Begin();
            Editor.spriteBatch.DrawString(Editor.Font, Math.Round(framerate).ToString(), new Vector2(100, 100),  Color.White);
            Editor.spriteBatch.End();

            MouseState ms = Mouse.GetState();

            if (ms.X >= 0 && ms.Y >= 0 && ms.X < this.Width && ms.Y < Height)
            {
                if (ms.LeftButton == ButtonState.Pressed)
                {
                    Debug.WriteLine("X: " + ms.X);
                }

            }
        }
    }
}