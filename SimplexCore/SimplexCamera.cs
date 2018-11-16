using MonoGame.Extended;
using System;
using System.Collections.Generic;
using System.Text;
using Microsoft.Xna.Framework;
using Microsoft.Xna.Framework.Graphics;
using MonoGame.Extended.ViewportAdapters;

namespace SimplexCore
{
    public class SimplexCamera
    {     
        public Camera2D Camera { get; set; }
        public Vector2 TargetPosition { get; set; }
        public Vector2 TransformSpeed { get; set; }

        public void UpdatePosition(GameTime gameTime)
        {
            Camera.Move(new Vector2(TargetPosition.X, TargetPosition.Y) * (float)gameTime.ElapsedGameTime.TotalSeconds);
        }
    }
}
