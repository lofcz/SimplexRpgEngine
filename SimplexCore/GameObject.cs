using System;
using System.Collections.Generic;
using System.Text;
using Microsoft.Xna.Framework;

namespace SimplexCore
{
    public class GameObject
    {
        public Sprite Sprite;
        public Vector2 Position;

        public float ImageIndex
        {
            get => _imageIndex;
            set
            {
                _imageIndex = value;
                _imageIndex = _imageIndex.Clamp(0, FramesCount);
            }
        }

        public float ImageAngle;
        public float ImageAngleTarget;
        public float TransformSpeed;
        public Vector2 ImageScale;
        public Vector2 ImageScaleTarget;
        public int FramesCount;


        private float _imageIndex;

        public GameObject()
        {
            ImageScale = Vector2.One;
            ImageScaleTarget = Vector2.One;
            ImageAngle = 0;
            ImageAngleTarget = 0;
            ImageIndex = 0;
            TransformSpeed = 0.2f;
        }



        public void UpdateImageAngle()
        {
            ImageAngle = SimplexMath.Lerp(ImageAngle, ImageAngleTarget, TransformSpeed);
        }

        public void UpdateImageScale()
        {
            ImageScale = new Vector2(SimplexMath.Lerp(ImageScale.X, ImageScaleTarget.X, TransformSpeed), SimplexMath.Lerp(ImageScale.Y, ImageScaleTarget.Y, TransformSpeed));
        }

        public void UpdateState()
        {
            UpdateImageScale();
            UpdateImageAngle();
        }
    }
}
