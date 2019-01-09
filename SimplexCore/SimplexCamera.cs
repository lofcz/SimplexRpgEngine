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
        public float Zoom;
        public float TargetZoom;
        public float Rotation;

        public void UpdatePosition()
        {
            float newX = (float)Sgml.lerp_aggressive(Position.X, TargetPosition.X, TransformSpeed);
            float newY = (float)Sgml.lerp_aggressive(Position.Y, TargetPosition.Y, TransformSpeed);
            float newZoom = (float)Sgml.lerp_aggressive(Zoom, TargetZoom, TransformSpeed);

            Position.X = newX;
            Position.Y = newY;
            Zoom = newZoom;

            Camera.Position = new Vector2(newX, newY);
            Camera.Zoom = (float)Sgml.clamp(Zoom, 0.05, 30);
            Camera.Rotation = Rotation;
        }

        public SimplexCamera()
        {
            Zoom = 1;
            TargetZoom = 1;
        }
    }
}
