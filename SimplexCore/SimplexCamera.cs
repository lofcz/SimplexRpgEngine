using Microsoft.Xna.Framework;
using MonoGame.Extended;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Text;

namespace SimplexCore
{
    [Serializable]
    public class SimplexCamera
    {
        public Camera2D Camera;
        public Vector2 TargetPosition;
        public Vector2 Position;
        public float TransformSpeed;

        public void UpdatePosition()
        {
            float newX = SimplexMath.Lerp(Position.X, TargetPosition.X, TransformSpeed);
            float newY = SimplexMath.Lerp(Position.Y, TargetPosition.Y, TransformSpeed);

            Position.X = newX;
            Position.Y = newY;


            Camera.Position = new Vector2(newX, newY);
        }
    }
}
