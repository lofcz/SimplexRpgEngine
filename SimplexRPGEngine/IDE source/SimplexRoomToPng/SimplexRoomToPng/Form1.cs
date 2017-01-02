using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Drawing.Imaging;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace SimplexRoomToPng
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            string path = "";

            DialogResult result = openFileDialog1.ShowDialog();
            if (result == DialogResult.OK) // Test result.
            {
                path = openFileDialog1.FileName;
            }

            string pathCore = path.Substring(0, path.LastIndexOf('\\'));
            string[] lines = File.ReadAllLines(path);

            int imagesPerRow = int.Parse(lines[0]);
            int totalImages = int.Parse(lines[1]);
            int imgSizeX = int.Parse(lines[2]);
            int imgSizeY = int.Parse(lines[3]);
            int rows = (totalImages / imagesPerRow);

            Bitmap bitmap = new Bitmap(imgSizeX, imgSizeY);
            Graphics g = Graphics.FromImage(bitmap);
            int currentImage = 1;

            int x = 0;
            int y = 0;
            int yy = 0;

            for (int i = 0; i < rows; i++)
            {
                for (int j = 0; j < imagesPerRow; j++)
                {
                    string currentPath = pathCore + "\\" + "parralax" + currentImage.ToString() + ".png";
                    Bitmap image = new Bitmap(currentPath);

                    g.DrawImage(image, x, y);
                    x += image.Width;
                    yy = image.Height;
                    currentImage++;
                }
                x = 0;
                y += yy; 
            }

            g.Save();
            bitmap.Save("file.png");
        }
    }
}
