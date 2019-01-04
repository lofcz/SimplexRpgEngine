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
    public partial class Sounds_Manager : DarkForm
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
        private int toolMode = 0;
        List<SoundDescriptor> allSounds = new List<SoundDescriptor>();

        public Sounds_Manager()
        {
            InitializeComponent();
            this.MouseWheel += Form_MouseWheel;
        }

        private void Sprites_manager_Load(object sender, EventArgs e)
        {
            // first we load descriptor for all sprites
            // Sprites = JsonConvert.DeserializeObject<List<Spritesheet>>(new StreamReader("../../../SimplexRpgEngine3/SpritesDescriptor.json").ReadToEnd());

            string[] extensions = { ".mp3", ".wav", ".ogg", ".wma" };
            foreach (string file in Directory.EnumerateFiles("../../../SimplexRpgEngine3/Content/bin/Windows/Sounds/", "*.xnb*"))
            {
                string name = Path.GetFileNameWithoutExtension(file);

                if (owner.drawTest1.audioList.FindIndex(x => x.Name == name) != -1)
                {
                    okEntries.Add(name);
                }
                else
                {
                    badEntries.Add(name);
                }
            }

            DarkTreeNode dtn = new DarkTreeNode("Sounds");
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

            StreamReader sw = new StreamReader("../../../SimplexRpgEngine3/SoundsDescriptor.json");
            allSounds = JsonConvert.DeserializeObject<List<SoundDescriptor>>(sw.ReadToEnd());
            sw.Close();

            if (allSounds == null)
            {
                allSounds = new List<SoundDescriptor>();
            }
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
                    TagLib.File file = TagLib.File.Create("../../../SimplexRpgEngine3/Content/bin/Windows/Sounds/" + selectedNode.Text + ".wma");
                    string title = file.Tag.Title;
                    string album = file.Tag.Album;
                    string length = file.Properties.Duration.ToString();
                   
                    darkLabel1.Text = "Title: " + title;
                    darkLabel2.Text = "Album: " + album;
                    darkLabel3.Text = "Length: " + length;

                    // load sound's info if it exist, else save

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
            if (toolMode == 0)
            {

                SoundDescriptor overwrite = allSounds.FirstOrDefault(x => x.Name == selectedNode.Text);

                if (overwrite != null)
                {
                    overwrite.RelativeVolume = trackBar1.Value;
                }
                else
                {
                    SoundDescriptor s = new SoundDescriptor();
                    s.Name = selectedNode.Text;
                    s.RelativeVolume = trackBar1.Value;

                    okEntries.Add(s.Name);
                    badEntries.Remove(s.Name);

                    selectedNode.Icon = (Bitmap) Properties.Resources.Checkmark_16x;
                    darkTreeView1.Invalidate();

                    allSounds.Add(s);
                }

                string json = JsonConvert.SerializeObject(allSounds);

                using (StreamWriter writer = new StreamWriter("../../../SimplexRpgEngine3/SoundsDescriptor.json"))
                {
                    writer.WriteLine(json);
                    writer.Close();
                }
            }
        }

        private void Sprites_manager_MouseClick(object sender, MouseEventArgs e)
        {
            if (e.Button == System.Windows.Forms.MouseButtons.Right)
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
                                if (toolMode == 0)
                                {
                                    if (selectedSub == null)
                                    {
                                        Subsprite s = new Subsprite();
                                        s.cellX = xIndex;
                                        s.cellY = yIndex;

                                        subsprites.Add(s);
                                        selectedSub = s;
                                    }
                                    else
                                    {
                                        selectedSub.cellW = xIndex - selectedSub.cellX;
                                        selectedSub.cellH = yIndex - selectedSub.cellY;
                                        selectedSub = null;
                                    }
                                }

                                if (toolMode == 1)
                                {
                                    SavePartialBitmap(lastImage, Path.GetFullPath("../../../SimplexRpgEngine3/Content/Sprites/Tilesets/tilesetSource0.png"), xIndex * cellW, yIndex * cellH, cellW, cellH, System.Drawing.Imaging.ImageFormat.Png);

                                    lastImage = new Bitmap(Path.GetFullPath("../../../SimplexRpgEngine3/Content/Sprites/Tilesets/tilesetSource0.png"));
                                    toolMode = 2;

                                    Bitmap convertedImage = new Bitmap(256, 192);
                                    #region Algorithm logic

                                    CopyRegionIntoImage(lastImage, new Rectangle(16, 48, 32, 32), ref convertedImage, new Rectangle(0, 0, 32, 32));

                                    CopyRegionIntoImage(lastImage, new Rectangle(16, 48, 32, 32), ref convertedImage, new Rectangle(32, 0, 32, 32));
                                    CopyRegionIntoImage(lastImage, new Rectangle(32, 0, 16, 16), ref convertedImage, new Rectangle(32, 0, 16, 16));

                                    CopyRegionIntoImage(lastImage, new Rectangle(16, 48, 32, 32), ref convertedImage, new Rectangle(64, 0, 32, 32));
                                    CopyRegionIntoImage(lastImage, new Rectangle(48, 0, 16, 16), ref convertedImage, new Rectangle(80, 0, 16, 16));

                                    CopyRegionIntoImage(lastImage, new Rectangle(16, 48, 32, 32), ref convertedImage, new Rectangle(96, 0, 32, 32));
                                    CopyRegionIntoImage(lastImage, new Rectangle(32, 0, 16, 16), ref convertedImage, new Rectangle(96, 0, 16, 16));
                                    CopyRegionIntoImage(lastImage, new Rectangle(48, 0, 16, 16), ref convertedImage, new Rectangle(112, 0, 16, 16));

                                    CopyRegionIntoImage(lastImage, new Rectangle(16, 48, 32, 32), ref convertedImage, new Rectangle(128, 0, 32, 32));
                                    CopyRegionIntoImage(lastImage, new Rectangle(48, 16, 16, 16), ref convertedImage, new Rectangle(144, 16, 16, 16));

                                    CopyRegionIntoImage(lastImage, new Rectangle(16, 48, 32, 32), ref convertedImage, new Rectangle(160, 0, 32, 32));
                                    CopyRegionIntoImage(lastImage, new Rectangle(48, 16, 16, 16), ref convertedImage, new Rectangle(176, 16, 16, 16));
                                    CopyRegionIntoImage(lastImage, new Rectangle(32, 0, 16, 16), ref convertedImage, new Rectangle(160, 0, 16, 16));

                                    CopyRegionIntoImage(lastImage, new Rectangle(16, 48, 32, 32), ref convertedImage, new Rectangle(192, 0, 32, 32));
                                    CopyRegionIntoImage(lastImage, new Rectangle(48, 0, 16, 16), ref convertedImage, new Rectangle(208, 0, 16, 16));
                                    CopyRegionIntoImage(lastImage, new Rectangle(48, 16, 16, 16), ref convertedImage, new Rectangle(208, 16, 16, 16));

                                    CopyRegionIntoImage(lastImage, new Rectangle(16, 48, 32, 32), ref convertedImage, new Rectangle(224, 0, 32, 32));
                                    CopyRegionIntoImage(lastImage, new Rectangle(48, 0, 16, 16), ref convertedImage, new Rectangle(240, 0, 16, 16));
                                    CopyRegionIntoImage(lastImage, new Rectangle(48, 16, 16, 16), ref convertedImage, new Rectangle(240, 16, 16, 16));
                                    CopyRegionIntoImage(lastImage, new Rectangle(32, 0, 16, 16), ref convertedImage, new Rectangle(224, 0, 16, 16));

                                    CopyRegionIntoImage(lastImage, new Rectangle(16, 48, 32, 32), ref convertedImage, new Rectangle(0, 32, 32, 32));
                                    CopyRegionIntoImage(lastImage, new Rectangle(32, 16, 16, 16), ref convertedImage, new Rectangle(0, 48, 16, 16));

                                    CopyRegionIntoImage(lastImage, new Rectangle(16, 48, 32, 32), ref convertedImage, new Rectangle(32, 32, 32, 32));
                                    CopyRegionIntoImage(lastImage, new Rectangle(32, 0, 16, 32), ref convertedImage, new Rectangle(32, 32, 16, 32));

                                    CopyRegionIntoImage(lastImage, new Rectangle(16, 48, 32, 32), ref convertedImage, new Rectangle(64, 32, 32, 32));
                                    CopyRegionIntoImage(lastImage, new Rectangle(48, 0, 16, 16), ref convertedImage, new Rectangle(80, 32, 16, 16));
                                    CopyRegionIntoImage(lastImage, new Rectangle(32, 16, 16, 16), ref convertedImage, new Rectangle(64, 48, 16, 16));

                                    CopyRegionIntoImage(lastImage, new Rectangle(16, 48, 32, 32), ref convertedImage, new Rectangle(96, 32, 32, 32));
                                    CopyRegionIntoImage(lastImage, new Rectangle(48, 0, 16, 16), ref convertedImage, new Rectangle(112, 32, 16, 16));
                                    CopyRegionIntoImage(lastImage, new Rectangle(32, 16, 16, 16), ref convertedImage, new Rectangle(96, 48, 16, 16));
                                    CopyRegionIntoImage(lastImage, new Rectangle(32, 0, 16, 16), ref convertedImage, new Rectangle(96, 32, 16, 16));

                                    CopyRegionIntoImage(lastImage, new Rectangle(16, 48, 32, 32), ref convertedImage, new Rectangle(128, 32, 32, 32));
                                    CopyRegionIntoImage(lastImage, new Rectangle(32, 16, 32, 16), ref convertedImage, new Rectangle(128, 48, 32, 16));

                                    CopyRegionIntoImage(lastImage, new Rectangle(16, 48, 32, 32), ref convertedImage, new Rectangle(160, 32, 32, 32));
                                    CopyRegionIntoImage(lastImage, new Rectangle(32, 16, 32, 16), ref convertedImage, new Rectangle(160, 48, 32, 16));
                                    CopyRegionIntoImage(lastImage, new Rectangle(32, 0, 16, 16), ref convertedImage, new Rectangle(160, 32, 16, 16));

                                    CopyRegionIntoImage(lastImage, new Rectangle(16, 48, 32, 32), ref convertedImage, new Rectangle(192, 32, 32, 32));
                                    CopyRegionIntoImage(lastImage, new Rectangle(32, 16, 32, 16), ref convertedImage, new Rectangle(192, 48, 32, 16));
                                    CopyRegionIntoImage(lastImage, new Rectangle(48, 0, 16, 16), ref convertedImage, new Rectangle(208, 32, 16, 16));

                                    CopyRegionIntoImage(lastImage, new Rectangle(32, 0, 32, 32), ref convertedImage, new Rectangle(224, 32, 32, 32));

                                    CopyRegionIntoImage(lastImage, new Rectangle(0, 48, 32, 32), ref convertedImage, new Rectangle(0, 64, 32, 32));

                                    CopyRegionIntoImage(lastImage, new Rectangle(0, 48, 32, 32), ref convertedImage, new Rectangle(32, 64, 32, 32));
                                    CopyRegionIntoImage(lastImage, new Rectangle(48, 0, 16, 16), ref convertedImage, new Rectangle(48, 64, 16, 16));

                                    CopyRegionIntoImage(lastImage, new Rectangle(0, 48, 32, 32), ref convertedImage, new Rectangle(64, 64, 32, 32));
                                    CopyRegionIntoImage(lastImage, new Rectangle(48, 16, 16, 16), ref convertedImage, new Rectangle(80, 80, 16, 16));

                                    CopyRegionIntoImage(lastImage, new Rectangle(0, 48, 32, 32), ref convertedImage, new Rectangle(96, 64, 32, 32));
                                    CopyRegionIntoImage(lastImage, new Rectangle(48, 16, 16, 16), ref convertedImage, new Rectangle(112, 80, 16, 16));
                                    CopyRegionIntoImage(lastImage, new Rectangle(48, 0, 16, 16), ref convertedImage, new Rectangle(112, 64, 16, 16));

                                    CopyRegionIntoImage(lastImage, new Rectangle(16, 32, 32, 32), ref convertedImage, new Rectangle(128, 64, 32, 32));

                                    CopyRegionIntoImage(lastImage, new Rectangle(16, 32, 32, 32), ref convertedImage, new Rectangle(160, 64, 32, 32));
                                    CopyRegionIntoImage(lastImage, new Rectangle(48, 16, 16, 16), ref convertedImage, new Rectangle(176, 80, 16, 16));

                                    CopyRegionIntoImage(lastImage, new Rectangle(16, 32, 32, 32), ref convertedImage, new Rectangle(192, 64, 32, 32));
                                    CopyRegionIntoImage(lastImage, new Rectangle(32, 16, 16, 16), ref convertedImage, new Rectangle(192, 80, 16, 16));

                                    CopyRegionIntoImage(lastImage, new Rectangle(16, 32, 32, 32), ref convertedImage, new Rectangle(224, 64, 32, 32));
                                    CopyRegionIntoImage(lastImage, new Rectangle(48, 16, 16, 16), ref convertedImage, new Rectangle(240, 80, 16, 16));
                                    CopyRegionIntoImage(lastImage, new Rectangle(32, 16, 16, 16), ref convertedImage, new Rectangle(224, 80, 16, 16));

                                    CopyRegionIntoImage(lastImage, new Rectangle(32, 48, 32, 32), ref convertedImage, new Rectangle(0, 96, 32, 32));

                                    CopyRegionIntoImage(lastImage, new Rectangle(32, 48, 32, 32), ref convertedImage, new Rectangle(32, 96, 32, 32));
                                    CopyRegionIntoImage(lastImage, new Rectangle(32, 16, 16, 16), ref convertedImage, new Rectangle(32, 112, 16, 16));

                                    CopyRegionIntoImage(lastImage, new Rectangle(32, 48, 32, 32), ref convertedImage, new Rectangle(64, 96, 32, 32));
                                    CopyRegionIntoImage(lastImage, new Rectangle(32, 0, 16, 16), ref convertedImage, new Rectangle(64, 96, 16, 16));

                                    CopyRegionIntoImage(lastImage, new Rectangle(32, 48, 32, 32), ref convertedImage, new Rectangle(96, 96, 32, 32));
                                    CopyRegionIntoImage(lastImage, new Rectangle(32, 16, 16, 16), ref convertedImage, new Rectangle(96, 112, 16, 16));
                                    CopyRegionIntoImage(lastImage, new Rectangle(32, 0, 16, 16), ref convertedImage, new Rectangle(96, 96, 16, 16));

                                    CopyRegionIntoImage(lastImage, new Rectangle(16, 64, 32, 32), ref convertedImage, new Rectangle(128, 96, 32, 32));

                                    CopyRegionIntoImage(lastImage, new Rectangle(16, 64, 32, 32), ref convertedImage, new Rectangle(160, 96, 32, 32));
                                    CopyRegionIntoImage(lastImage, new Rectangle(32, 0, 16, 16), ref convertedImage, new Rectangle(160, 96, 16, 16));

                                    CopyRegionIntoImage(lastImage, new Rectangle(16, 64, 32, 32), ref convertedImage, new Rectangle(192, 96, 32, 32));
                                    CopyRegionIntoImage(lastImage, new Rectangle(48, 0, 16, 16), ref convertedImage, new Rectangle(208, 96, 16, 16));

                                    CopyRegionIntoImage(lastImage, new Rectangle(16, 64, 32, 32), ref convertedImage, new Rectangle(224, 96, 32, 32));
                                    CopyRegionIntoImage(lastImage, new Rectangle(32, 0, 16, 16), ref convertedImage, new Rectangle(224, 96, 16, 16));
                                    CopyRegionIntoImage(lastImage, new Rectangle(48, 0, 16, 16), ref convertedImage, new Rectangle(240, 96, 16, 16));

                                    CopyRegionIntoImage(lastImage, new Rectangle(0, 48, 16, 32), ref convertedImage, new Rectangle(0, 128, 16, 32));

                                    CopyRegionIntoImage(lastImage, new Rectangle(48, 48, 16, 32), ref convertedImage, new Rectangle(16, 128, 16, 32));

                                    CopyRegionIntoImage(lastImage, new Rectangle(16, 32, 32, 16), ref convertedImage, new Rectangle(32, 128, 32, 16));

                                    CopyRegionIntoImage(lastImage, new Rectangle(16, 80, 32, 16), ref convertedImage, new Rectangle(32, 144, 32, 16));

                                    CopyRegionIntoImage(lastImage, new Rectangle(0, 32, 32, 32), ref convertedImage, new Rectangle(64, 128, 32, 32));

                                    CopyRegionIntoImage(lastImage, new Rectangle(0, 32, 32, 32), ref convertedImage, new Rectangle(96, 128, 32, 32));
                                    CopyRegionIntoImage(lastImage, new Rectangle(48, 16, 16, 16), ref convertedImage, new Rectangle(96 + 16, 128 + 16, 16, 16));

                                    CopyRegionIntoImage(lastImage, new Rectangle(32, 32, 32, 32), ref convertedImage, new Rectangle(128, 128, 32, 32));

                                    CopyRegionIntoImage(lastImage, new Rectangle(32, 32, 32, 32), ref convertedImage, new Rectangle(160, 128, 32, 32));
                                    CopyRegionIntoImage(lastImage, new Rectangle(32, 16, 16, 16), ref convertedImage, new Rectangle(160, 128 + 16, 16, 16));

                                    CopyRegionIntoImage(lastImage, new Rectangle(32, 64, 32, 32), ref convertedImage, new Rectangle(192, 128, 32, 32));

                                    CopyRegionIntoImage(lastImage, new Rectangle(32, 64, 32, 32), ref convertedImage, new Rectangle(224, 128, 32, 32));
                                    CopyRegionIntoImage(lastImage, new Rectangle(32, 0, 16, 16), ref convertedImage, new Rectangle(224, 128, 16, 16));

                                    CopyRegionIntoImage(lastImage, new Rectangle(0, 64, 32, 32), ref convertedImage, new Rectangle(0, 160, 32, 32));

                                    CopyRegionIntoImage(lastImage, new Rectangle(0, 64, 32, 32), ref convertedImage, new Rectangle(32, 160, 32, 32));
                                    CopyRegionIntoImage(lastImage, new Rectangle(48, 0, 16, 16), ref convertedImage, new Rectangle(48, 160, 16, 16));

                                    CopyRegionIntoImage(lastImage, new Rectangle(0, 32, 16, 32), ref convertedImage, new Rectangle(64, 160, 16, 32));
                                    CopyRegionIntoImage(lastImage, new Rectangle(48, 32, 16, 32), ref convertedImage, new Rectangle(80, 160, 16, 32));

                                    CopyRegionIntoImage(lastImage, new Rectangle(0, 32, 32, 16), ref convertedImage, new Rectangle(96, 160, 32, 16));
                                    CopyRegionIntoImage(lastImage, new Rectangle(0, 80, 32, 16), ref convertedImage, new Rectangle(96, 176, 32, 16));

                                    CopyRegionIntoImage(lastImage, new Rectangle(0, 64, 16, 32), ref convertedImage, new Rectangle(128, 160, 16, 32));
                                    CopyRegionIntoImage(lastImage, new Rectangle(48, 64, 16, 32), ref convertedImage, new Rectangle(144, 160, 16, 32));

                                    CopyRegionIntoImage(lastImage, new Rectangle(32, 32, 32, 16), ref convertedImage, new Rectangle(160, 160, 32, 16));
                                    CopyRegionIntoImage(lastImage, new Rectangle(32, 80, 32, 16), ref convertedImage, new Rectangle(160, 176, 32, 16));

                                    CopyRegionIntoImage(lastImage, new Rectangle(0, 0, 32, 32), ref convertedImage, new Rectangle(192, 160, 32, 32));

                                    CopyRegionIntoImage(lastImage, new Rectangle(16, 48, 32, 32), ref convertedImage, new Rectangle(224, 160, 32, 32));
                                    #endregion


                                    lastImage = convertedImage;

                                    Bitmap bpp = new Bitmap(256, 192);

                                    // r1
                                    CopyRegionIntoImage(lastImage, new Rectangle(0, 0, 32, 32), ref bpp, new Rectangle(0, 0, 32, 32));
                                    CopyRegionIntoImage(lastImage, new Rectangle(128, 160, 32, 32), ref bpp, new Rectangle(32, 0, 32, 32));
                                    CopyRegionIntoImage(lastImage, new Rectangle(160, 160, 32, 32), ref bpp, new Rectangle(64, 0, 32, 32));
                                    CopyRegionIntoImage(lastImage, new Rectangle(224, 128, 32, 32), ref bpp, new Rectangle(96, 0, 32, 32));
                                    CopyRegionIntoImage(lastImage, new Rectangle(192, 128, 32, 32), ref bpp, new Rectangle(128, 0, 32, 32));
                                    CopyRegionIntoImage(lastImage, new Rectangle(96, 160, 32, 32), ref bpp, new Rectangle(160, 0, 32, 32));
                                    CopyRegionIntoImage(lastImage, new Rectangle(32, 160, 32, 32), ref bpp, new Rectangle(192, 0, 32, 32));
                                    CopyRegionIntoImage(lastImage, new Rectangle(0, 160, 32, 32), ref bpp, new Rectangle(224, 0, 32, 32));

                                    // r2
                                    CopyRegionIntoImage(lastImage, new Rectangle(32, 128, 32, 32), ref bpp, new Rectangle(0, 32, 32, 32));
                                    CopyRegionIntoImage(lastImage, new Rectangle(224, 96, 32, 32), ref bpp, new Rectangle(32, 32, 32, 32));
                                    CopyRegionIntoImage(lastImage, new Rectangle(192, 96, 32, 32), ref bpp, new Rectangle(64, 32, 32, 32));
                                    CopyRegionIntoImage(lastImage, new Rectangle(160, 96, 32, 32), ref bpp, new Rectangle(96, 32, 32, 32));
                                    CopyRegionIntoImage(lastImage, new Rectangle(128, 96, 32, 32), ref bpp, new Rectangle(128, 32, 32, 32));
                                    CopyRegionIntoImage(lastImage, new Rectangle(64, 160, 32, 32), ref bpp, new Rectangle(160, 32, 32, 32));
                                    CopyRegionIntoImage(lastImage, new Rectangle(0, 128, 32, 32), ref bpp, new Rectangle(192, 32, 32, 32));
                                    CopyRegionIntoImage(lastImage, new Rectangle(160, 128, 32, 32), ref bpp, new Rectangle(224, 32, 32, 32));

                                    // r3
                                    CopyRegionIntoImage(lastImage, new Rectangle(96, 96, 32, 32), ref bpp, new Rectangle(0, 64, 32, 32));
                                    CopyRegionIntoImage(lastImage, new Rectangle(32, 96, 32, 32), ref bpp, new Rectangle(32, 64, 32, 32));
                                    CopyRegionIntoImage(lastImage, new Rectangle(96, 128, 32, 32), ref bpp, new Rectangle(64, 64, 32, 32));
                                    CopyRegionIntoImage(lastImage, new Rectangle(96, 64, 32, 32), ref bpp, new Rectangle(96, 64, 32, 32));
                                    CopyRegionIntoImage(lastImage, new Rectangle(64, 64, 32, 32), ref bpp, new Rectangle(128, 64, 32, 32));
                                    CopyRegionIntoImage(lastImage, new Rectangle(192, 64, 32, 32), ref bpp, new Rectangle(160, 64, 32, 32));
                                    CopyRegionIntoImage(lastImage, new Rectangle(224, 32, 32, 32), ref bpp, new Rectangle(192, 64, 32, 32));
                                    CopyRegionIntoImage(lastImage, new Rectangle(64, 32, 32, 32), ref bpp, new Rectangle(224, 64, 32, 32));

                                    // r4
                                    CopyRegionIntoImage(lastImage, new Rectangle(160, 32, 32, 32), ref bpp, new Rectangle(0, 96, 32, 32));
                                    CopyRegionIntoImage(lastImage, new Rectangle(128, 32, 32, 32), ref bpp, new Rectangle(32, 96, 32, 32));
                                    CopyRegionIntoImage(lastImage, new Rectangle(128, 128, 32, 32), ref bpp, new Rectangle(64, 96, 32, 32));
                                    CopyRegionIntoImage(lastImage, new Rectangle(64, 96, 32, 32), ref bpp, new Rectangle(96, 96, 32, 32));
                                    CopyRegionIntoImage(lastImage, new Rectangle(0, 96, 32, 32), ref bpp, new Rectangle(128, 96, 32, 32));
                                    CopyRegionIntoImage(lastImage, new Rectangle(160, 64, 32, 32), ref bpp, new Rectangle(160, 96, 32, 32));
                                    CopyRegionIntoImage(lastImage, new Rectangle(160, 0, 32, 32), ref bpp, new Rectangle(192, 96, 32, 32));
                                    CopyRegionIntoImage(lastImage, new Rectangle(192, 0, 32, 32), ref bpp, new Rectangle(224, 96, 32, 32));

                                    // r5
                                    CopyRegionIntoImage(lastImage, new Rectangle(160, 0, 32, 32), ref bpp, new Rectangle(0, 128, 32, 32));
                                    CopyRegionIntoImage(lastImage, new Rectangle(128, 0, 32, 32), ref bpp, new Rectangle(32, 128, 32, 32));
                                    CopyRegionIntoImage(lastImage, new Rectangle(64, 128, 32, 32), ref bpp, new Rectangle(64, 128, 32, 32));
                                    CopyRegionIntoImage(lastImage, new Rectangle(32, 64, 32, 32), ref bpp, new Rectangle(96, 128, 32, 32));
                                    CopyRegionIntoImage(lastImage, new Rectangle(0, 64, 32, 32), ref bpp, new Rectangle(128, 128, 32, 32));
                                    CopyRegionIntoImage(lastImage, new Rectangle(192, 64, 32, 32), ref bpp, new Rectangle(160, 128, 32, 32));
                                    CopyRegionIntoImage(lastImage, new Rectangle(96, 32, 32, 32), ref bpp, new Rectangle(192, 128, 32, 32));
                                    CopyRegionIntoImage(lastImage, new Rectangle(64, 32, 32, 32), ref bpp, new Rectangle(224, 128, 32, 32));

                                    // r6
                                    CopyRegionIntoImage(lastImage, new Rectangle(32, 32, 32, 32), ref bpp, new Rectangle(0, 160, 32, 32));
                                    CopyRegionIntoImage(lastImage, new Rectangle(0, 32, 32, 32), ref bpp, new Rectangle(32, 160, 32, 32));
                                    CopyRegionIntoImage(lastImage, new Rectangle(128, 64, 32, 32), ref bpp, new Rectangle(64, 160, 32, 32));
                                    CopyRegionIntoImage(lastImage, new Rectangle(96, 0, 32, 32), ref bpp, new Rectangle(96, 160, 32, 32));
                                    CopyRegionIntoImage(lastImage, new Rectangle(64, 0, 32, 32), ref bpp, new Rectangle(128, 160, 32, 32));
                                    CopyRegionIntoImage(lastImage, new Rectangle(32, 0, 32, 32), ref bpp, new Rectangle(160, 160, 32, 32));
                                    CopyRegionIntoImage(lastImage, new Rectangle(0, 0, 32, 32), ref bpp, new Rectangle(192, 160, 32, 32));
                                    CopyRegionIntoImage(lastImage, new Rectangle(192, 160, 32, 32), ref bpp, new Rectangle(224, 160, 32, 32));


                                    bpp.Save(Path.GetFullPath("../../../SimplexRpgEngine3/Content/Sprites/Tilesets/tileset0.png"));
                                    //lastImage.Save(Path.GetFullPath("../../../SimplexRpgEngine3/Content/Sprites/Tilesets/tileset0.png"));
                                    using (StreamWriter w = File.AppendText("../../../SimplexRpgEngine3/Content/Content.mgcb"))
                                    {

                                        w.WriteLine("#begin Sprites/Tilesets/" + "tileset0.png");
                                        w.WriteLine("/importer:TextureImporter");
                                        w.WriteLine("/processor:TextureProcessor");
                                        w.WriteLine("/processorParam:ColorKeyColor=255,0,255,255");
                                        w.WriteLine("/processorParam:ColorKeyEnabled=True");
                                        w.WriteLine("/processorParam:GenerateMipmaps=False");
                                        w.WriteLine("/processorParam:PremultiplyAlpha=True");
                                        w.WriteLine("/processorParam:ResizeToPowerOfTwo=False");
                                        w.WriteLine("/processorParam:MakeSquare=False");
                                        w.WriteLine("/processorParam:TextureFormat=Color");
                                        w.WriteLine("/build:Sprites/Tilesets/" + "tileset0.png");
                                        w.WriteLine("");
                                    }
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
                SavePartialBitmap(lastImage, "../../../SimplexRpgEngine3/Content/Sprites/" + selectedNode.Text + index + ".png", s.cellX * cellW, s.cellY * cellH, (s.cellW + 1) * cellW, (s.cellH + 1) * cellH, System.Drawing.Imaging.ImageFormat.Png);
                index++;
            }

            // all sprites are saved where they need to be
            // now we import them to mgcb
            using (StreamWriter w = File.AppendText("../../../SimplexRpgEngine3/Content/Content.mgcb"))
            {
                index = 0;
                foreach (Subsprite s in subsprites)
                {
                    w.WriteLine("#begin Sprites/" + selectedNode.Text + index + ".png");
                    w.WriteLine("/importer:TextureImporter");
                    w.WriteLine("/processor:TextureProcessor");
                    w.WriteLine("/processorParam:ColorKeyColor=255,0,255,255");
                    w.WriteLine("/processorParam:ColorKeyEnabled=True");
                    w.WriteLine("/processorParam:GenerateMipmaps=False");
                    w.WriteLine("/processorParam:PremultiplyAlpha=True");
                    w.WriteLine("/processorParam:ResizeToPowerOfTwo=False");
                    w.WriteLine("/processorParam:MakeSquare=False");
                    w.WriteLine("/processorParam:TextureFormat=Color");
                    w.WriteLine("/build:Sprites/" + selectedNode.Text + index + ".png");
                    w.WriteLine("");
                    index++;
                }

            }

            // then we build content
       /*    string filename = "../../../SimplexRpgEngine3/Content/SimplexBuild/Tools/MGCB.exe";
           string filenameOutput = "../../../SimplexRpgEngine3/Content/";
            string absolute = Path.GetFullPath(filename);
            string absolute2 = Path.GetFullPath(filenameOutput);
            var proc = System.Diagnostics.Process.Start(absolute, "/outputDir:" + absolute2 + " /rebuild");*/
         //   proc.Close();

            // all good
            MessageBox.Show("Saved " + index + " subsprites");
        }

        public static void SavePartialBitmap(Bitmap b, string filename, int x, int y, int w, int h, System.Drawing.Imaging.ImageFormat format)
        {
            using (Bitmap C = new Bitmap(w, h, PixelFormat.Format32bppArgb))
            {
                Graphics G = Graphics.FromImage(C);
                Rectangle src = new Rectangle(x, y, w, h);
                Rectangle dst = new Rectangle(0, 0, w, h);
                G.DrawImage(b, dst, src, GraphicsUnit.Pixel);
                G.Dispose();
                C.Save(filename, format);
                C.Dispose();
            }
        }

        private void importSpriteToolStripMenuItem_Click(object sender, EventArgs e)
        {
            // import sprite
            if (openFileDialog1.ShowDialog() == System.Windows.Forms.DialogResult.OK)
            {
                string path = openFileDialog1.FileName;

            }
        }

        private void importTilesetToolStripMenuItem_Click(object sender, EventArgs e)
        {
            // import tileset
            if (openFileDialog1.ShowDialog() == System.Windows.Forms.DialogResult.OK)
            {
                string path = openFileDialog1.FileName;
                Bitmap bitmap = new Bitmap(path);

                lastImage = bitmap;
                toolMode = 1;
            }
        }

        public static void CopyRegionIntoImage(Bitmap srcBitmap, Rectangle srcRegion, ref Bitmap destBitmap, Rectangle destRegion)
        {
            using (Graphics grD = Graphics.FromImage(destBitmap))
            {
                grD.DrawImage(srcBitmap, destRegion, srcRegion, GraphicsUnit.Pixel);
            }
        }

        private void darkSectionPanel1_Paint(object sender, PaintEventArgs e)
        {

        }

        private void trackBar1_Scroll(object sender, EventArgs e)
        {

        }
    }

}
