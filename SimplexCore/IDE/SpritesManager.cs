using System;
using System.Collections.Generic;
using System.Drawing;
using System.Drawing.Imaging;
using System.Text;
using SharpDX.Direct2D1;
using Bitmap = System.Drawing.Bitmap;
using PixelFormat = System.Drawing.Imaging.PixelFormat;
using Rectangle = System.Drawing.Rectangle;

namespace SimplexCore.IDE
{
    public static class SpritesManager
    {
        public static Bitmap[] BitmapToSixFortySeven(Bitmap bmp)
        {
            // Determine size of the output array
            int size = (bmp.Size.Width / 64) * (bmp.Size.Height / 96);
            Bitmap[] outputBitmaps = new Bitmap[size];

            int index = 0;
            for (var i = 0; i < bmp.Size.Height / 96; i++)
            {
                for (var j = 0; j < bmp.Size.Width / 64; j++)
                {
                    // each cell in a row
                    outputBitmaps[index] = bmp.Clone(new System.Drawing.Rectangle(j * 64, i * 96, 64, 96), PixelFormat.Format32bppArgb);
                    //outputBitmaps[index].Save("tempFile" + index + ".png", ImageFormat.Png);
                    index++;
                }
            }

            return outputBitmaps;
        }

        public static Bitmap PreTilesetsToOneBitmap(Bitmap[] bmps, int width, int height)
        {
            Bitmap outputbitmap = new Bitmap(width, height);

            int x = 0;
            int y = 0;
            using (Graphics g = Graphics.FromImage(outputbitmap))
            {
                for (var i = 0; i < bmps.Length; i++)
                {
                    // Convert each pre-tile to 47 then draw it to the final map
                    Bitmap converted = PreTileTo47(bmps[i]);
                    //converted.Save("tempTest" + i + ".png", ImageFormat.Png);
                    g.DrawImage(converted, new RectangleF(x, y, 256, 192), new RectangleF(0, 0, converted.Width, converted.Height), GraphicsUnit.Pixel);
                    x += 256;

                    if (x >= outputbitmap.Width)
                    {
                        x = 0;
                        y += 192;
                    }
                }
            }


            return outputbitmap;
        }

        // INSANE HARDCODE HERE BEWARE
        public static Bitmap PreTileTo47(Bitmap lastImage)
        {
            Bitmap bpp = new Bitmap(256, 192);

            #region Algorithm logic

            CopyRegionIntoImage(lastImage, new Rectangle(16, 48, 32, 32), ref bpp, new Rectangle(0, 0, 32, 32));

            CopyRegionIntoImage(lastImage, new Rectangle(16, 48, 32, 32), ref bpp, new Rectangle(32, 0, 32, 32));
            CopyRegionIntoImage(lastImage, new Rectangle(32, 0, 16, 16), ref bpp, new Rectangle(32, 0, 16, 16));

            CopyRegionIntoImage(lastImage, new Rectangle(16, 48, 32, 32), ref bpp, new Rectangle(64, 0, 32, 32));
            CopyRegionIntoImage(lastImage, new Rectangle(48, 0, 16, 16), ref bpp, new Rectangle(80, 0, 16, 16));

            CopyRegionIntoImage(lastImage, new Rectangle(16, 48, 32, 32), ref bpp, new Rectangle(96, 0, 32, 32));
            CopyRegionIntoImage(lastImage, new Rectangle(32, 0, 16, 16), ref bpp, new Rectangle(96, 0, 16, 16));
            CopyRegionIntoImage(lastImage, new Rectangle(48, 0, 16, 16), ref bpp, new Rectangle(112, 0, 16, 16));

            CopyRegionIntoImage(lastImage, new Rectangle(16, 48, 32, 32), ref bpp, new Rectangle(128, 0, 32, 32));
            CopyRegionIntoImage(lastImage, new Rectangle(48, 16, 16, 16), ref bpp, new Rectangle(144, 16, 16, 16));

            CopyRegionIntoImage(lastImage, new Rectangle(16, 48, 32, 32), ref bpp, new Rectangle(160, 0, 32, 32));
            CopyRegionIntoImage(lastImage, new Rectangle(48, 16, 16, 16), ref bpp, new Rectangle(176, 16, 16, 16));
            CopyRegionIntoImage(lastImage, new Rectangle(32, 0, 16, 16), ref bpp, new Rectangle(160, 0, 16, 16));

            CopyRegionIntoImage(lastImage, new Rectangle(16, 48, 32, 32), ref bpp, new Rectangle(192, 0, 32, 32));
            CopyRegionIntoImage(lastImage, new Rectangle(48, 0, 16, 16), ref bpp, new Rectangle(208, 0, 16, 16));
            CopyRegionIntoImage(lastImage, new Rectangle(48, 16, 16, 16), ref bpp, new Rectangle(208, 16, 16, 16));

            CopyRegionIntoImage(lastImage, new Rectangle(16, 48, 32, 32), ref bpp, new Rectangle(224, 0, 32, 32));
            CopyRegionIntoImage(lastImage, new Rectangle(48, 0, 16, 16), ref bpp, new Rectangle(240, 0, 16, 16));
            CopyRegionIntoImage(lastImage, new Rectangle(48, 16, 16, 16), ref bpp, new Rectangle(240, 16, 16, 16));
            CopyRegionIntoImage(lastImage, new Rectangle(32, 0, 16, 16), ref bpp, new Rectangle(224, 0, 16, 16));

            CopyRegionIntoImage(lastImage, new Rectangle(16, 48, 32, 32), ref bpp, new Rectangle(0, 32, 32, 32));
            CopyRegionIntoImage(lastImage, new Rectangle(32, 16, 16, 16), ref bpp, new Rectangle(0, 48, 16, 16));

            CopyRegionIntoImage(lastImage, new Rectangle(16, 48, 32, 32), ref bpp, new Rectangle(32, 32, 32, 32));
            CopyRegionIntoImage(lastImage, new Rectangle(32, 0, 16, 32), ref bpp, new Rectangle(32, 32, 16, 32));

            CopyRegionIntoImage(lastImage, new Rectangle(16, 48, 32, 32), ref bpp, new Rectangle(64, 32, 32, 32));
            CopyRegionIntoImage(lastImage, new Rectangle(48, 0, 16, 16), ref bpp, new Rectangle(80, 32, 16, 16));
            CopyRegionIntoImage(lastImage, new Rectangle(32, 16, 16, 16), ref bpp, new Rectangle(64, 48, 16, 16));

            CopyRegionIntoImage(lastImage, new Rectangle(16, 48, 32, 32), ref bpp, new Rectangle(96, 32, 32, 32));
            CopyRegionIntoImage(lastImage, new Rectangle(48, 0, 16, 16), ref bpp, new Rectangle(112, 32, 16, 16));
            CopyRegionIntoImage(lastImage, new Rectangle(32, 16, 16, 16), ref bpp, new Rectangle(96, 48, 16, 16));
            CopyRegionIntoImage(lastImage, new Rectangle(32, 0, 16, 16), ref bpp, new Rectangle(96, 32, 16, 16));

            CopyRegionIntoImage(lastImage, new Rectangle(16, 48, 32, 32), ref bpp, new Rectangle(128, 32, 32, 32));
            CopyRegionIntoImage(lastImage, new Rectangle(32, 16, 32, 16), ref bpp, new Rectangle(128, 48, 32, 16));

            CopyRegionIntoImage(lastImage, new Rectangle(16, 48, 32, 32), ref bpp, new Rectangle(160, 32, 32, 32));
            CopyRegionIntoImage(lastImage, new Rectangle(32, 16, 32, 16), ref bpp, new Rectangle(160, 48, 32, 16));
            CopyRegionIntoImage(lastImage, new Rectangle(32, 0, 16, 16), ref bpp, new Rectangle(160, 32, 16, 16));

            CopyRegionIntoImage(lastImage, new Rectangle(16, 48, 32, 32), ref bpp, new Rectangle(192, 32, 32, 32));
            CopyRegionIntoImage(lastImage, new Rectangle(32, 16, 32, 16), ref bpp, new Rectangle(192, 48, 32, 16));
            CopyRegionIntoImage(lastImage, new Rectangle(48, 0, 16, 16), ref bpp, new Rectangle(208, 32, 16, 16));

            CopyRegionIntoImage(lastImage, new Rectangle(32, 0, 32, 32), ref bpp, new Rectangle(224, 32, 32, 32));

            CopyRegionIntoImage(lastImage, new Rectangle(0, 48, 32, 32), ref bpp, new Rectangle(0, 64, 32, 32));

            CopyRegionIntoImage(lastImage, new Rectangle(0, 48, 32, 32), ref bpp, new Rectangle(32, 64, 32, 32));
            CopyRegionIntoImage(lastImage, new Rectangle(48, 0, 16, 16), ref bpp, new Rectangle(48, 64, 16, 16));

            CopyRegionIntoImage(lastImage, new Rectangle(0, 48, 32, 32), ref bpp, new Rectangle(64, 64, 32, 32));
            CopyRegionIntoImage(lastImage, new Rectangle(48, 16, 16, 16), ref bpp, new Rectangle(80, 80, 16, 16));

            CopyRegionIntoImage(lastImage, new Rectangle(0, 48, 32, 32), ref bpp, new Rectangle(96, 64, 32, 32));
            CopyRegionIntoImage(lastImage, new Rectangle(48, 16, 16, 16), ref bpp, new Rectangle(112, 80, 16, 16));
            CopyRegionIntoImage(lastImage, new Rectangle(48, 0, 16, 16), ref bpp, new Rectangle(112, 64, 16, 16));

            CopyRegionIntoImage(lastImage, new Rectangle(16, 32, 32, 32), ref bpp, new Rectangle(128, 64, 32, 32));

            CopyRegionIntoImage(lastImage, new Rectangle(16, 32, 32, 32), ref bpp, new Rectangle(160, 64, 32, 32));
            CopyRegionIntoImage(lastImage, new Rectangle(48, 16, 16, 16), ref bpp, new Rectangle(176, 80, 16, 16));

            CopyRegionIntoImage(lastImage, new Rectangle(16, 32, 32, 32), ref bpp, new Rectangle(192, 64, 32, 32));
            CopyRegionIntoImage(lastImage, new Rectangle(32, 16, 16, 16), ref bpp, new Rectangle(192, 80, 16, 16));

            CopyRegionIntoImage(lastImage, new Rectangle(16, 32, 32, 32), ref bpp, new Rectangle(224, 64, 32, 32));
            CopyRegionIntoImage(lastImage, new Rectangle(48, 16, 16, 16), ref bpp, new Rectangle(240, 80, 16, 16));
            CopyRegionIntoImage(lastImage, new Rectangle(32, 16, 16, 16), ref bpp, new Rectangle(224, 80, 16, 16));

            CopyRegionIntoImage(lastImage, new Rectangle(32, 48, 32, 32), ref bpp, new Rectangle(0, 96, 32, 32));

            CopyRegionIntoImage(lastImage, new Rectangle(32, 48, 32, 32), ref bpp, new Rectangle(32, 96, 32, 32));
            CopyRegionIntoImage(lastImage, new Rectangle(32, 16, 16, 16), ref bpp, new Rectangle(32, 112, 16, 16));

            CopyRegionIntoImage(lastImage, new Rectangle(32, 48, 32, 32), ref bpp, new Rectangle(64, 96, 32, 32));
            CopyRegionIntoImage(lastImage, new Rectangle(32, 0, 16, 16), ref bpp, new Rectangle(64, 96, 16, 16));

            CopyRegionIntoImage(lastImage, new Rectangle(32, 48, 32, 32), ref bpp, new Rectangle(96, 96, 32, 32));
            CopyRegionIntoImage(lastImage, new Rectangle(32, 16, 16, 16), ref bpp, new Rectangle(96, 112, 16, 16));
            CopyRegionIntoImage(lastImage, new Rectangle(32, 0, 16, 16), ref bpp, new Rectangle(96, 96, 16, 16));

            CopyRegionIntoImage(lastImage, new Rectangle(16, 64, 32, 32), ref bpp, new Rectangle(128, 96, 32, 32));

            CopyRegionIntoImage(lastImage, new Rectangle(16, 64, 32, 32), ref bpp, new Rectangle(160, 96, 32, 32));
            CopyRegionIntoImage(lastImage, new Rectangle(32, 0, 16, 16), ref bpp, new Rectangle(160, 96, 16, 16));

            CopyRegionIntoImage(lastImage, new Rectangle(16, 64, 32, 32), ref bpp, new Rectangle(192, 96, 32, 32));
            CopyRegionIntoImage(lastImage, new Rectangle(48, 0, 16, 16), ref bpp, new Rectangle(208, 96, 16, 16));

            CopyRegionIntoImage(lastImage, new Rectangle(16, 64, 32, 32), ref bpp, new Rectangle(224, 96, 32, 32));
            CopyRegionIntoImage(lastImage, new Rectangle(32, 0, 16, 16), ref bpp, new Rectangle(224, 96, 16, 16));
            CopyRegionIntoImage(lastImage, new Rectangle(48, 0, 16, 16), ref bpp, new Rectangle(240, 96, 16, 16));

            CopyRegionIntoImage(lastImage, new Rectangle(0, 48, 16, 32), ref bpp, new Rectangle(0, 128, 16, 32));

            CopyRegionIntoImage(lastImage, new Rectangle(48, 48, 16, 32), ref bpp, new Rectangle(16, 128, 16, 32));

            CopyRegionIntoImage(lastImage, new Rectangle(16, 32, 32, 16), ref bpp, new Rectangle(32, 128, 32, 16));

            CopyRegionIntoImage(lastImage, new Rectangle(16, 80, 32, 16), ref bpp, new Rectangle(32, 144, 32, 16));

            CopyRegionIntoImage(lastImage, new Rectangle(0, 32, 32, 32), ref bpp, new Rectangle(64, 128, 32, 32));

            CopyRegionIntoImage(lastImage, new Rectangle(0, 32, 32, 32), ref bpp, new Rectangle(96, 128, 32, 32));
            CopyRegionIntoImage(lastImage, new Rectangle(48, 16, 16, 16), ref bpp, new Rectangle(96 + 16, 128 + 16, 16, 16));

            CopyRegionIntoImage(lastImage, new Rectangle(32, 32, 32, 32), ref bpp, new Rectangle(128, 128, 32, 32));

            CopyRegionIntoImage(lastImage, new Rectangle(32, 32, 32, 32), ref bpp, new Rectangle(160, 128, 32, 32));
            CopyRegionIntoImage(lastImage, new Rectangle(32, 16, 16, 16), ref bpp, new Rectangle(160, 128 + 16, 16, 16));

            CopyRegionIntoImage(lastImage, new Rectangle(32, 64, 32, 32), ref bpp, new Rectangle(192, 128, 32, 32));

            CopyRegionIntoImage(lastImage, new Rectangle(32, 64, 32, 32), ref bpp, new Rectangle(224, 128, 32, 32));
            CopyRegionIntoImage(lastImage, new Rectangle(32, 0, 16, 16), ref bpp, new Rectangle(224, 128, 16, 16));

            CopyRegionIntoImage(lastImage, new Rectangle(0, 64, 32, 32), ref bpp, new Rectangle(0, 160, 32, 32));

            CopyRegionIntoImage(lastImage, new Rectangle(0, 64, 32, 32), ref bpp, new Rectangle(32, 160, 32, 32));
            CopyRegionIntoImage(lastImage, new Rectangle(48, 0, 16, 16), ref bpp, new Rectangle(48, 160, 16, 16));

            CopyRegionIntoImage(lastImage, new Rectangle(0, 32, 16, 32), ref bpp, new Rectangle(64, 160, 16, 32));
            CopyRegionIntoImage(lastImage, new Rectangle(48, 32, 16, 32), ref bpp, new Rectangle(80, 160, 16, 32));

            CopyRegionIntoImage(lastImage, new Rectangle(0, 32, 32, 16), ref bpp, new Rectangle(96, 160, 32, 16));
            CopyRegionIntoImage(lastImage, new Rectangle(0, 80, 32, 16), ref bpp, new Rectangle(96, 176, 32, 16));

            CopyRegionIntoImage(lastImage, new Rectangle(0, 64, 16, 32), ref bpp, new Rectangle(128, 160, 16, 32));
            CopyRegionIntoImage(lastImage, new Rectangle(48, 64, 16, 32), ref bpp, new Rectangle(144, 160, 16, 32));

            CopyRegionIntoImage(lastImage, new Rectangle(32, 32, 32, 16), ref bpp, new Rectangle(160, 160, 32, 16));
            CopyRegionIntoImage(lastImage, new Rectangle(32, 80, 32, 16), ref bpp, new Rectangle(160, 176, 32, 16));

            CopyRegionIntoImage(lastImage, new Rectangle(0, 0, 32, 32), ref bpp, new Rectangle(192, 160, 32, 32));

            CopyRegionIntoImage(lastImage, new Rectangle(16, 48, 32, 32), ref bpp, new Rectangle(224, 160, 32, 32));
            #endregion     
            return bpp;
        }

        public static void CopyRegionIntoImage(Bitmap srcBitmap, Rectangle srcRegion, ref Bitmap destBitmap, Rectangle destRegion)
        {
            using (Graphics grD = Graphics.FromImage(destBitmap))
            {
                grD.DrawImage(srcBitmap, destRegion, srcRegion, GraphicsUnit.Pixel);
            }
        }

    }
}
