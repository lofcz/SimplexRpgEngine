using System;
using System.CodeDom;
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
using Newtonsoft.Json;
using SimplexCore;
using SimplexCore.IDE;
using Color = System.Drawing.Color;
using Point = System.Drawing.Point;

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
        public Sounds_Manager SoundsManager;
        public TilesetControl ww = null;
        public ToolWindow w = null;
        public ControlInterface properties = null;
        public Point renderPos = Point.Empty;
        public Size renderSize = Size.Empty;
        public string projectFile = "";
        public SimplexProjectStructure currentProject = null;
        public RoomsControl r = null;
        public LayerTool lt = null;
        public SimplexRender sr = null;
        public Graphics WinGraphics;
        public Form1()
        {
            InitializeComponent();
            Sgml.form = this;
            Sgml.currentProject = currentProject;
            //Opacity = .5;
        }

        private void drawTest1_Click(object sender, EventArgs e)
        {

        }

        private void Form1_Load(object sender, EventArgs e)
        {
            // Application.AddMessageFilter(darkDockPanel2.DockContentDragFilter);
            Application.AddMessageFilter(darkDockPanel5.DockResizeFilter);
            Application.AddMessageFilter(darkDockPanel2.DockResizeFilter);
            Application.AddMessageFilter(darkDockPanel1.DockResizeFilter);
            Application.AddMessageFilter(darkDockPanel3.DockResizeFilter);
            Application.AddMessageFilter(darkDockPanel4.DockResizeFilter);

            
            Invalidate();

            sr = new SimplexRender();
            sr.drawTest1.editorForm = this;
            sr.drawTest1.cms = darkContextMenu2;
            sr.drawTest1.lt = lt;
            //  sr.drawTest1.cms = darkContextMenu2;
            //  sr.drawTest1.editorForm = this;
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
            sr.drawTest1.SelectedObject = selectedObject;
        }

        private void drawTest1_MouseClick(object sender, MouseEventArgs e)
        {
            sr.drawTest1.GameClicked(e, e.Button);
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
                sr.drawTest1.ClearAll();
            }
        }

        private void drawTest1_OnMouseWheelDownwards(MouseEventArgs e)
        {
          
        }

        private void drawTest1_MouseUp(object sender, MouseEventArgs e)
        {
            
        }

        private void drawTest1_OnMouseWheelUpwards(MouseEventArgs e)
        {
            
        }

        private void newToolStripMenuItem_Click(object sender, EventArgs e)
        {
        
        }

        private void drawTest1_MouseDown(object sender, MouseEventArgs e)
        {
           
           
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
            sr.drawTest1.RightClickMenuSelected(e);
        }

        private void contextMenuStrip1_Closed(object sender, ToolStripDropDownClosedEventArgs e)
        {
            sr.drawTest1.cmsClosed();
        }

        private void contextMenuStrip1_Opened(object sender, EventArgs e)
        {
            sr.drawTest1.cmsOpened();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            sr.drawTest1.Undo();
        }

        private void drawTest1_SizeChanged(object sender, EventArgs e)
        {
            sr.drawTest1.Rsize();
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


        }

        public void loadObjects(string corePath, SimplexProjectStructure sps)
        {
            currentProject = sps;
            Dictionary<Type, SimplexProjectItem> fList = new Dictionary<Type, SimplexProjectItem>();

            SimplexIdeApi.GetResourceClasses(corePath, "Objects", ref fList, sps.Objects);
            SimplexIdeApi.TreeParseNodes(objects, "Objects", fList);
            SimplexIdeApi.RegisterColliderTypes(fList, ref reflectedTypes);
            CollisionsTree.ComputeActiveColliders();

            fList.Clear();
            SimplexIdeApi.RegisterSimple(corePath, "Rooms", ref fList, sps.Rooms);

            foreach (var t in fList)
            {
                rooms.Nodes[0].Nodes.Add(new DarkTreeNode(t.Key.Name) { Icon = Properties.Resources.MapTileLayer_16x });
                reflectedTypes.Add(t.Key);
            }

            activeRoom = null;
            sr.drawTest1.InitializeNodes(objects.Nodes);
        }

        private void darkToolStrip1_ItemClicked(object sender, ToolStripItemClickedEventArgs e)
        {

        }

        private void darkDockPanel3_Load(object sender, EventArgs e)
        {
            properties = new ControlInterface();
            ww = new TilesetControl();
            ww.DockText = "Tiles";
            ww.form = this;
            darkDockPanel3.AddContent(properties);
            darkDockPanel3.AddContent(ww);
            ResizeRedraw = true;
        }

        private void darkDockPanel4_Load(object sender, EventArgs e)
        {
            lt = new LayerTool();
            lt.form = this;
            darkDockPanel4.AddContent(lt);

            r = new RoomsControl();
            r.form1 = this;
            darkDockPanel4.AddContent(r);
            rooms = r.dtv;
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
            string mapContent = Path.Combine(currentProject.RootPath, @"Data\" + r.dtv.SelectedNodes[0].Text);
            toolStripStatusLabel3.Text = "Room saved";
            Sgml.game_save(mapContent);
        }

        private void newToolStripMenuItem1_Click(object sender, EventArgs e)
        {
            sr.drawTest1.DeleteAll();
            FormNew f = new FormNew();
            darkDockPanel1.AddContent(f);
        }

        private void toolStripButton3_Click(object sender, EventArgs e)
        {
            sr.drawTest1.GameRunning = true;
        }

        private void toolStripButton4_Click(object sender, EventArgs e)
        {
            sr.drawTest1.GameRunning = false;
        }

        private void spritesManagerToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Sprites_manager sm = new Sprites_manager();
            sm.owner = this;
            darkDockPanel1.AddContent(sm);
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
            sr.drawTest1.cmsOpened();
        }

        private void darkContextMenu2_Closed(object sender, ToolStripDropDownClosedEventArgs e)
        {
            sr.drawTest1.cmsClosed();
        }

        private void darkContextMenu2_ItemClicked(object sender, ToolStripItemClickedEventArgs e)
        {
            sr.drawTest1.RightClickMenuSelected(e);
        }

        private void toolStripSplitButton2_ButtonClick(object sender, EventArgs e)
        {
            sr.drawTest1.ToggleGrid();
        }

        private void checkForUpdatesToolStripMenuItem_Click(object sender, EventArgs e)
        {
            // check for updates
        }

        private void openManualToolStripMenuItem_Click(object sender, EventArgs e)
        {
            // open manual
            Process.Start("https://github.com/lofcz/SimplexRpgEngine/wiki");
        }

        private void soundsManagerToolStripMenuItem_Click(object sender, EventArgs e)
        {
            // Open sounds manager
            SoundsManager = new Sounds_Manager();
            SoundsManager.owner = this;

            darkDockPanel1.AddContent(SoundsManager);

        }

        public void Form1_FormClosing(object sender, FormClosingEventArgs e)
        {
           Application.Exit();
        }

        public void preventClose(FormClosingEventArgs e)
        {
            e.Cancel = true;
        }

        private void toolStripButton7_Click(object sender, EventArgs e)
        {
            // toggle fullscreen mode
            renderPos = darkDockPanel1.Location;
            renderSize = darkDockPanel1.Size;

            darkDockPanel1.Location = new System.Drawing.Point(0, 0);
            darkDockPanel1.Size = new Size(Width, Height);

            sr.drawTest1.Location = new Point(sr.drawTest1.Location.X, sr.drawTest1.Location.Y - 25);
            sr.drawTest1.Size = new Size(sr.drawTest1.Size.Width, sr.drawTest1.Size.Height + 25);
            sr.HideTitle = true;
        }

        private void statusStrip1_ItemClicked(object sender, ToolStripItemClickedEventArgs e)
        {

        }

        private void DarkContextMenu1_Opening(object sender, CancelEventArgs e)
        {

        }

        private void Form1_Shown(object sender, EventArgs e)
        {
            // this fires when loading is complete
            // fire loading finished for simplexRender dependent controls
            r.drawTest1 = sr.drawTest1;
            lt.FinishIni(sr.drawTest1);


            darkDockPanel1.AddContent(sr);

            w = new ToolWindow();
            w.Dock = DockStyle.Fill;
            w.main = sr.drawTest1;
            w.form1 = this;

            objects = w.dtv;
            darkDockPanel2.AddContent(w);

            sr.drawTest1.roomsControl = r;
            sr.drawTest1.Rsize();

            ww.LoadReady();
        }

        private void Form1_Resize(object sender, EventArgs e)
        {
            if (sr != null && sr.drawTest1 != null)
            {
                sr.drawTest1.Rsize();
            }
        }

        private void Form1_Paint(object sender, PaintEventArgs e)
        {
            WinGraphics = e.Graphics;
        }
    }
}