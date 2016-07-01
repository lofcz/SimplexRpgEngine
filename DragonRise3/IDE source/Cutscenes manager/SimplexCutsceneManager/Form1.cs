using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace SimplexCutsceneManager
{
    public partial class Form1 : Form
    {
        Pen commonPen;
        Point origin = new Point(300, 500);
        List<GameObject> gameObjects;
        public static Point formPosition;

        public Form1()
        {
            InitializeComponent();
            commonPen = new Pen(Brushes.Black);
            gameObjects = new List<GameObject>();
            formPosition = new Point(this.Left, this.Top);

            GameObject testGO = new GameObject(new Point(50 + origin.Y, 0 + origin.X));
            gameObjects.Add(testGO);
        }

        private void timer1_Tick(object sender, EventArgs e)
        {
            Invalidate();
            formPosition = new Point(this.Left, this.Top);
        }

        private void Form1_Paint(object sender, PaintEventArgs e)
        {
            drawAxis(e.Graphics);
            drawGameObjects(e.Graphics);
        }

        void drawAxis(Graphics g)
        {
            g.DrawLine(commonPen, new Point(0, origin.X), new Point(this.Width, origin.X)); // X axis
            g.DrawLine(commonPen, new Point(origin.Y, 0), new Point(origin.Y, this.Height)); // Y axis
        }

        void drawGameObjects(Graphics g)
        {
            foreach(GameObject go in gameObjects)
            {
                go.drawSelf(g, commonPen);
            }
        }

        private void Form1_Click(object sender, EventArgs e)
        {
            bool canSelect = true;
            Point normalisedMouse = new Point(Cursor.Position.X - this.Left - origin.Y - 7, Cursor.Position.Y - this.Top - origin.X - 32);

            foreach (GameObject go in gameObjects)
            {
                if (go.clickedOn())
                {
                    if (canSelect)
                    {
                        go.selected = !go.selected;
                        canSelect = false;
                        MessageBox.Show("Kliknuto na objekt");
                    }
                }
                else if (!canSelect)
                {
                    go.selected = false;
                }
            }

            MessageBox.Show("X: " + Convert.ToString(normalisedMouse.X) + "\nY: " + Convert.ToString(normalisedMouse.Y));
        }
    }
}
