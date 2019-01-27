using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Data;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using DarkUI.Controls;
using DarkUI.Docking;
using Microsoft.Xna.Framework.Graphics;
using Newtonsoft.Json;
using SimplexCore;

namespace SimplexIde
{
    public partial class TilesetControl : DarkToolWindow
    {
        public Tileset currentTileset;
        public Bitmap currentTilesetBitmap;
        public int mode = 0;
        public Form1 form;
        public Rectangle selecton = Rectangle.Empty;
        public Rectangle selOutput;
        public Texture2D tilesetTexture = null;
        public int SheetX = 0;
        public int SheetY = 0;

        public TilesetControl()
        {
            InitializeComponent();
        }

        private void TilesetControl_Load(object sender, EventArgs e)
        {
           // selOutput = form.sr.drawTest1.TilesetSelectedRenRectangle;
        }

        public void LoadReady()
        {
            selOutput = form.sr.drawTest1.TilesetSelectedRenRectangle;
        }

        public void KillMe()
        {
            // Load tileset representation
            pictureBox1.Image = currentTilesetBitmap;
            
            // Fuck all entries in autotiling
            darkTreeView1.Nodes.Clear();

            // Add root entry (folder)
            DarkTreeNode dtn = new DarkTreeNode("Autotiles");
            dtn.Tag = "folder";
            dtn.Icon = Properties.Resources.Folder_16x;
            darkTreeView1.Nodes.Add(dtn);

            // Also fuck object tree in main form and deselect any objects
            form.sr.drawTest1.SelectedObject = null;
            form.w.Enabled = false;

            // [todo]
           // currentTileset.AutotileLib[0].Texture = form.drawTest1.Editor.Content.Load<Texture2D>(Path.GetFullPath("../../../SimplexRpgEngine3/Content/bin/Windows/Sprites/Tilesets/" + "tileset0"));

            // Now we can load actual autotiles
            foreach (AutotileDefinition k in currentTileset.AutotileLib)
            {
                DarkTreeNode d = new DarkTreeNode(k.Name);
                d.Tag = "";      
                
                darkTreeView1.Nodes[0].Nodes.Add(d);
            }

            pictureBox1.Show();
        }

        private void timer1_Tick(object sender, EventArgs e)
        {
            Enabled = true;
            Invalidate();
        }

        private void TilesetControl_Paint_1(object sender, PaintEventArgs e)
        {
            // Draw entire tileset
            if (mode == 0)
            {
                if (currentTilesetBitmap != null)
                {
                    e.Graphics.DrawImage(currentTilesetBitmap, new PointF(0, 50));

                }
            }
        }

        private void autotilingToolStripMenuItem_Click(object sender, EventArgs e)
        {
            darkTreeView1.Visible = true;
            pictureBox1.Visible = false;
            panel1.Visible = false;
        }

        public void tilesToolStripMenuItem_Click(object sender, EventArgs e)
        {
            darkTreeView1.Visible = false;
            pictureBox1.Visible = true;
            panel1.Visible = true;
        }

        private void darkTreeView1_Click(object sender, EventArgs e)
        {

        }

        private void darkTreeView1_SystemColorsChanged(object sender, EventArgs e)
        {

        }

        private void darkTreeView1_SelectedNodesChanged(object sender, EventArgs e)
        {
            if (darkTreeView1.SelectedNodes.Count > 0)
            {
                DarkTreeNode selected = darkTreeView1.SelectedNodes[0];

                if ((string) selected.Tag != "folder")
                {
                    // time to select autotile
                    form.sr.drawTest1.currentAutotile = currentTileset.AutotileLib.FirstOrDefault(x => x.Name == selected.Text);
                    form.sr.drawTest1.currentTileLayer = (TileLayer) form.sr.drawTest1.lastLayer;
                    form.sr.drawTest1.TilesetSelectedRenRectangle = Rectangle.Empty;
                    
                }
            }
        }

        private void pictureBox1_MouseDown(object sender, MouseEventArgs e)
        {
            // Clicked 
            if (pictureBox1.Image != null)
            {
                selecton.X = (e.X - pictureBox1.Location.X) / 32;
                selecton.Y = (e.Y - pictureBox1.Location.Y) / 32;
                selecton.Width = 1;
                selecton.Height = 1;

                int x1 = selecton.X * 32 + pictureBox1.Location.X;
                int y1 = selecton.Y * 32 + pictureBox1.Location.Y;
                int x2 = selecton.Width * 32;
                int y2 = selecton.Height * 32;

                selOutput.X = x1;
                selOutput.Y = y1;
                selOutput.Width = x2;
                selOutput.Height = y2;

                form.sr.drawTest1.TilesetSelectedRenRectangle = selOutput;
                form.sr.drawTest1.tileTexture = tilesetTexture;
                form.sr.drawTest1.currentAutotile = null;

                pictureBox1.Invalidate();
            }
        }

        private void pictureBox1_MouseMove(object sender, MouseEventArgs e)
        {
            if (selecton != Rectangle.Empty)
            {
                // update if shift is down
                if (ModifierKeys == Keys.Shift)
                {
                    selecton.Width = (e.X - selecton.Width) / 32;
                    selecton.Height = (e.Y - selecton.Height) / 32;

                    int x2 = selecton.Width * 32;
                    int y2 = selecton.Height * 32;
                    selOutput.Width = x2;
                    selOutput.Height = y2;

                    form.sr.drawTest1.TilesetSelectedRenRectangle = selOutput;

                    pictureBox1.Invalidate();
                }
            }
        }

        private void pictureBox1_MouseUp(object sender, MouseEventArgs e)
        {

        }

        private void pictureBox1_MouseClick(object sender, MouseEventArgs e)
        {

        }

        private void pictureBox1_Paint(object sender, PaintEventArgs e)
        {
            // Paint selection
            if (selecton != Rectangle.Empty)
            {
                int x1 = selecton.X * 32 + pictureBox1.Location.X;
                int y1 = selecton.Y * 32 + pictureBox1.Location.Y;
                int x2 = selecton.Width * 32;
                int y2 = selecton.Height * 32;

                e.Graphics.DrawRectangle(Pens.Black, new Rectangle(x1, y1, x2, y2));
            }
        }

        private void pictureBox1_Click(object sender, EventArgs e)
        {

        }
    }
}
