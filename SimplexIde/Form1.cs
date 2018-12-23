using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Diagnostics;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Reflection;
using DarkUI.Controls;
using DarkUI.Docking;
using DarkUI.Forms;
using Microsoft.Xna.Framework;
using Microsoft.Xna.Framework.Input;
using SimplexCore;
using Color = System.Drawing.Color;

namespace SimplexIde
{

    public partial class Form1 : DarkForm
    {
        Type selectedObject = null;
        public static int width;
        public static int height;
        public static DarkTreeNode activeRoom;
        public static List<Type> reflectedTypes = new List<Type>();
        public DarkTreeView objects;
        public DarkTreeView rooms;
        public Sprites_manager SpritesManager = null;
        public TilesetControl ww = null;
        public ToolWindow w = null;

        public Form1()
        {
            InitializeComponent();
            Sgml.form = this;
            //Opacity = .5;
        }

        private void drawTest1_Click(object sender, EventArgs e)
        {

        }

        private void Form1_Load(object sender, EventArgs e)
        {
            // Application.AddMessageFilter(darkDockPanel2.DockContentDragFilter);
            Application.AddMessageFilter(darkDockPanel2.DockResizeFilter);
            Application.AddMessageFilter(darkDockPanel1.DockResizeFilter);
            Application.AddMessageFilter(darkDockPanel1.DockContentDragFilter);
            Application.AddMessageFilter(darkDockPanel3.DockResizeFilter);
            Application.AddMessageFilter(darkDockPanel3.DockContentDragFilter);
            Application.AddMessageFilter(darkDockPanel4.DockResizeFilter);
            Application.AddMessageFilter(darkDockPanel4.DockContentDragFilter);

            Invalidate();
            drawTest1.cms = darkContextMenu2;
            drawTest1.editorForm = this;
            //drawTest1.lt = darkDockPanel4.
            // load list of all defined objects
        }

        public void updateStack(int steps)
        {
            label9.Text = "Steps stacked: " + steps;
        }

        private void menuStrip1_ItemClicked(object sender, ToolStripItemClickedEventArgs e)
        {

        }

        public void setStatusBottom(string text)
        {
            toolStripStatusLabel1.Text = text;
        }

        private void treeView1_NodeMouseClick(object sender, TreeNodeMouseClickEventArgs e)
        {
            selectedObject = Type.GetType("SimplexResources.Objects." + e.Node.Text);
            drawTest1.SelectedObject = selectedObject;
        }

        private void drawTest1_MouseClick(object sender, MouseEventArgs e)
        {
            drawTest1.GameClicked(e, e.Button);
        }

        private void saveToolStripMenuItem_Click(object sender, EventArgs e)
        {
            if (activeRoom == null)
            {
                // activeRoom = treeView2.TopNode;
            }
            Sgml.game_save(Path.Combine(Environment.CurrentDirectory, @"Data/" + activeRoom.Text));
        }

        private void checkBox1_CheckedChanged(object sender, EventArgs e)
        {
            //drawTest1.ToggleGrid(checkBox1.Checked);
        }

        private void drawTest1_MouseMove(object sender, MouseEventArgs e)
        {
            if (e.Button == MouseButtons.Left)
            {
                //  drawTest1.GameClicked(e);
            }
        }

        private void drawTest1_Click_1(object sender, EventArgs e)
        {

        }

        private void drawTest1_MouseMove_1(object sender, MouseEventArgs e)
        {
            ;
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

        private void loadToolStripMenuItem_Click(object sender, EventArgs e)
        {
            // load last game
            Sgml.game_load(Path.Combine(Environment.CurrentDirectory, @"Data/" + activeRoom.Text));
        }

        private void listBox1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void numericUpDown1_ValueChanged(object sender, EventArgs e)
        {
            // width = (int)numericUpDown1.Value;
        }

        private void numericUpDown2_ValueChanged(object sender, EventArgs e)
        {
            //  height = (int)numericUpDown2.Value;
        }

        private void label6_Click(object sender, EventArgs e)
        {

        }

        private void button2_Click(object sender, EventArgs e)
        {

        }

        // Change active room here
        private void treeView2_AfterSelect(object sender, TreeViewEventArgs e)
        {
            if (activeRoom != null)
            {
                Sgml.game_save(Path.Combine(Environment.CurrentDirectory, @"Data/" + activeRoom.Text));
            }

            //  activeRoom = treeView2.SelectedNode;

            if (File.Exists(Path.Combine(Environment.CurrentDirectory, @"Data/" + activeRoom.Text)))
            {
                Sgml.game_load(Path.Combine(Environment.CurrentDirectory, @"Data/" + activeRoom.Text));
            }
            else
            {
                drawTest1.ClearAll();
            }
        }

        private void drawTest1_OnMouseWheelDownwards(MouseEventArgs e)
        {
            drawTest1.WheelDown();
        }

        private void drawTest1_MouseUp(object sender, MouseEventArgs e)
        {
            drawTest1.ClickRelease(e.Button);
        }

        private void drawTest1_OnMouseWheelUpwards(MouseEventArgs e)
        {
            drawTest1.WheelUp();
        }

        private void newToolStripMenuItem_Click(object sender, EventArgs e)
        {
            drawTest1.ClearAll();
        }

        private void drawTest1_MouseDown(object sender, MouseEventArgs e)
        {
            drawTest1.ClickLock(e.Button);
           
        }

        private void numericUpDown5_ValueChanged(object sender, EventArgs e)
        {
            //   drawTest1.GridSize = new Vector2((int)numericUpDown5.Value, (int)numericUpDown6.Value);
        }

        private void numericUpDown6_ValueChanged(object sender, EventArgs e)
        {
            numericUpDown5_ValueChanged(sender, e);
        }

        private void contextMenuStrip1_ItemClicked(object sender, ToolStripItemClickedEventArgs e)
        {
            drawTest1.RightClickMenuSelected(e);
        }

        private void contextMenuStrip1_Closed(object sender, ToolStripDropDownClosedEventArgs e)
        {
            drawTest1.cmsClosed();
        }

        private void contextMenuStrip1_Opened(object sender, EventArgs e)
        {
            drawTest1.cmsOpened();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            drawTest1.Undo();
        }

        private void drawTest1_SizeChanged(object sender, EventArgs e)
        {
            drawTest1.Rsize();
        }

        private void darkMenuStrip1_ItemClicked(object sender, ToolStripItemClickedEventArgs e)
        {

        }

        private void aboutToolStripMenuItem_Click(object sender, EventArgs e)
        {

        }

        private void darkMenuStrip2_ItemClicked(object sender, ToolStripItemClickedEventArgs e)
        {

        }

        private void darkSectionPanel1_Paint(object sender, PaintEventArgs e)
        {

        }

        private void darkDockPanel1_Load(object sender, EventArgs e)
        {

        }

        private void darkDockPanel2_Load(object sender, EventArgs e)
        {
            w = new ToolWindow();
            w.Dock = DockStyle.Fill;
            w.main = drawTest1;
            objects = w.dtv;
            darkDockPanel2.AddContent(w);

            loadResources();
        }

        void loadResources()
        {
            string nspace = "SimplexResources.Objects";

            var q = from t in Assembly.GetExecutingAssembly().GetTypes()
                    where t.IsClass && t.Namespace == nspace
                    select t;
            List<Type> classList = q.ToList().ToList();

            foreach (Type t in classList)
            {
                try
                {
                    using (GameObject o = (GameObject) Activator.CreateInstance(t))
                    {
                        // Register collisions
                        o.EvtRegisterCollisions();

                        DarkTreeNode tn = new DarkTreeNode();
                        tn.Text = t.Name;
                        tn.Tag = t.Name;
                        tn.Icon = Properties.Resources.AzureDefaultResource_16x;

                        if (string.IsNullOrEmpty(o.EditorPath))
                        {
                            tn.Icon = Properties.Resources.Folder_16x;

                            objects.Nodes[0].Nodes.Add(tn);
                        }
                        else
                        {
                            string[] pathTokens = o.EditorPath.Split('/');
                            DarkTreeNode currentNode = objects.Nodes[0];

                            foreach (string s in pathTokens)
                            {
                                if (currentNode.Nodes.FindIndex(x => (string) x.Tag == s) == -1)
                                {
                                    DarkTreeNode folderNode = new DarkTreeNode();
                                    folderNode.Text = s;
                                    folderNode.Tag = s;
                                    folderNode.Icon = Properties.Resources.Folder_16x;

                                    currentNode.Nodes.Add(folderNode);
                                    currentNode = folderNode;
                                }
                                else
                                {
                                    currentNode = currentNode.Nodes.Find(x => x.Text == s);
                                    currentNode?.Nodes.Add(tn);
                                    break;
                                }

                                if (s == pathTokens[pathTokens.Length - 1])
                                {
                                    currentNode?.Nodes.Add(tn);
                                }
                            }
                        }
                    }

                    reflectedTypes.Add(t);
                }

                catch (Exception e)
                {

                }
            }

            reflectedTypes.Add(typeof(RoomLayer));
            reflectedTypes.Add(typeof(TileLayer));

            nspace = "SimplexResources.Rooms";
            q = from t in Assembly.GetExecutingAssembly().GetTypes()
                where t.IsClass && t.Namespace == nspace
                select t;
            classList = q.ToList().ToList();

            foreach (Type t in classList)
            {
                rooms.Nodes[0].Nodes.Add(new DarkTreeNode(t.Name) { Icon = Properties.Resources.MapTileLayer_16x });
                reflectedTypes.Add(t);
            }

            activeRoom = null;
            drawTest1.InitializeNodes(objects.Nodes);


        }

        private void darkToolStrip1_ItemClicked(object sender, ToolStripItemClickedEventArgs e)
        {

        }

        private void darkDockPanel3_Load(object sender, EventArgs e)
        {
            ControlInterface w = new ControlInterface();
            ww = new TilesetControl();
            ww.DockText = "Tiles";
            ww.form = this;
            darkDockPanel3.AddContent(w);
            darkDockPanel3.AddContent(ww);
            ResizeRedraw = true;
        }

        private void darkDockPanel4_Load(object sender, EventArgs e)
        {
            LayerTool w = new LayerTool(drawTest1);
            w.form = this;
            darkDockPanel4.AddContent(w);

            RoomsControl r = new RoomsControl();
            r.drawTest1 = drawTest1;
            r.form1 = this;
            darkDockPanel4.AddContent(r);
            rooms = r.dtv;

            drawTest1.roomsControl = r;
        }

        private void darkToolStrip3_ItemClicked(object sender, ToolStripItemClickedEventArgs e)
        {

        }

        private void toolStripTextBox1_Click(object sender, EventArgs e)
        {

        }

        private void darkToolStrip2_ItemClicked(object sender, ToolStripItemClickedEventArgs e)
        {

        }

        private void saveToolStripMenuItem1_Click(object sender, EventArgs e)
        {
            Sgml.game_save("Data/" + activeRoom.Text);
        }

        private void newToolStripMenuItem1_Click(object sender, EventArgs e)
        {
            drawTest1.DeleteAll();
        }

        private void toolStripButton3_Click(object sender, EventArgs e)
        {
            drawTest1.GameRunning = true;
        }

        private void toolStripButton4_Click(object sender, EventArgs e)
        {
            drawTest1.GameRunning = false;
        }

        private void spritesManagerToolStripMenuItem_Click(object sender, EventArgs e)
        {
            // open sprites manager
            if (SpritesManager != null)
            {
                SpritesManager.Close();
            }

            SpritesManager = new Sprites_manager();
            SpritesManager.Owner = this;
            SpritesManager.owner = this;
            SpritesManager.StartPosition = FormStartPosition.CenterScreen;
            SpritesManager.Show();
        }

        private void darkDockPanel3_Paint(object sender, PaintEventArgs e)
        {
            base.OnPaint(e);
        }

        private void darkButton1_Click(object sender, EventArgs e)
        {

        }

        private void darkButton1_ForeColorChanged(object sender, EventArgs e)
        {

        }

        private void darkButton1_Paint(object sender, PaintEventArgs e)
        {

        }

        private void darkContextMenu2_Opened(object sender, EventArgs e)
        {
            drawTest1.cmsOpened();
        }

        private void darkContextMenu2_Closed(object sender, ToolStripDropDownClosedEventArgs e)
        {
            drawTest1.cmsClosed();
        }

        private void darkContextMenu2_ItemClicked(object sender, ToolStripItemClickedEventArgs e)
        {
            drawTest1.RightClickMenuSelected(e);
        }
    }
}