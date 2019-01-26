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
using DarkUI.Forms;
using Newtonsoft.Json;
using SimplexCore;
using SimplexIde.Properties;

namespace SimplexIde
{
    public partial class ToolWindow : DarkToolWindow
    {
        public DarkTreeView dtv = null;
        public DrawTest main = null;
        private DarkTreeNode lastNode = null;
        public Form1 form1 = null;

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
            if (dtv.SelectedNodes.Count > 0)
            {
                string editorPath = dtv.SelectedNodes[0].FullPath;
                string currentFolder = Directory.GetParent(Environment.CurrentDirectory).Parent.Parent.FullName +
                                       @"\SimplexCore\Prefabs\PrefabObject.cs";

                // get prefab class
                string[] prefabText = File.ReadAllLines(currentFolder);

                string className = Sgml.get_string("", "Object name");

                // generate actual class
                currentFolder = Directory.GetParent(Environment.CurrentDirectory).Parent.Parent.FullName +
                                @"\SimplexResources\Objects\" + className + ".cs";

                using (StreamWriter sw = new StreamWriter(currentFolder))
                {
                    foreach (string line in prefabText)
                    {
                        string ll = line;
                        ll = ll.Replace("{editorPath}", editorPath.Replace("\\", "/"));
                        ll = ll.Replace("PrefabObject", className);
                        ll = ll.Replace("SimplexCore.Prefabs", "SimplexResources.Objects");
                        sw.WriteLine(ll);
                    }

                    sw.Close();
                }

                // add new object
                // 1) locate projitems
                currentFolder = Directory.GetParent(Environment.CurrentDirectory).Parent.Parent.FullName +
                                @"\SimplexResources\SimplexResources.projitems";

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

                // add new object to the sproject
                SimplexProjectItem spi = new SimplexProjectItem();
                spi.name = className;
                spi.path = editorPath;

                form1.currentProject.Objects.Add(spi);

                // finally save sproject
                string json = JsonConvert.SerializeObject(form1.currentProject, Formatting.Indented);
                File.WriteAllText(form1.currentProject.ProjectPath, json);

                DarkMessageBox.Show("Object was created, please restart the engine for changes to take effect.", "New object wizard");
            }
        }

        private void darkTreeView1_MouseClick(object sender, MouseEventArgs e)
        {
            if (darkTreeView1.SelectedNodes.Count > 0 && e.Button == MouseButtons.Right)
            {
                DarkTreeNode dtn = darkTreeView1.SelectedNodes[0];

                if (dtn.Icon != Resources.Folder_16x && (string)dtn.Tag != "folder")
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

            if (name != "")
            {
                string corePath = Path.GetFullPath(Path.Combine(form1.currentProject.RootPath + "/Data", ""));
                string[] paths = Directory.GetFiles(corePath);


                // Rename object in savefiles
                foreach (string s in paths)
                {
                    // update each file
                    string f = File.ReadAllText(s);
                    f = f.Replace(lastNode.Text, name);
                    File.WriteAllText(s, f);

                }


                // Also in the actual project
                string[] allfiles = Directory.GetFiles(form1.currentProject.RootPath, "*.cs", SearchOption.AllDirectories).Union(Directory.GetFiles(form1.currentProject.RootPath, "*.sproject")).Union(Directory.GetFiles(form1.currentProject.RootPath, "*.projitems")).ToArray();

                foreach (string f in allfiles)
                {
                    string text = File.ReadAllText(f);
                    text = text.Replace(lastNode.Text, name);
                    File.WriteAllText(f, text);
                }

                // Last step is to rename actual file
                allfiles = Directory.GetFiles(form1.currentProject.RootPath,  lastNode.Text + ".cs", SearchOption.AllDirectories);

                foreach (string f in allfiles)
                {
                    string k = f.Replace(lastNode.Text, name);
                    File.Move(f, k);
                }

                lastNode.Text = name;
            }
        }

        private void editCodeToolStripMenuItem_Click(object sender, EventArgs e)
        {
            // Launch new edit code window
            ScriptEditor se = new ScriptEditor();
            se.Text = "Code editor - " + lastNode.Text;

            if (File.Exists(Path.GetFullPath(form1.currentProject.RootPath + "/Objects/" + lastNode.Text + ".cs")))
            {
                se.scintilla.Text = File.ReadAllText(Path.GetFullPath(form1.currentProject.RootPath + "/Objects/" + lastNode.Text + ".cs"));
            }
            else
            {
                DarkMessageBox.Show("No code found for the object - class doesn't exist", "Simplex Engine");
            }

            se.Show();
        }

        private void darkContextMenu1_Opening(object sender, CancelEventArgs e)
        {

        }

        private void insertNewObjectToolStripMenuItem_Click(object sender, EventArgs e)
        {

        }
    }
}
