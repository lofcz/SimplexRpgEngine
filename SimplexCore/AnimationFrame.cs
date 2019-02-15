using System;
using System.Collections.Generic;
using System.Text;
using Microsoft.Xna.Framework.Graphics;

namespace SimplexCore
{
    public class AnimationFrame
    {
        public Texture texture;
        public List<AnimationLayer> layers = new List<AnimationLayer>();
    }

    public class AnimationLayer
    {
        public string name;
        public bool visible;
        public RenderTarget2D texture;

        public AnimationLayer()
        {
            visible = true;
        }
    }
}
