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
using Microsoft.Xna.Framework.Input;
using SimplexCore;
using MessageBox = System.Windows.Forms.MessageBox;

namespace SimplexIde
{
    public partial class LayerTool : DarkToolWindow
    {
        public DarkTreeView dtv = null;
        public DarkTreeNode selectedNode = null;
        public DrawTest f = null;
        public Form1 form;
        public DarkTreeNode lastNodeSelected = null;

        public LayerTool(DrawTest f)
        {
            InitializeComponent();

            dtv = darkTreeView1;

            DarkTreeNode dtn = new DarkTreeNode("Layers");
            dtn.Icon = (Bitmap)Properties.Resources.ResourceManager.GetObject("Folder_16x");
            dtn.Tag = "folder";
            darkTreeView1.Nodes.Add(dtn);
            f.lt = this;
            this.f = f;
        }

        private void LayerTool_Load(object sender, EventArgs e)
        {

        }

        private void darkTreeView1_Click(object sender, EventArgs e)
        {

        }

        private void darkTreeView1_SelectedNodesChanged(object sender, EventArgs e)
        {
            if (darkTreeView1.SelectedNodes.Count > 0)
            {
                DarkTreeNode dtn = darkTreeView1.SelectedNodes[0];
                if (dtn.Tag != null && (string)dtn?.Tag != "folder" && dtn != lastNodeSelected)
                {
                        f.selectedLayer = f.currentRoom.Layers.FirstOrDefault(x => x.Name == dtn.Text);

                        // Activate / deactive tile tool now

                        RoomLayer l = f.selectedLayer;

                        if (l.LayerType == RoomLayer.LayerTypes.typeTile)
                        {
                            // hide object panel to free up space

                            if (form.w.Visible)
                            {
                                form.w.Hide();
                                form.drawTest1.Location = new Point(form.drawTest1.Location.X - form.w.Size.Width, form.drawTest1.Location.Y);
                                form.darkDockPanel3.Location = new Point(form.darkDockPanel3.Location.X - form.w.Size.Width, form.darkDockPanel3.Location.Y);
                                form.darkDockPanel4.Location = new Point(form.darkDockPanel4.Location.X - form.w.Size.Width, form.darkDockPanel4.Location.Y);
                                form.darkDockPanel3.Size = new Size(form.darkDockPanel3.Size.Width + form.w.Size.Width, form.darkDockPanel3.Size.Height);
                                form.darkDockPanel4.Size = new Size(form.darkDockPanel4.Size.Width + form.w.Size.Width, form.darkDockPanel4.Size.Height);
                                form.darkStatusStrip1.Location = new Point(form.darkStatusStrip1.Location.X - form.w.Size.Width, form.darkStatusStrip1.Location.Y);
                                form.darkStatusStrip1.Size = new Size(form.darkStatusStrip1.Size.Width + form.w.Size.Width, form.darkStatusStrip1.Size.Height);
                        }

                            // give him a tileset
                            form.ww.currentTileset = ((TileLayer) l).Tileset;
                            Bitmap bmp = new Bitmap(Path.GetFullPath(
                                "../../../SimplexRpgEngine3/Content/Sprites/Tilesets/" + ((TileLayer) l).Tileset.Name +
                                ".png"));

                             Texture2D tex = form.drawTest1.Editor.Content.Load<Texture2D>(Path.GetFullPath("../../../SimplexRpgEngine3/Content/bin/Windows/Sprites/Tilesets/" + ((TileLayer)l).Tileset.Name));


                            // we have our bitmap now we pass it
                            Sgml.show_debug_message("kokot");
                            form.ww.currentTilesetBitmap = bmp;
                            form.ww.tilesetTexture = tex;
                            form.ww.currentTileset = ((TileLayer) l).Tileset;
                            form.ww.KillMe();

                            form.drawTest1.lastLayer = l;
                            form.drawTest1.currentTileLayer = (TileLayer)l;
                        }

                        if (l.LayerType == RoomLayer.LayerTypes.typeObject)
                        {
                            form.ww.currentTileset = null;
                            form.w.Enabled = true;
                            form.drawTest1.currentAutotile = null;

                            if (!form.w.Visible)
                            {
                                form.drawTest1.Location = new Point(form.drawTest1.Location.X + form.w.Size.Width, form.drawTest1.Location.Y);
                                form.darkDockPanel3.Location = new Point(form.darkDockPanel3.Location.X + form.w.Size.Width, form.darkDockPanel3.Location.Y);
                                form.darkDockPanel4.Location = new Point(form.darkDockPanel4.Location.X + form.w.Size.Width, form.darkDockPanel4.Location.Y);
                                form.darkDockPanel3.Size = new Size(form.darkDockPanel3.Size.Width - form.w.Size.Width, form.darkDockPanel3.Size.Height);
                                form.darkDockPanel4.Size = new Size(form.darkDockPanel4.Size.Width - form.w.Size.Width, form.darkDockPanel4.Size.Height);
                                form.darkStatusStrip1.Location = new Point(form.darkStatusStrip1.Location.X + form.w.Size.Width, form.darkStatusStrip1.Location.Y);
                                form.darkStatusStrip1.Size = new Size(form.darkStatusStrip1.Size.Width - form.w.Size.Width, form.darkStatusStrip1.Size.Height);
                        }

                        form.w.Show();
                        }
                    }

                lastNodeSelected = dtn;
            }
        }

        void realSelected(MouseEventArgs e)
        {
            if (darkTreeView1.SelectedNodes.Count > 0 && e.Button == MouseButtons.Right)
            {
                DarkTreeNode dtn = darkTreeView1.SelectedNodes[0];

                if (dtn.Tag != null && (string)dtn?.Tag != "folder")
                {
                    darkContextMenu1.Show(Cursor.Position);
                    selectedNode = dtn;
                }
            }
        }

        private void darkContextMenu1_Closed(object sender, ToolStripDropDownClosedEventArgs e)
        {
            darkTreeView1.SelectedNodes.Clear();
        }

        private void darkTreeView1_MouseClick(object sender, MouseEventArgs e)
        {
            realSelected(e);
        }

        private void darkContextMenu1_Opening(object sender, CancelEventArgs e)
        {

        }

        private void toggleToolStripMenuItem_Click(object sender, EventArgs e)
        {
            // toggle layer visibility
            // if (f.roomLayers.Count > 0)
            // MessageBox.Show(f.roomLayers.Count.ToString());
            {
                RoomLayer rl = f.roomLayers.FirstOrDefault(x => x.Name == selectedNode.Text);
                rl.Visible = !rl.Visible;

                if (!rl.Visible)
                {
                    selectedNode.Icon = Properties.Resources.Visible_16xSM;
                }
                else
                {
                    if (rl.LayerType == RoomLayer.LayerTypes.typeObject)
                    {
                        selectedNode.Icon =
                            (System.Drawing.Bitmap)Properties.Resources.ResourceManager.GetObject("WorldLocal_16x");
                    }
                    else if (rl.LayerType == RoomLayer.LayerTypes.typeAsset)
                    {
                        selectedNode.Icon =
                            (System.Drawing.Bitmap)Properties.Resources.ResourceManager.GetObject("Image_16x");
                    }
                    else if (rl.LayerType == RoomLayer.LayerTypes.typeParticle)
                    {
                        selectedNode.Icon =
                            (System.Drawing.Bitmap)Properties.Resources.ResourceManager.GetObject("ParticleLayer");
                    }
                    else
                    {
                        selectedNode.Icon =
                            (System.Drawing.Bitmap)Properties.Resources.ResourceManager.GetObject("MapLineLayer_16x");
                    }
                }

                dtv.Invalidate();
            }
        }
    }
}
