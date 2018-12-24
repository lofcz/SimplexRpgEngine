using System;
using System.Collections.Generic;
using System.Text;
using Microsoft.Xna.Framework;
using Microsoft.Xna.Framework.Graphics;

namespace SimplexCore
{
    public static partial class Sgml
    {
        public static Matrix world;
        public static Matrix view;
        public static Matrix projection;
        public static Matrix normalizedMatrix;

        public static RenderTarget2D surface_create(int width, int height)
        {
            return new RenderTarget2D(GraphicsDevice, width, height, false, GraphicsDevice.PresentationParameters.BackBufferFormat, DepthFormat.Depth24);
        }

        public static void surface_set_target(RenderTarget2D surface)
        {
            GraphicsDevice.SetRenderTarget(surface);
            GraphicsDevice.Clear(Color.CornflowerBlue);
            be.View = normalizedMatrix;
            m = normalizedMatrix;
            be.Projection = Matrix.CreateOrthographicOffCenter(0, surface.Width,surface.Height, 0, 0, -1);
        }

        public static void surface_reset_target()
        {            
            GraphicsDevice.SetRenderTarget(null);
        }

      
    }
}
