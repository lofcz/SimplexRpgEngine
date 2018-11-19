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
using System.Reflection;
using SimplexCore;

namespace SimplexIde
{

    public partial class Form1 : Form
    {
        Type selectedObject = null;

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
            }

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
            drawTest1.GameClicked(e);
        }

        private void saveToolStripMenuItem_Click(object sender, EventArgs e)
        {
            drawTest1.SaveGame(Path.Combine(Environment.CurrentDirectory, @"Data/save1.sav"));
        }

        private void checkBox1_CheckedChanged(object sender, EventArgs e)
        {
            drawTest1.ToggleGrid(checkBox1.Checked);
        }

        private void drawTest1_MouseMove(object sender, MouseEventArgs e)
        {
            if (e.Button == MouseButtons.Left)
            {
                drawTest1.GameClicked(e);
            }
        }

        private void drawTest1_Click_1(object sender, EventArgs e)
        {

        }
    }
}
