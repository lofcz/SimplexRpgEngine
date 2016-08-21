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
using System.Xml;
using System.Xml.Linq;

namespace SimplexMainForm
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void loadProjectToolStripMenuItem_Click(object sender, EventArgs e)
        {
            TreeNode r = new TreeNode("Objects", 1, 1);

            var xDoc = XDocument.Load(@"C:\Users\Matěj\Documents\SimplexRpgEngine\DragonRise3\Engine source\DragonRise3.project.gmx");
            LoadTree(xDoc.Root.Element("objects"), r, "object", @"objects\");
            treeView1.Nodes.Add(r);
          
        }


        // Loads resource tree from GMS project
        void LoadTree(XElement root, TreeNode rootNode, string datafile, string datafileEnd)
        {
            foreach (var e in root.Elements().Where(e => e.Attribute("name") != null))
            {
                var node = new TreeNode(e.Attribute("name").Value, 1, 1);
                rootNode.Nodes.Add(node);

                foreach (var k in e.Elements().Where(k => k.Value != null && k.Name == datafile))
                {
                    var node2 = new TreeNode(k.Value);
                    string n = Convert.ToString(node2);
                    n = n.Replace(datafileEnd, "");
                    n = n.Replace(@"TreeNode: ", "");
                    rootNode.Nodes[node.Index].Nodes.Add(n);
                }

                LoadTree(e, node, datafile, datafileEnd);
            }
        }

        private void treeView1_DoubleClick(object sender, EventArgs e)
        {
            var menuItem = treeView1.SelectedNode;

            if (menuItem != null)
            {
                string name = menuItem.ToString();
                name = name.Replace("TreeNode: ", "");
                string file = getFilePath(name);

                Object o = new Object(file);
                o.Text = "Object - " + name;
                o.Show();
            }
        }

        public string getFilePath(string name)
        {
            string output = "";

            string[] filePaths = Directory.GetFiles(@"C:\Users\Matěj\Documents\SimplexRpgEngine\DragonRise3\Engine source\objects");

            for (int i = 0; i < filePaths.Length; i++)
            {
                if (filePaths[i].EndsWith(name + ".object.gmx"))
                {
                    output = filePaths[i];
                    break;
                }
            }

            return output;
        }
    }
}
