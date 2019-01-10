using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Data;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Xml.Linq;
using DarkUI.Controls;
using DarkUI.Docking;
using SimplexCore;
using SimplexIde.Properties;

namespace SimplexIde
{
    public partial class ToolWindow : DarkToolWindow
    {
        public DarkTreeView dtv = null;
        public DrawTest main = null;
        private DarkTreeNode lastNode = null;

        public ToolWindow()
        {
            InitializeComponent();

            DarkTreeNode dtn = new DarkTreeNode("Objects");
            dtn.Icon = (Bitmap)Resources.ResourceManager.GetObject("Folder_16x");
            dtn.IsRoot = true;
            dtv = darkTreeView1;
            darkTreeView1.Nodes.Add(dtn);

        }

        private void backgroundWorker1_DoWork(object sender, DoWorkEventArgs e)
        {
           
        }

        private void ToolWindow_Load(object sender, EventArgs e)
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
                main.SelectedObject = Type.GetType("SimplexResources.Objects." + dtn.Text);
            }

            
        }

        private void toolStripButton1_Click(object sender, EventArgs e)
        {
            string editorPath = "Actors";
            string currentFolder = Directory.GetParent(Environment.CurrentDirectory).Parent.Parent.FullName + @"\SimplexCore\Prefabs\PrefabObject.cs";

            // get prefab class
            string[] prefabText = File.ReadAllLines(currentFolder);

            string className = Sgml.get_string("", "Object name");

            // generate actual class
            currentFolder = Directory.GetParent(Environment.CurrentDirectory).Parent.Parent.FullName + @"\SimplexResources\Objects\" + className + ".cs";

            using (StreamWriter sw = new StreamWriter(currentFolder))
            {
                foreach (string line in prefabText)
                {
                    string ll = line;
                    ll = ll.Replace("{editorPath}", editorPath);
                    ll = ll.Replace("PrefabObject", className);
                    ll = ll.Replace("SimplexCore.Prefabs", "SimplexResources.Objects");
                    sw.WriteLine(ll);
                }

                sw.Close();
            }

            // add new object
            // 1) locate projitems
            currentFolder = Directory.GetParent(Environment.CurrentDirectory).Parent.Parent.FullName + @"\SimplexResources\SimplexResources.projitems";

            XDocument doc = XDocument.Load(currentFolder);
            XElement root = new XElement("Compile");
            root.Add(new XAttribute("Include", @"$(MSBuildThisFileDirectory)Objects\" + className + ".cs"));

            var v = doc.Root.Nodes().ToList();

            foreach (XElement xx in v)
            {
                if (xx.Name.LocalName == "ItemGroup")
                {
                    // good boi we can write here
                    xx.Add(root);
                    break; // prevent from adding to each root
                }
            }

            doc.Save(currentFolder);
        }

        private void darkTreeView1_MouseClick(object sender, MouseEventArgs e)
        {
            if (darkTreeView1.SelectedNodes.Count > 0 && e.Button == MouseButtons.Right)
            {
                DarkTreeNode dtn = darkTreeView1.SelectedNodes[0];

                if (dtn.Icon != Resources.Folder_16x)
                {
                    darkContextMenu1.Show(Cursor.Position);
                    lastNode = dtn;
                }
            }
        }

        private void renameToolStripMenuItem_Click(object sender, EventArgs e)
        {
            // Rename object !
            string name = Sgml.get_string("", "New name");

            /*
               1) Rename object in savefiles 

             */

            string corePath = Path.GetFullPath(Path.Combine("../../bin/Debug/Data/", ""));
            string[] paths = Directory.GetFiles(corePath);


            foreach (string s in paths)
            {
                // update each file
                string f = File.ReadAllText(s);
                f = f.Replace(lastNode.Text, name);
                File.WriteAllText(s, f);
                lastNode.Text = name;
            }
        }
    }
}
