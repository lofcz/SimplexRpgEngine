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
using SimplexCore;

namespace SimplexIde
{
    public partial class TilesetControl : DarkToolWindow
    {
        public Tileset currentTileset;
        public Bitmap currentTilesetBitmap;
        public int mode = 0;
        public Form1 form;

        public TilesetControl()
        {
            InitializeComponent();
        }

        private void TilesetControl_Load(object sender, EventArgs e)
        {
           
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
            form.drawTest1.SelectedObject = null;
            form.w.Enabled = false;

            // [todo]
            currentTileset.AutotileLib[0].Texture = form.drawTest1.Editor.Content.Load<Texture2D>(Path.GetFullPath("../../../SimplexRpgEngine3/Content/bin/Windows/Sprites/Tilesets/" + "tileset0"));

            // Now we can load actual autotiles
            foreach (AutotileDefinition k in currentTileset.AutotileLib)
            {
                DarkTreeNode d = new DarkTreeNode(k.Name);
                d.Tag = "";      
                
                darkTreeView1.Nodes[0].Nodes.Add(d);
            }
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
        }

        private void tilesToolStripMenuItem_Click(object sender, EventArgs e)
        {
            darkTreeView1.Visible = false;
            pictureBox1.Visible = true;
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
                    form.drawTest1.currentAutotile = currentTileset.AutotileLib.FirstOrDefault(x => x.Name == selected.Text);
                    form.drawTest1.currentTileLayer = (TileLayer) form.drawTest1.lastLayer;
                }
            }
        }
    }
}
