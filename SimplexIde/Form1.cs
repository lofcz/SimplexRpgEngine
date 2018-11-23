using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Reflection;
using SimplexCore;

namespace SimplexIde
{

    public partial class Form1 : Form
    {
        Type selectedObject = null;
        public static int width;
        public static int height;
        public static TreeNode activeRoom;
        public static List<Type> reflectedTypes = new List<Type>();

        public Form1()
        {
            InitializeComponent();
        }

        private void drawTest1_Click(object sender, EventArgs e)
        {
           
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            // load list of all defined objects
            string nspace = "SimplexResources.Objects";

            var q = from t in Assembly.GetExecutingAssembly().GetTypes()
                where t.IsClass && t.Namespace == nspace
                select t;
            List<Type> classList = q.ToList().ToList();

            foreach (Type t in classList)
            {
                treeView1.Nodes.Add(t.Name);
                reflectedTypes.Add(t);
            }

            nspace = "SimplexResources.Rooms";
            q = from t in Assembly.GetExecutingAssembly().GetTypes()
                where t.IsClass && t.Namespace == nspace
                select t;
            classList = q.ToList().ToList();

            foreach (Type t in classList)
            {
                treeView2.Nodes.Add(t.Name);
                reflectedTypes.Add(t);
            }

            activeRoom = null;
            drawTest1.InitializeNodes(treeView1.Nodes);
        }

        private void menuStrip1_ItemClicked(object sender, ToolStripItemClickedEventArgs e)
        {

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
            drawTest1.SaveGame(Path.Combine(Environment.CurrentDirectory, @"Data/" + activeRoom.Text));
        }

        private void checkBox1_CheckedChanged(object sender, EventArgs e)
        {
            drawTest1.ToggleGrid(checkBox1.Checked);
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
            if (e.Button == MouseButtons.Left)
            {
                drawTest1.GameClicked(e, MouseButtons.Left);
            }
            else if (e.Button == MouseButtons.Right)
            {
                drawTest1.GameClicked(e, MouseButtons.Right);
            }
        }

        private void loadToolStripMenuItem_Click(object sender, EventArgs e)
        {
            // load last game
            drawTest1.LoadGame(Path.Combine(Environment.CurrentDirectory, @"Data/" + activeRoom.Text));
        }

        private void listBox1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void numericUpDown1_ValueChanged(object sender, EventArgs e)
        {
            width = (int)numericUpDown1.Value;
        }

        private void numericUpDown2_ValueChanged(object sender, EventArgs e)
        {
            height = (int)numericUpDown2.Value;
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
                drawTest1.SaveGame(Path.Combine(Environment.CurrentDirectory, @"Data/" + activeRoom.Text));
            }

            activeRoom = treeView2.SelectedNode;

            if (File.Exists(Path.Combine(Environment.CurrentDirectory, @"Data/" + activeRoom.Text)))
            {
                drawTest1.LoadGame(Path.Combine(Environment.CurrentDirectory, @"Data/" + activeRoom.Text));
            }
            else
            {
                drawTest1.ClearAll();
            }
        }
    }
}
