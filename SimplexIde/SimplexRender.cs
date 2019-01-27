using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using DarkUI.Docking;
using Microsoft.Xna.Framework;

namespace SimplexIde
{
    public partial class SimplexRender : DarkToolWindow
    {
        public SimplexRender()
        {
            InitializeComponent();
        }

        private void SimplexRender_Load(object sender, EventArgs e)
        {
            drawTest1.Rsize();


        }

        private void DrawTest1_MouseClick(object sender, MouseEventArgs e)
        {
            drawTest1.GameClicked(e, e.Button);
        }

        private void DrawTest1_MouseDown(object sender, MouseEventArgs e)
        {
            drawTest1.ClickLock(e.Button);
        }

        private void DrawTest1_MouseMove(object sender, MouseEventArgs e)
        {
            drawTest1.PreCheckMouse(e);

            drawTest1.MousePosition = new Vector2(e.X, e.Y);

            if (e.Button == MouseButtons.Left)
            {
                drawTest1.GameClicked(e, MouseButtons.Left);
            }
            else if (e.Button == MouseButtons.Right)
            {
                drawTest1.GameClicked(e, MouseButtons.Right);
            }
            else if (e.Button == MouseButtons.Middle)
            {
                drawTest1.MoveView();
            }
        }

        private void DrawTest1_MouseUp(object sender, MouseEventArgs e)
        {
            drawTest1.ClickRelease(e.Button);
        }

        private void DrawTest1_OnMouseWheelDownwards(MouseEventArgs e)
        {
            drawTest1.WheelDown();
        }

        private void DrawTest1_OnMouseWheelUpwards(MouseEventArgs e)
        {
            drawTest1.WheelUp();
        }

        private void DrawTest1_Click(object sender, EventArgs e)
        {
           
        }
    }
}
