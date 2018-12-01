using Microsoft.Xna.Framework.Graphics;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Text;
using System.Windows.Forms;
using System.Xml.Serialization;
using Microsoft.Xna.Framework;

namespace SimplexCore
{
    [Serializable]
    public class Sprite
    {
        [XmlIgnore]
        public Texture2D Texture { get; set; }

        public string TextureSource { get; set; }

        public int TextureRows { get; set; }
        public int TextureCellsPerRow { get; set; }
        public float ImageSpeed;
        public int Size;
        public float ImageAngle;
        public float ImageAngleTarget;
        public float TransformSpeed;
        public Vector2 ImageScale;
        public Vector2 ImageScaleTarget;
        public Vector2 ImageSize;
        public Rectangle ImageRectangle;
        public int FramesCount;
        public int cellW;
        public int cellH;

        public float ImageIndex
        {
            get => _imageIndex;
            set
            {
                _imageIndex = value;
               
                if (_imageIndex >= FramesCount)
                {
                    _imageIndex = 0;
                }
                _imageIndex = _imageIndex.Clamp(0, FramesCount);
            }
        }


        private float _imageIndex;
        public Sprite()
        {
            ImageScale = Vector2.One;
            ImageScaleTarget = Vector2.One;
            ImageAngle = 0;
            ImageAngleTarget = 0;
            ImageIndex = 0;
            TransformSpeed = 0.2f;
            FramesCount = 0;

        }

        public int GetFramesCount()
        {
            return Math.Max(((TextureCellsPerRow * (int)ImageSize.X) / ((int)ImageSize.X)) * ((TextureRows * (int)ImageSize.Y) / ((int)ImageSize.Y)) - 1, 0);
        }

        public void UpdateImageAngle()
        {
            ImageAngle = SimplexMath.Lerp(ImageAngle, ImageAngleTarget, TransformSpeed);
        }

        public void UpdateImageScale()
        {
            ImageScale = new Vector2(SimplexMath.Lerp(ImageScale.X, ImageScaleTarget.X, TransformSpeed), SimplexMath.Lerp(ImageScale.Y, ImageScaleTarget.Y, TransformSpeed));
        }

        public void UpdateImageRectangle()
        {
            if (TextureCellsPerRow > 0)
            { 
                int y = ((int)ImageIndex / TextureCellsPerRow);
                int x = ((int)ImageIndex % TextureCellsPerRow);

                //Debug.WriteLine("x:" + x + " y: " + y);

                ImageRectangle = new Rectangle(x * (int)ImageSize.X, y * (int)ImageSize.Y, (int)ImageSize.X, (int)ImageSize.Y);
            }
        }
    }
}
