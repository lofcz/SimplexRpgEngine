using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Diagnostics;
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

        IDictionary<string, int> dict = new Dictionary<string, int>();
        public List<AchievementClass> achList = new List<AchievementClass>();

        private void loadProjectToolStripMenuItem_Click(object sender, EventArgs e)
        {
            TreeNode r = new TreeNode("Objects", 1, 1);
            TreeNode spr = new TreeNode("Sprites", 1, 1);

            var xDoc = XDocument.Load(@"C:\Users\Matěj\Documents\SimplexRpgEngine\DragonRise3\Engine source\DragonRise3.project.gmx");
            LoadTree(xDoc.Root.Element("sprites"), spr, "sprite", @"sprites\", "sprite");
            tempLoad(xDoc.Root.Element("sprites"), spr, "sprite", @"sprites\");
         //   assignSprites();
            treeView1.Nodes.Add(spr);

            LoadTree(xDoc.Root.Element("objects"), r, "object", @"objects\", "object");
            treeView1.Nodes.Add(r);
          
        }


        // Loads resource tree from GMS project
        void LoadTree(XElement root, TreeNode rootNode, string datafile, string datafileEnd, string type)
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
                    n = n.Replace(@"sprites\", "");
                    node2.Name = n;

                    if (type == "sprite")
                    {
                        string file = getFilePath(n, "sprite");
                        int pos = 0;
                        int i = 0;
                        foreach (char znak in file)
                        {
                            if (znak == '\\') { pos = i; }
                            i++;
                        }
                        string filePathCore = file.Substring(0, pos);

                        try
                        {
                            XmlReader xr = XmlReader.Create(file);
                            while (xr.Read())
                            {
                                if (xr.NodeType == XmlNodeType.Element && xr.Name == "frame")
                                {
                                    xr.Read();
                                    string imageFile = xr.Value;

                                    imageList1.Images.Add(FastImage(filePathCore + @"\" + imageFile));
                                    node2.ImageIndex = imageList1.Images.Count-1;
                                    node2.SelectedImageIndex = node2.ImageIndex;
                                    dict[n] = node2.ImageIndex;
                                    break;
                                }
                            }
                        }
                        catch { }
                    }
                    else if (type == "object")
                    {
                        try
                        {
                            string file = getFilePath(n, "object");
                            XmlReader xr = XmlReader.Create(file);
                            while (xr.Read())
                            {
                                if (xr.NodeType == XmlNodeType.Element && xr.Name == "spriteName")
                                {
                                    xr.Read();
                                    string spriteName = xr.Value;
                                    int index = dict.FirstOrDefault(x => x.Key == spriteName).Value;


                                    node2.ImageIndex = index;
                                    node2.SelectedImageIndex = node2.ImageIndex;
                                    break;
                                }
                            }
                        }
                        catch { }
                    }

                    rootNode.Nodes[node.Index].Nodes.Add(node2);
                    rootNode.Nodes[node.Index].Nodes[node2.Index].Text = n;
                }

                LoadTree(e, node, datafile, datafileEnd, type);
            }
        }

        public Image FastImage(string path) { using (MemoryStream ms = new MemoryStream(File.ReadAllBytes(path))) return Image.FromStream(ms, false, false); }

        void tempLoad(XElement root, TreeNode rootNode, string datafile, string datafileEnd)
        {
            foreach (var k in root.Elements().Where(k => k.Value != null && k.Name == datafile))
            {
                var node2 = new TreeNode(k.Value);
                string n = Convert.ToString(node2);
                n = n.Replace(datafileEnd, "");
                n = n.Replace(@"TreeNode: ", "");
                rootNode.Nodes.Add(n);
            }
        }

        private void treeView1_DoubleClick(object sender, EventArgs e)
        {
            var menuItem = treeView1.SelectedNode;

            // Get root node
            TreeNode rootNode = treeView1.SelectedNode;
            while (rootNode.Parent != null)
            {
                rootNode = rootNode.Parent;
            }

            if (rootNode.ToString() == "TreeNode: Sprites")
            {
                // Open image in paint
                string file = getFilePath(menuItem.Name, "sprite");
                int pos = 0;
                int i = 0;
                foreach (char znak in file)
                {
                    if (znak == '\\') { pos = i; }
                    i++;
                }
                string filePathCore = file.Substring(0, pos);

                try
                {
                    XmlReader xr = XmlReader.Create(file);
                    while (xr.Read())
                    {
                        if (xr.NodeType == XmlNodeType.Element && xr.Name == "frame")
                        {
                            xr.Read();
                            string imageFile = xr.Value;

                            string final = filePathCore + @"\" + imageFile;
                            Process.Start(final);
                            break;
                        }
                    }
                }
                catch { }
            }
            else if (menuItem != null)
            {
                string name = menuItem.ToString();
                name = name.Replace("TreeNode: ", "");
                string file = getFilePath(name, "object");

                Object o = new Object(file);
                o.Text = "Object - " + name;
                o.Show();
            }
        }

        void assignSprites()
        {
            int i = 0;
            foreach(TreeNode tn in treeView1.Nodes)
            {
                if (i == 0) { continue; }

                string name = tn.ToString();
                MessageBox.Show(name);
                name = name.Replace("TreeNode: ", "");
                string file = getFilePath(name, "sprite");
                XmlReader xr = XmlReader.Create(file);
                while(xr.Read())
                {
                    if (xr.NodeType == XmlNodeType.Element && xr.Name == "frame")
                    {
                        xr.Read();
                        string imageFile = xr.Value;
                        imageList1.Images.Add(Image.FromFile(imageFile));
                        tn.ImageIndex = imageList1.Images.Count;
                        MessageBox.Show("");
                        break;
                    }
                }

                i++;
            }
        }

        public string getFilePath(string name, string rName)
        {
            string output = "";
            string[] filePaths = null;

              filePaths = Directory.GetFiles(@"C:\Users\Matěj\Documents\SimplexRpgEngine\DragonRise3\Engine source\" + rName + "s");

            for (int i = 0; i < filePaths.Length; i++)
            {
                if (filePaths[i].EndsWith(name + "." + rName +".gmx"))
                {
                    output = filePaths[i];
                    break;
                }
            }

            return output;
        }

        private void manageAchievementsToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Achievements aForm = new Achievements(this);
            aForm.Show();
        }
    }
}
