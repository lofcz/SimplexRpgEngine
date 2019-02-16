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
using DarkUI.Collections;
using DarkUI.Controls;
using DarkUI.Docking;
using DarkUI.Forms;
using Microsoft.Xna.Framework.Graphics;
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
        private bool canShow = true;

        public ToolWindow()
        {
            InitializeComponent();
            dtv = darkTreeView1;

            SimplexIdeApi.TreeAddRootNode(dtv, "Sprites");
            SimplexIdeApi.TreeAddRootNode(dtv, "Sounds");
            SimplexIdeApi.TreeAddRootNode(dtv, "Tiles");
            SimplexIdeApi.TreeAddRootNode(dtv, "Paths");
            SimplexIdeApi.TreeAddRootNode(dtv, "Scripts");
            SimplexIdeApi.TreeAddRootNode(dtv, "Shaders");
            SimplexIdeApi.TreeAddRootNode(dtv, "Fonts");
            SimplexIdeApi.TreeAddRootNode(dtv, "Time Lines");
            SimplexIdeApi.TreeAddRootNode(dtv, "Objects");
            SimplexIdeApi.TreeAddRootNode(dtv, "Included Files");
            SimplexIdeApi.TreeAddRootNode(dtv, "Extensions");

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

                if (dtn.Icon != Resources.Folder_16x)
                {
                    if ((string) dtn.Tag == "folder")
                    {
                        darkContextMenu2.Show(Cursor.Position);
                    }
                    else
                    {
                        if (canShow)
                        {
                            darkContextMenu1.Show(Cursor.Position);
                            canShow = false;
                        }
                        else
                        {
                            canShow = true;
                        }
                    }

                    lastNode = dtn;
                }
            }

            if (e.Button == MouseButtons.Left)
            {
                canShow = true;
            }
        }

        private void renameToolStripMenuItem_Click(object sender, EventArgs e)
        {
            canShow = true;

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
            canShow = true;

            if (form1.currentProject != null && File.Exists(Path.GetFullPath(form1.currentProject.RootPath + "/Objects/" + lastNode.Text + ".cs")))
            {
                // Launch new edit code window
                ScriptEditor se = new ScriptEditor();
                se.DockText = "Code editor - " + lastNode.Text;
                se.scintilla.Text = File.ReadAllText(Path.GetFullPath(form1.currentProject.RootPath + "/Objects/" + lastNode.Text + ".cs"));
                form1.darkDockPanel1.AddContent(se);
            }
            else
            {
                DarkMessageBox.Show("No code found for the object - class doesn't exist", "Simplex Engine");
            }


        }

        private void darkContextMenu1_Opening(object sender, CancelEventArgs e)
        {

        }

        private void insertNewObjectToolStripMenuItem_Click(object sender, EventArgs e)
        {
            canShow = true;
        }

        private void InsertFolderToolStripMenuItem_Click(object sender, EventArgs e)
        {
            // insert new folder
            canShow = true;

        }

        private void DarkTreeView1_DragDrop(object sender, DragEventArgs e)
        {
            
        }

        List<SimplexProjectItem> objects = new List<SimplexProjectItem>();
        private void DarkTreeView1_AfterNodeDragged(object sender, EventArgs e)
        {
            SerializeSaveObjects();
        }

        void SerializeSaveObjects()
        {
            // node was dragged      
            objects.Clear();

            foreach (DarkTreeNode dtn in darkTreeView1.Nodes)
            {
                rec(dtn);
            }

            // objects are ready
            form1.currentProject.Objects = objects;

            string json = JsonConvert.SerializeObject(form1.currentProject, Formatting.Indented);
            File.WriteAllText(form1.currentProject.ProjectPath, json);
        }

        void rec(DarkTreeNode dtn)
        {
            foreach (DarkTreeNode d in dtn.Nodes)
            {
                if (!d.IsFolder)
                {
                    SimplexProjectItem spi = new SimplexProjectItem();
                    spi.path = d.FullPath;
                    spi.name = d.Text;
                    spi.nameColor = d.Color;
                    spi.tag = d.SuffixText;
                    spi.tagColor = d.SuffixColor;

                    spi.path = spi.path.Replace("\\", "/");
                    spi.path = spi.path.Substring(0, spi.path.LastIndexOf("/"));
                    objects.Add(spi);                 
                }
                else
                {
                    rec(d);
                }
            }
        }

        private void DeleteToolStripMenuItem_Click(object sender, EventArgs e)
        {
            canShow = true;
        }

        private void ChangeColorToolStripMenuItem_Click(object sender, EventArgs e)
        {
            canShow = true;

            // change color
            if (colorDialog1.ShowDialog() == DialogResult.OK)
            {
                Color c = colorDialog1.Color;
                lastNode.Color = c;
            }
        }

        private void SetTagToolStripMenuItem_Click(object sender, EventArgs e)
        {
            canShow = true;

            string tag = Sgml.get_string("", "New tag", lastNode.SuffixText);
            lastNode.SuffixText = tag;
        }

        private void ChangeTagColorToolStripMenuItem_Click(object sender, EventArgs e)
        {
            canShow = true;

            // change color
            if (colorDialog1.ShowDialog() == DialogResult.OK)
            {
                Color c = colorDialog1.Color;
                lastNode.SuffixColor = c;
            }
        }

        private void EditPropertiesToolStripMenuItem_Click(object sender, EventArgs e)
        {
            // open properties editor
            ObjectPropertiesEditor ope = new ObjectPropertiesEditor();
            ope.DockText = "Object Properties - " + lastNode.Text;
            ope.editingNode = lastNode;
            form1.darkDockPanel1.AddContent(ope);              
        }

        private void DarkTreeView1_MouseDoubleClick(object sender, MouseEventArgs e)
        {
            // node double clicked
            if (darkTreeView1.SelectedNodes.Count > 0 && e.Button == MouseButtons.Left)
            {
                DarkTreeNode dtn = darkTreeView1.SelectedNodes[0];

                if (dtn.RootNodeName == "Sprites")
                {
                    // open sprites editor
                    Sprites_manager sm = new Sprites_manager();
                    sm.DockText = "Sprites Editor - " + dtn.Text;
                    sm.owner = form1;

                    // find him a sprite
                    Texture2D s = form1.sr.drawTest1.Sprites.FirstOrDefault(x => x.Name == dtn.Text)?.Texture;

                    if (s != null)
                    {
                        sm.spritesEditorRenderer1.selectedImage = s;
                        sm.lastImage = Sgml.convert_to_bitmap(s, s.Width, s.Height);

                        sm.darkImageIndex1.Frames.Add(new ImageIndex() { });
                        sm.spritesEditorRenderer1.AddFrameFromTexture(s);

                    }

                    form1.darkDockPanel1.AddContent(sm);
                    sm.Invalidate();
                    sm.spritesEditorRenderer1.UpdatePreview(0);
                    // sm.darkDockPanel2.AssureMePlase();
                }

                if (dtn.RootNodeName == "Objects")
                {
                    // open sprites editor
                    Sgml.show_debug_message("Double clicked an object");
                }
            }

        }
    }
}
