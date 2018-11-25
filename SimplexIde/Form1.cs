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
using Microsoft.Xna.Framework;
using Microsoft.Xna.Framework.Input;
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
            Invalidate();
            drawTest1.cms = contextMenuStrip1;

            // load list of all defined objects
            string nspace = "SimplexResources.Objects";

            var q = from t in Assembly.GetExecutingAssembly().GetTypes()
                where t.IsClass && t.Namespace == nspace
                select t;
            List<Type> classList = q.ToList().ToList();

            foreach (Type t in classList)
            {
                using (GameObject o = (GameObject)Activator.CreateInstance(t))
                {
                    TreeNode tn = new TreeNode();
                    tn.Text = t.Name;
                    tn.SelectedImageIndex = 0;
                    tn.ImageIndex = 0;
                    tn.Name = t.Name;

                    if (string.IsNullOrEmpty(o.EditorPath))
                    {
                        treeView1.Nodes[0].Nodes.Add(t.Name);
                    }
                    else
                    {
                        string[] pathTokens = o.EditorPath.Split('/');
                        TreeNode currentNode = treeView1.Nodes[0];

                        foreach (string s in pathTokens)
                        {
                            if (!currentNode.Nodes.ContainsKey(s))
                            {
                                TreeNode folderNode = new TreeNode();
                                folderNode.Text = s;
                                folderNode.ImageIndex = 1;
                                folderNode.SelectedImageIndex = 1;
                                folderNode.Name = s;

                                currentNode.Nodes.Add(folderNode);
                                currentNode = folderNode;
                            }
                            else
                            {
                                currentNode = currentNode.Nodes.Find(s, false).FirstOrDefault();
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

            nspace = "SimplexResources.Rooms";
            q = from t in Assembly.GetExecutingAssembly().GetTypes()
                where t.IsClass && t.Namespace == nspace
                select t;
            classList = q.ToList().ToList();

            foreach (Type t in classList)
            {
                treeView2.Nodes[0].Nodes.Add(t.Name);
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
            if (activeRoom == null)
            {
                activeRoom = treeView2.TopNode;
            }
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

        private void drawTest1_OnMouseWheelDownwards(MouseEventArgs e)
        {
            drawTest1.WheelDown();
        }

        private void drawTest1_MouseUp(object sender, MouseEventArgs e)
        {
            drawTest1.ClickRelease();
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
            drawTest1.GridSize = new Vector2((int)numericUpDown5.Value, (int)numericUpDown6.Value);
        }

        private void numericUpDown6_ValueChanged(object sender, EventArgs e)
        {
            numericUpDown5_ValueChanged(sender, e);
        }
    }
}
