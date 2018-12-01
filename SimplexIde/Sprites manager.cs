using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using DarkUI.Controls;
using DarkUI.Forms;
using Microsoft.Xna.Framework.Graphics;
using Newtonsoft.Json;
using SimplexCore;
using Color = System.Drawing.Color;

namespace SimplexIde
{
    public partial class Sprites_manager : DarkForm
    {
        public Form1 owner;
        public DarkTreeNode selectedNode = null;
        public Bitmap lastImage = null;
        public int cellW = 0;
        public int cellH = 0;
        public int rows = 0;
        public List<string> okEntries = new List<string>();
        public List<string> badEntries = new List<string>();
        Pen p = new Pen(Color.White);
        public Sprites_manager()
        {
            InitializeComponent();
        }

        private void Sprites_manager_Load(object sender, EventArgs e)
        {
            // first we load descriptor for all sprites
           // Sprites = JsonConvert.DeserializeObject<List<Spritesheet>>(new StreamReader("../../../SimplexRpgEngine3/SpritesDescriptor.json").ReadToEnd());

            string[] extensions = { ".png", ".jpg", ".jpeg", ".gif" };
            foreach (string file in Directory.EnumerateFiles("../../../SimplexRpgEngine3/Content/bin/Windows/Sprites/", "*.xnb*"))
            {
                string name = Path.GetFileNameWithoutExtension(file);

                if (owner.drawTest1.Sprites.FindIndex(x => x.Name == name) != -1)
                {
                    okEntries.Add(name);
                }
                else
                {
                    badEntries.Add(name);
                }
            }

            DarkTreeNode dtn = new DarkTreeNode("Sprites");
            dtn.Icon = (Bitmap) Properties.Resources.Folder_16x;
            dtn.Tag = "folder";
            darkTreeView1.Nodes.Add(dtn);

            var newList = okEntries.Concat(badEntries);
            foreach (string s in newList)
            {               
                DarkTreeNode d = new DarkTreeNode(s);
                d.Tag = "item";
                d.Icon = (Bitmap)Properties.Resources.EditCommandColumn_ActionGray_16x_32;

                if (okEntries.FindIndex(x => x == d.Text) != -1)
                {
                    d.Icon = (Bitmap) Properties.Resources.Checkmark_16x;
                }
                darkTreeView1.Nodes[0].Nodes.Add(d);
            }

            darkTreeView1.Nodes[0].Expanded = true;
        }

        private void darkTreeView1_Click(object sender, EventArgs e)
        {
            
        }

        private void darkTreeView1_SelectedNodesChanged(object sender, EventArgs e)
        {
            if (darkTreeView1.SelectedNodes.Count > 0)
            {
                selectedNode = darkTreeView1.SelectedNodes[0];

                if ((string)selectedNode.Tag != "folder")
                {
                    MemoryStream memoryStream = new MemoryStream();

                    try
                    {
                        // for known textures
                        Spritesheet s = owner.drawTest1.Sprites.FirstOrDefault(x => x.Name == selectedNode.Text);
                        s.Texture.SaveAsPng(memoryStream, s.Texture.Width, s.Texture.Height);

                        darkNumericUpDown3.Value = s.Rows;
                        darkNumericUpDown1.Value = s.CellWidth;
                        darkNumericUpDown2.Value = s.CellHeight;
                    }
                    catch (Exception ee)
                    {
                        // we need to load otherwise
                        Texture2D tex = owner.drawTest1.Editor.Content.Load<Texture2D>(Path.GetFullPath("../../../SimplexRpgEngine3/Content/bin/Windows/Sprites/" + selectedNode.Text));
                        tex.SaveAsPng(memoryStream, tex.Width, tex.Height);
                    }


                    lastImage = new Bitmap(memoryStream);
                }
            }
        }

        private void darkSectionPanel2_Paint(object sender, PaintEventArgs e)
        {
        }

        private void timer1_Tick(object sender, EventArgs e)
        {
            this.Enabled = true;
            
            Invalidate();
        }

        private void Sprites_manager_Paint(object sender, PaintEventArgs e)
        {
            if (lastImage != null)
            {
                rows = (int)darkNumericUpDown3.Value;
                cellW = (int)darkNumericUpDown1.Value;
                cellH = (int)darkNumericUpDown2.Value;

                e.Graphics.DrawImage(lastImage, new System.Drawing.Point(darkSectionPanel1.Location.X + darkSectionPanel1.Width + 20, darkSectionPanel1.Location.Y));

                int cx, cy;
                cx = darkSectionPanel1.Location.X + darkSectionPanel1.Width + 20;
                cy = darkSectionPanel1.Location.Y;

                if (rows > 0 && cellH > 0 && cellW > 0)
                {
                    for (var i = 0; i < rows; i++)
                    {
                        for (var j = 0; j < lastImage.Width / cellW; j++)
                        {
                            e.Graphics.DrawRectangle(p, new Rectangle(cx, cy, cellW, cellH));
                            cx += cellW;
                        }

                        cy += cellH;
                        cx = darkSectionPanel1.Location.X + darkSectionPanel1.Width + 20;
                    }
                }
            }
        }

        private void darkButton1_Click(object sender, EventArgs e)
        {
            // save descriptor
            StreamReader sw = new StreamReader("../../../SimplexRpgEngine3/SpritesDescriptor.json");
            List<Spritesheet> current = JsonConvert.DeserializeObject<List<Spritesheet>>(sw.ReadToEnd());
            sw.Close();

            Spritesheet overwrite = current.FirstOrDefault(x => x.Name == selectedNode.Text);

            if (overwrite != null)
            {
                overwrite.CellHeight = cellH;
                overwrite.CellWidth = cellW;
                overwrite.Rows = rows;
            }
            else
            {
                Spritesheet s = new Spritesheet();
                s.Name = selectedNode.Text;
                s.CellHeight = cellH;
                s.CellWidth = cellW;
                s.Rows = rows;

                okEntries.Add(s.Name);
                badEntries.Remove(s.Name);

                selectedNode.Icon = (Bitmap)Properties.Resources.Checkmark_16x;
                darkTreeView1.Invalidate();

                current.Add(s);
            }

            string json = JsonConvert.SerializeObject(current);

            using (StreamWriter writer = new StreamWriter("../../../SimplexRpgEngine3/SpritesDescriptor.json"))
            {
                writer.WriteLine(json);
                writer.Close();
            }

        }
    }
}
