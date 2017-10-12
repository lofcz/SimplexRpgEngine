using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Drawing.Imaging;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace WindowsFormsApp1
{
    public partial class Form1 : Form
    {
        Bitmap sourceImage = null;
        Bitmap actualImage = null;
        Bitmap convertedImage = null;

        string sourcePath = "";
        bool clicked = false;

        public Form1()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            DialogResult d = openFileDialog1.ShowDialog();

            if (d == DialogResult.OK)
            {
                sourcePath = openFileDialog1.FileName;
                Render();
            }


        }

        void Render()
        {
            sourceImage = new Bitmap(Image.FromFile(sourcePath));

        }

        private void Form1_Load(object sender, EventArgs e)
        {

        }

        private void Form1_Paint(object sender, PaintEventArgs e)
        {
            if (sourceImage != null)
            {
                e.Graphics.DrawImage(sourceImage, new Point(0, 0));
                Point p = PointToClient(Cursor.Position);

                for (var i = 0; i < sourceImage.Height; i += 96)
                {
                    for (var j = 0; j < sourceImage.Width; j += 64)
                    {
                        e.Graphics.DrawRectangle(Pens.Black, new Rectangle(j, i, 64, 96));

                        if (p.X > j && p.X < j + 64 && p.Y > i && p.Y < i + 96)
                        {
                            SolidBrush b = new SolidBrush(Color.FromArgb(64, Color.Black));
                            e.Graphics.FillRectangle(b, new Rectangle(j, i, 64, 96));

                            if (clicked)
                            {
                                actualImage = sourceImage.Clone(new Rectangle(j, i, 64, 96), sourceImage.PixelFormat);
                            }
                        }
                    }
                }

                if (actualImage != null)
                {
                    e.Graphics.DrawImage(actualImage, new Point(sourceImage.Width + 32, 0));

                    convertedImage = new Bitmap(256, 192);

                    #region Algorithm logic

                    CopyRegionIntoImage(actualImage, new Rectangle(16, 48, 32, 32), ref convertedImage, new Rectangle(0, 0, 32, 32));

                    CopyRegionIntoImage(actualImage, new Rectangle(16, 48, 32, 32), ref convertedImage, new Rectangle(32, 0, 32, 32));
                    CopyRegionIntoImage(actualImage, new Rectangle(32, 0, 16, 16), ref convertedImage, new Rectangle(32, 0, 16, 16));

                    CopyRegionIntoImage(actualImage, new Rectangle(16, 48, 32, 32), ref convertedImage, new Rectangle(64, 0, 32, 32));
                    CopyRegionIntoImage(actualImage, new Rectangle(48, 0, 16, 16), ref convertedImage, new Rectangle(80, 0, 16, 16));

                    CopyRegionIntoImage(actualImage, new Rectangle(16, 48, 32, 32), ref convertedImage, new Rectangle(96, 0, 32, 32));
                    CopyRegionIntoImage(actualImage, new Rectangle(32, 0, 16, 16), ref convertedImage, new Rectangle(96, 0, 16, 16));
                    CopyRegionIntoImage(actualImage, new Rectangle(48, 0, 16, 16), ref convertedImage, new Rectangle(112, 0, 16, 16));

                    CopyRegionIntoImage(actualImage, new Rectangle(16, 48, 32, 32), ref convertedImage, new Rectangle(128, 0, 32, 32));
                    CopyRegionIntoImage(actualImage, new Rectangle(48, 16, 16, 16), ref convertedImage, new Rectangle(144, 16, 16, 16));

                    CopyRegionIntoImage(actualImage, new Rectangle(16, 48, 32, 32), ref convertedImage, new Rectangle(160, 0, 32, 32));
                    CopyRegionIntoImage(actualImage, new Rectangle(48, 16, 16, 16), ref convertedImage, new Rectangle(176, 16, 16, 16));
                    CopyRegionIntoImage(actualImage, new Rectangle(32, 0, 16, 16), ref convertedImage, new Rectangle(160, 0, 16, 16));

                    CopyRegionIntoImage(actualImage, new Rectangle(16, 48, 32, 32), ref convertedImage, new Rectangle(192, 0, 32, 32));
                    CopyRegionIntoImage(actualImage, new Rectangle(48, 0, 16, 16), ref convertedImage, new Rectangle(208, 0, 16, 16));
                    CopyRegionIntoImage(actualImage, new Rectangle(48, 16, 16, 16), ref convertedImage, new Rectangle(208, 16, 16, 16));

                    CopyRegionIntoImage(actualImage, new Rectangle(16, 48, 32, 32), ref convertedImage, new Rectangle(224, 0, 32, 32));
                    CopyRegionIntoImage(actualImage, new Rectangle(48, 0, 16, 16), ref convertedImage, new Rectangle(240, 0, 16, 16));
                    CopyRegionIntoImage(actualImage, new Rectangle(48, 16, 16, 16), ref convertedImage, new Rectangle(240, 16, 16, 16));
                    CopyRegionIntoImage(actualImage, new Rectangle(32, 0, 16, 16), ref convertedImage, new Rectangle(224, 0, 16, 16));

                    CopyRegionIntoImage(actualImage, new Rectangle(16, 48, 32, 32), ref convertedImage, new Rectangle(0, 32, 32, 32));
                    CopyRegionIntoImage(actualImage, new Rectangle(32, 16, 16, 16), ref convertedImage, new Rectangle(0, 48, 16, 16));

                    CopyRegionIntoImage(actualImage, new Rectangle(16, 48, 32, 32), ref convertedImage, new Rectangle(32, 32, 32, 32));
                    CopyRegionIntoImage(actualImage, new Rectangle(32, 0, 16, 32), ref convertedImage, new Rectangle(32, 32, 16, 32));

                    CopyRegionIntoImage(actualImage, new Rectangle(16, 48, 32, 32), ref convertedImage, new Rectangle(64, 32, 32, 32));
                    CopyRegionIntoImage(actualImage, new Rectangle(48, 0, 16, 16), ref convertedImage, new Rectangle(80, 32, 16, 16));
                    CopyRegionIntoImage(actualImage, new Rectangle(32, 16, 16, 16), ref convertedImage, new Rectangle(64, 48, 16, 16));

                    CopyRegionIntoImage(actualImage, new Rectangle(16, 48, 32, 32), ref convertedImage, new Rectangle(96, 32, 32, 32));
                    CopyRegionIntoImage(actualImage, new Rectangle(48, 0, 16, 16), ref convertedImage, new Rectangle(112, 32, 16, 16));
                    CopyRegionIntoImage(actualImage, new Rectangle(32, 16, 16, 16), ref convertedImage, new Rectangle(96, 48, 16, 16));
                    CopyRegionIntoImage(actualImage, new Rectangle(32, 0, 16, 16), ref convertedImage, new Rectangle(96, 32, 16, 16));

                    CopyRegionIntoImage(actualImage, new Rectangle(16, 48, 32, 32), ref convertedImage, new Rectangle(128, 32, 32, 32));
                    CopyRegionIntoImage(actualImage, new Rectangle(32, 16, 32, 16), ref convertedImage, new Rectangle(128, 48, 32, 16));

                    CopyRegionIntoImage(actualImage, new Rectangle(16, 48, 32, 32), ref convertedImage, new Rectangle(160, 32, 32, 32));
                    CopyRegionIntoImage(actualImage, new Rectangle(32, 16, 32, 16), ref convertedImage, new Rectangle(160, 48, 32, 16));
                    CopyRegionIntoImage(actualImage, new Rectangle(32, 0, 16, 16), ref convertedImage, new Rectangle(160, 32, 16, 16));

                    CopyRegionIntoImage(actualImage, new Rectangle(16, 48, 32, 32), ref convertedImage, new Rectangle(192, 32, 32, 32));
                    CopyRegionIntoImage(actualImage, new Rectangle(32, 16, 32, 16), ref convertedImage, new Rectangle(192, 48, 32, 16));
                    CopyRegionIntoImage(actualImage, new Rectangle(48, 0, 16, 16), ref convertedImage, new Rectangle(208, 32, 16, 16));

                    CopyRegionIntoImage(actualImage, new Rectangle(32, 0, 32, 32), ref convertedImage, new Rectangle(224, 32, 32, 32));

                    CopyRegionIntoImage(actualImage, new Rectangle(0, 48, 32, 32), ref convertedImage, new Rectangle(0, 64, 32, 32));

                    CopyRegionIntoImage(actualImage, new Rectangle(0, 48, 32, 32), ref convertedImage, new Rectangle(32, 64, 32, 32));
                    CopyRegionIntoImage(actualImage, new Rectangle(48, 0, 16, 16), ref convertedImage, new Rectangle(48, 64, 16, 16));

                    CopyRegionIntoImage(actualImage, new Rectangle(0, 48, 32, 32), ref convertedImage, new Rectangle(64, 64, 32, 32));
                    CopyRegionIntoImage(actualImage, new Rectangle(48, 16, 16, 16), ref convertedImage, new Rectangle(80, 80, 16, 16));

                    CopyRegionIntoImage(actualImage, new Rectangle(0, 48, 32, 32), ref convertedImage, new Rectangle(96, 64, 32, 32));
                    CopyRegionIntoImage(actualImage, new Rectangle(48, 16, 16, 16), ref convertedImage, new Rectangle(112, 80, 16, 16));
                    CopyRegionIntoImage(actualImage, new Rectangle(48, 0, 16, 16), ref convertedImage, new Rectangle(112, 64, 16, 16));

                    CopyRegionIntoImage(actualImage, new Rectangle(16, 32, 32, 32), ref convertedImage, new Rectangle(128, 64, 32, 32));

                    CopyRegionIntoImage(actualImage, new Rectangle(16, 32, 32, 32), ref convertedImage, new Rectangle(160, 64, 32, 32));
                    CopyRegionIntoImage(actualImage, new Rectangle(48, 16, 16, 16), ref convertedImage, new Rectangle(176, 80, 16, 16));

                    CopyRegionIntoImage(actualImage, new Rectangle(16, 32, 32, 32), ref convertedImage, new Rectangle(192, 64, 32, 32));
                    CopyRegionIntoImage(actualImage, new Rectangle(32, 16, 16, 16), ref convertedImage, new Rectangle(192, 80, 16, 16));

                    CopyRegionIntoImage(actualImage, new Rectangle(16, 32, 32, 32), ref convertedImage, new Rectangle(224, 64, 32, 32));
                    CopyRegionIntoImage(actualImage, new Rectangle(48, 16, 16, 16), ref convertedImage, new Rectangle(240, 80, 16, 16));
                    CopyRegionIntoImage(actualImage, new Rectangle(32, 16, 16, 16), ref convertedImage, new Rectangle(224, 80, 16, 16));

                    CopyRegionIntoImage(actualImage, new Rectangle(32, 48, 32, 32), ref convertedImage, new Rectangle(0, 96, 32, 32));

                    CopyRegionIntoImage(actualImage, new Rectangle(32, 48, 32, 32), ref convertedImage, new Rectangle(32, 96, 32, 32));
                    CopyRegionIntoImage(actualImage, new Rectangle(32, 16, 16, 16), ref convertedImage, new Rectangle(32, 112, 16, 16));

                    CopyRegionIntoImage(actualImage, new Rectangle(32, 48, 32, 32), ref convertedImage, new Rectangle(64, 96, 32, 32));
                    CopyRegionIntoImage(actualImage, new Rectangle(32, 0, 16, 16), ref convertedImage, new Rectangle(64, 96, 16, 16));

                    CopyRegionIntoImage(actualImage, new Rectangle(32, 48, 32, 32), ref convertedImage, new Rectangle(96, 96, 32, 32));
                    CopyRegionIntoImage(actualImage, new Rectangle(32, 16, 16, 16), ref convertedImage, new Rectangle(96, 112, 16, 16));
                    CopyRegionIntoImage(actualImage, new Rectangle(32, 0, 16, 16), ref convertedImage, new Rectangle(96, 96, 16, 16));

                    CopyRegionIntoImage(actualImage, new Rectangle(16, 64, 32, 32), ref convertedImage, new Rectangle(128, 96, 32, 32));

                    CopyRegionIntoImage(actualImage, new Rectangle(16, 64, 32, 32), ref convertedImage, new Rectangle(160, 96, 32, 32));
                    CopyRegionIntoImage(actualImage, new Rectangle(32, 0, 16, 16), ref convertedImage, new Rectangle(160, 96, 16, 16));

                    CopyRegionIntoImage(actualImage, new Rectangle(16, 64, 32, 32), ref convertedImage, new Rectangle(192, 96, 32, 32));
                    CopyRegionIntoImage(actualImage, new Rectangle(48, 0, 16, 16), ref convertedImage, new Rectangle(208, 96, 16, 16));

                    CopyRegionIntoImage(actualImage, new Rectangle(16, 64, 32, 32), ref convertedImage, new Rectangle(224, 96, 32, 32));
                    CopyRegionIntoImage(actualImage, new Rectangle(32, 0, 16, 16), ref convertedImage, new Rectangle(224, 96, 16, 16));
                    CopyRegionIntoImage(actualImage, new Rectangle(48, 0, 16, 16), ref convertedImage, new Rectangle(240, 96, 16, 16));

                    CopyRegionIntoImage(actualImage, new Rectangle(0, 48, 16, 32), ref convertedImage, new Rectangle(0, 128, 16, 32));

                    CopyRegionIntoImage(actualImage, new Rectangle(48, 48, 16, 32), ref convertedImage, new Rectangle(16, 128, 16, 32));

                    CopyRegionIntoImage(actualImage, new Rectangle(16, 32, 32, 16), ref convertedImage, new Rectangle(32, 128, 32, 16));

                    CopyRegionIntoImage(actualImage, new Rectangle(16, 80, 32, 16), ref convertedImage, new Rectangle(32, 144, 32, 16));

                    CopyRegionIntoImage(actualImage, new Rectangle(0, 32, 32, 32), ref convertedImage, new Rectangle(64, 128, 32, 32));

                    CopyRegionIntoImage(actualImage, new Rectangle(0, 32, 32, 32), ref convertedImage, new Rectangle(96, 128, 32, 32));
                    CopyRegionIntoImage(actualImage, new Rectangle(48, 16, 16, 16), ref convertedImage, new Rectangle(96 + 16, 128 + 16, 16, 16));

                    CopyRegionIntoImage(actualImage, new Rectangle(32, 32, 32, 32), ref convertedImage, new Rectangle(128, 128, 32, 32));

                    CopyRegionIntoImage(actualImage, new Rectangle(32, 32, 32, 32), ref convertedImage, new Rectangle(160, 128, 32, 32));
                    CopyRegionIntoImage(actualImage, new Rectangle(32, 16, 16, 16), ref convertedImage, new Rectangle(160, 128 + 16, 16, 16));

                    CopyRegionIntoImage(actualImage, new Rectangle(32, 64, 32, 32), ref convertedImage, new Rectangle(192, 128, 32, 32));

                    CopyRegionIntoImage(actualImage, new Rectangle(32, 64, 32, 32), ref convertedImage, new Rectangle(224, 128, 32, 32));
                    CopyRegionIntoImage(actualImage, new Rectangle(32, 0, 16, 16), ref convertedImage, new Rectangle(224, 128, 16, 16));

                    CopyRegionIntoImage(actualImage, new Rectangle(0, 64, 32, 32), ref convertedImage, new Rectangle(0, 160, 32, 32));

                    CopyRegionIntoImage(actualImage, new Rectangle(0, 64, 32, 32), ref convertedImage, new Rectangle(32, 160, 32, 32));
                    CopyRegionIntoImage(actualImage, new Rectangle(48, 0, 16, 16), ref convertedImage, new Rectangle(48, 160, 16, 16));

                    CopyRegionIntoImage(actualImage, new Rectangle(0, 32, 16, 32), ref convertedImage, new Rectangle(64, 160, 16, 32));
                    CopyRegionIntoImage(actualImage, new Rectangle(48, 32, 16, 32), ref convertedImage, new Rectangle(80, 160, 16, 32));

                    CopyRegionIntoImage(actualImage, new Rectangle(0, 32, 32, 16), ref convertedImage, new Rectangle(96, 160, 32, 16));
                    CopyRegionIntoImage(actualImage, new Rectangle(0, 80, 32, 16), ref convertedImage, new Rectangle(96, 176, 32, 16));

                    CopyRegionIntoImage(actualImage, new Rectangle(0, 64, 16, 32), ref convertedImage, new Rectangle(128, 160, 16, 32));
                    CopyRegionIntoImage(actualImage, new Rectangle(48, 64, 16, 32), ref convertedImage, new Rectangle(144, 160, 16, 32));

                    CopyRegionIntoImage(actualImage, new Rectangle(32, 32, 32, 16), ref convertedImage, new Rectangle(160, 160, 32, 16));
                    CopyRegionIntoImage(actualImage, new Rectangle(32, 80, 32, 16), ref convertedImage, new Rectangle(160, 176, 32, 16));

                    CopyRegionIntoImage(actualImage, new Rectangle(0, 0, 32, 32), ref convertedImage, new Rectangle(192, 160, 32, 32));

                    CopyRegionIntoImage(actualImage, new Rectangle(16, 48, 32, 32), ref convertedImage, new Rectangle(224, 160, 32, 32));

                    for (var i = 0; i < 192; i += 32)
                    {
                        for (var j = 0; j < 256; j += 32)
                        {
                            //e.Graphics.DrawRectangle(Pens.Black, new Rectangle(j + sourceImage.Width + 32 + actualImage.Width + 32, i, 32, 32));
                        }
                    }

                    if (clicked)
                    {
                        if (p.X > sourceImage.Width + 32 + actualImage.Width + 32 && p.X < sourceImage.Width + 32 + actualImage.Width + 32 + 256 && p.Y > 0 && p.Y < 192)
                        {
                            clicked = false;

                            saveFileDialog1.Filter = "Png Image|*.png";
                            DialogResult d = saveFileDialog1.ShowDialog();

                            if (d == DialogResult.OK)
                            {
                                convertedImage.Save(saveFileDialog1.FileName, ImageFormat.Png);
                            }
                        }
                    }
                    #endregion

                    e.Graphics.DrawImage(convertedImage, new Point(sourceImage.Width + 32 + actualImage.Width + 32));
                }
            }

            clicked = false;
        }
        

        private void timer1_Tick(object sender, EventArgs e)
        {
            Invalidate();
        }

        private void Form1_MouseClick(object sender, MouseEventArgs e)
        {
            clicked = true;
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
