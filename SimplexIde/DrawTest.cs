using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.Xna.Framework;
using MonoGame.Forms.Controls;

namespace SimplexIde
{
    public class DrawTest : DrawWindow
    {
        protected override void Initialize()
        {
            base.Initialize();
        }

        protected override void Draw()
        {
            base.Draw();

            Editor.spriteBatch.Begin();
            Editor.spriteBatch.DrawString(Editor.Font, "Hello IDE", new Vector2(100, 100), Color.White);
            Editor.spriteBatch.End();

        }
    }
}
