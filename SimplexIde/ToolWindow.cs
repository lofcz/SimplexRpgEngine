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
            string className = Sgml.get_string("", "Object name");

            // generate actual class
            string currentFolder = Directory.GetParent(Environment.CurrentDirectory).Parent.Parent.FullName + @"\SimplexResources\Objects\" + className + ".cs";

            using (StreamWriter sw = new StreamWriter(currentFolder))
            {
                sw.WriteLine("using System;\nusing System.Collections.Generic;\nusing System.Text;\nusing SimplexCore;\nusing static SimplexCore.Sgml;\n");
                sw.WriteLine("namespace SimplexResources.Objects\n{\n    public class "+ className + " : GameObject\n    {");
                sw.WriteLine("        public "+ className + "()\n        {\n            EditorPath = \"Actors\";\n        }\n    }\n}");
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
    }
}
