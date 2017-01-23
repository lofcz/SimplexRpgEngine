using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace SimplexItemEditor
{
    public partial class Form1 : Form
    {
        public string projectName = "";
        public List<GameObject> objects = new List<GameObject>();
        GameObject editedObject;

        public Form1()
        {
            InitializeComponent();
        }

        public void SetFormName(string name)
        {
            string str = name;
            int index = name.LastIndexOf('\\') + 1;
            str = str.Substring(index);

            this.Text = "Simplex Item designer v0.0PRE - " + str;
        }

        private void newProjectToolStripMenuItem_Click(object sender, EventArgs e)
        {
            ToolStripItem node = sender as ToolStripItem;
            string text = node.Text;

            if (text == "New project")
            {
                saveFileDialog1.ShowDialog();
            }
        }

        private void saveFileDialog1_FileOk(object sender, CancelEventArgs e)
        {
            projectName = saveFileDialog1.FileName;
            SetFormName(projectName);
        }

        private void addItemToolStripMenuItem_Click(object sender, EventArgs e)
        {
            ToolStripItem node = sender as ToolStripItem;
            string text = node.Text;

            if (text == "Add item")
            {
                string str = Microsoft.VisualBasic.Interaction.InputBox("Name of new item?", "", "Item");
                treeView1.BeginUpdate();
                treeView1.Nodes.Add(str);
                objects.Add(new GameObject(str));
                treeView1.EndUpdate();
            }
        }

        private void treeView1_Click(object sender, EventArgs e)
        {
  
        }

        public GameObject GetObjectFromName(string name)
        {
            GameObject toReturn = null;

            foreach (GameObject go in objects)
            {
                if (go.name == name)
                {
                    toReturn = go;
                    break;
                }
            }

            return toReturn;
        }

        private void treeView1_NodeMouseDoubleClick(object sender, TreeNodeMouseClickEventArgs e)
        {
            editedObject = GetObjectFromName(e.Node.Text);
          
            EditForm eForm = new EditForm(e.Node.Text, editedObject);
            eForm.Show();
        }
    }
}
