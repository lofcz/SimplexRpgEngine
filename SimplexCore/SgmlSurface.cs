using System;
using System.Collections.Generic;
using System.IO;
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
            return new RenderTarget2D(GraphicsDevice, width, height, false, GraphicsDevice.PresentationParameters.BackBufferFormat, DepthFormat.Depth24, 0, RenderTargetUsage.PreserveContents);
        }

        public static void draw_clear_transparent()
        {
            GraphicsDevice.Clear(Color.Transparent);
        }

        public static void surface_set_target(RenderTarget2D surface)
        {
            GraphicsDevice.SetRenderTarget(surface);

            be.View = normalizedMatrix;
            m = normalizedMatrix;
            be.Projection = Matrix.CreateOrthographicOffCenter(0, surface.Width,surface.Height, 0, 0, -1);
        }

        public static void surface_reset_target()
        {            
            GraphicsDevice.SetRenderTarget(null);
        }

        public static void surface_resize(ref RenderTarget2D surface, int width, int height)
        {
            surface = surface_create(width, width);
        }

        public static int surface_get_height(RenderTarget2D surface)
        {
            return surface.Height;
        }

        public static int surface_get_width(RenderTarget2D surface)
        {
            return surface.Width;
        }

        public static Color[] surface_get_pixels(RenderTarget2D surface)
        {
            Color[] rawData = new Color[surface.Width * surface.Height];
            surface.GetData<Color>(rawData);
            return rawData;
        }

        public static Color surface_get_pixel(RenderTarget2D surface, int x, int y)
        {
            Color[] c = new Color[1];
            Rectangle extractRegion = new Rectangle(x, y, 1, 1);

            surface.GetData<Color>(0, extractRegion, c, 0, 1);
            return c[0];
        }

        public static void surface_free(RenderTarget2D surface)
        {
            surface.Dispose();
        }

        public enum ImageFormat
        {
            Png,
            Jpg
        }

        public static void surface_save(RenderTarget2D surface, string fname, ImageFormat format = ImageFormat.Png)
        {
            if (format == ImageFormat.Png)
            {
                Stream stream = File.Create(fname + ".png");
                surface.SaveAsPng(stream, surface.Width, surface.Height);
                stream.Close();
            }
            else
            {
                Stream stream = File.Create(fname + ".jpg");
                surface.SaveAsJpeg(stream, surface.Width, surface.Height);
                stream.Close();
            }
        }

        public static void surface_save_ext(RenderTarget2D surface, string fname, int width, int height, ImageFormat format = ImageFormat.Png)
        {
            if (format == ImageFormat.Png)
            {
                RenderTarget2D temp = new RenderTarget2D(GraphicsDevice, width, height);
                surface_set_target(temp);
                draw_surface_stretched(new Vector2(0, 0), surface, new Vector2(width, height));
                surface_reset_target();

                Stream stream = File.Create(fname + ".png");
                temp.SaveAsPng(stream, width, height);
                stream.Close();

                temp.Dispose();
            }
            else
            {
                Stream stream = File.Create(fname + ".jpg");
                surface.SaveAsJpeg(stream, width, height);
                stream.Close();
            }
        }
    }
}
