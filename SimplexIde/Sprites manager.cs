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
using DarkUI.Controls;
using DarkUI.Forms;
using Microsoft.Xna.Framework;
using Microsoft.Xna.Framework.Graphics;
using Newtonsoft.Json;
using SimplexCore;
using Color = System.Drawing.Color;
using Rectangle = System.Drawing.Rectangle;
using static SimplexCore.Sgml;

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
        SolidBrush b = new SolidBrush(Color.FromArgb(64, Color.White));
        public double zoom = 1;
        int _totalDelta = 0;
        Vector2 mouse = Vector2.Zero;
        List<Subsprite> subsprites = new List<Subsprite>();
        private Subsprite selectedSub = null;

        public Sprites_manager()
        {
            InitializeComponent();
            this.MouseWheel += Form_MouseWheel;
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

                e.Graphics.DrawImage(lastImage, new RectangleF(darkSectionPanel1.Location.X + darkSectionPanel1.Width + 20, darkSectionPanel1.Location.Y, lastImage.Width * (float)zoom, lastImage.Height * (float)zoom));

                int cx, cy;
                cx = darkSectionPanel1.Location.X + darkSectionPanel1.Width + 20;
                cy = darkSectionPanel1.Location.Y;

                int xIndex = 0;
                int yIndex = 0;
                if (rows > 0 && cellH > 0 && cellW > 0)
                {
                    for (var i = 0; i < rows; i++)
                    {
                        for (var j = 0; j < lastImage.Width / cellW; j++)
                        {
                            bool hit = false;

                            Rectangle r = new Rectangle((int)(cx * 1), (int)(cy * 1), (int)(cellW * zoom), (int)(cellH * zoom));

                            if (r.Contains(new System.Drawing.Point((int)mouse.X, (int)mouse.Y)))
                            {
                                hit = true;
                            }
                            
                            if (hit)
                            {
                                e.Graphics.FillRectangle(b, r);
                            }

                            e.Graphics.DrawRectangle(p, r);
                            cx += (int) (cellW * zoom);
                            xIndex++;
                        }

                        cy += (int)Math.Round(cellH * zoom);
                        yIndex++;
                        xIndex = 0;
                        cx = darkSectionPanel1.Location.X + darkSectionPanel1.Width + 20;
                    }

                    foreach (Subsprite ss in subsprites)
                    {
                        xIndex = 0;
                        yIndex = 0;
                        cx = darkSectionPanel1.Location.X + darkSectionPanel1.Width + 20;
                        cy = darkSectionPanel1.Location.Y;
                        for (var i = 0; i < rows; i++)
                        {
                            for (var j = 0; j < lastImage.Width / cellW; j++)
                            {
                                bool hit = false;

                                Rectangle r = new Rectangle((int)(cx * 1), (int)(cy * 1), (int)(cellW * zoom), (int)(cellH * zoom));

                                if (r.Contains(new System.Drawing.Point((int)mouse.X, (int)mouse.Y)))
                                {
                                    hit = true;
                                }

                                if (xIndex >= ss.cellX && xIndex <= ss.cellW + ss.cellX && yIndex >= ss.cellY && yIndex <= ss.cellH + ss.cellY)
                                {
                                    e.Graphics.FillRectangle(ss.sb, r);
                                }

                                cx += (int)(cellW * zoom);
                                xIndex++;
                            }

                            cy += (int)Math.Round(cellH * zoom);
                            yIndex++;
                            xIndex = 0;
                            cx = darkSectionPanel1.Location.X + darkSectionPanel1.Width + 20;
                        }
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

        private void Sprites_manager_MouseClick(object sender, MouseEventArgs e)
        {
            if (e.Button == MouseButtons.Right)
            {
                if (rows > 0 && cellH > 0 && cellW > 0)
                {
                    int cx, cy;
                    cx = darkSectionPanel1.Location.X + darkSectionPanel1.Width + 20;
                    cy = darkSectionPanel1.Location.Y;

                    int xIndex = 0;
                    int yIndex = 0;
                    for (var i = 0; i < rows; i++)
                    {
                        for (var j = 0; j < lastImage.Width / cellW; j++)
                        {
                            bool hit = false;

                            Rectangle r = new Rectangle((int)(cx * 1), (int)(cy * 1), (int)(cellW * zoom), (int)(cellH * zoom));

                            if (r.Contains(new System.Drawing.Point((int)mouse.X, (int)mouse.Y)))
                            {
                                hit = true;
                            }

                            if (hit)
                            {
                                if (selectedSub == null)
                                {
                                    Subsprite s = new Subsprite();
                                    s.cellX = xIndex;
                                    s.cellY = yIndex;

                                    subsprites.Add(s);
                                    selectedSub = s;

                                    darkButton2.Visible = true;
                                }
                                else
                                {
                                    selectedSub.cellW = xIndex - selectedSub.cellX;
                                    selectedSub.cellH = yIndex - selectedSub.cellY;
                                    selectedSub = null;
                                }
                            }

                            cx += (int)(cellW * zoom);
                            xIndex++;
                        }

                        yIndex++;
                        xIndex = 0;
                        cy += (int)Math.Round(cellH * zoom);
                        cx = darkSectionPanel1.Location.X + darkSectionPanel1.Width + 20;
                    }
                }
            }
        }

        void Form_MouseWheel(object sender, MouseEventArgs e)
        {
            _totalDelta = _totalDelta + e.Delta;

            if (e.Delta > 0)
            {
                zoom += 0.11;;
            }
            else if (e.Delta < 0)
            {
                zoom -= 0.11;
            }
        }

        private void Sprites_manager_MouseMove(object sender, MouseEventArgs e)
        {
            mouse = new Vector2(e.X, e.Y);
        }

        private void darkButton2_Click(object sender, EventArgs e)
        {
            // save all subsprites
            int index = 0;
            foreach (Subsprite s in subsprites)
            {
                SavePartialBitmap(lastImage, selectedNode.Text + index + ".png", s.cellX * cellW, s.cellY * cellH, (s.cellW + 1) * cellW, (s.cellH + 1) * cellH, ImageFormat.Png);
                index++;
            }

            MessageBox.Show("Saved " + index + " subsprites");
        }

        public static void SavePartialBitmap(Bitmap b, string filename, int x, int y, int w, int h, System.Drawing.Imaging.ImageFormat format)
        {  
             Bitmap C = new Bitmap(w, h);  
             Graphics G = Graphics.FromImage(C);  
             Rectangle src = new Rectangle(x, y, w, h);  
             Rectangle dst = new Rectangle(0, 0, w, h);  
             G.DrawImage(b, dst, src, GraphicsUnit.Pixel);  
             G.Dispose();  
             C.Save(filename, format);  
             C.Dispose();  
        }
}

    public class Subsprite
    {
        public int cellX;
        public int cellY;
        public int cellW;
        public int cellH;
        public string name;
        public SolidBrush sb;

        public Subsprite()
        {
            cellW = 0;
            cellH = 0;
            Random r = new Random();
            sb = new SolidBrush(Color.FromArgb(64, r.Next(255), r.Next(255), r.Next(255)));
        }
    }
}
