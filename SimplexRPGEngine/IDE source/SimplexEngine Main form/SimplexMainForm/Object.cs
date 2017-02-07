using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Xml;

namespace SimplexMainForm
{
    public partial class Object : Form
    {
        public string file;
        List<string> codeList = new List<string>();
        public GameObject go;

        public Object(string fileName, GameObject go)
        {
            InitializeComponent();
            this.go = go;
            file = fileName;

            XmlReader xr = XmlReader.Create(file);
            while(xr.Read())
            {
                if (xr.NodeType == XmlNodeType.Element && xr.Name == "event")
                {
                    if (xr.GetAttribute(0) == "0" && xr.GetAttribute(1) == "0")
                    {
                        listView1.Items.Add("Create", 0);
                    }
                }

                if (xr.NodeType == XmlNodeType.Element && xr.Name == "string")
                {
                    xr.Read();
                    codeList.Add(xr.Value);                
                }
            }

            textBox2.Text = go.sprite;
            textBox1.Text = go.name;
            checkBox3.Checked = go.solid;
            checkBox1.Checked = go.visible;
            textBox3.Text = go.depth.ToString();
            textBox4.Text = go.parent;
            textBox5.Text = go.mask;
            foreach (string s in go.childrens)
            {
                if (!listBox2.Items.Contains(s)) { listBox2.Items.Add(s); }
            }
        }

        private void Object_Load(object sender, EventArgs e)
        {
            
        }

        private void textBox2_TextChanged(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {

        }

        private void button7_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void checkBox1_CheckedChanged(object sender, EventArgs e)
        {

        }

        private void listView1_ItemSelectionChanged(object sender, ListViewItemSelectionChangedEventArgs e)
        {
            int id = e.ItemIndex;

            
        }

        private void listView1_DoubleClick(object sender, EventArgs e)
        {

        }

        private void listView1_MouseDoubleClick(object sender, MouseEventArgs e)
        {
            if (listView1.SelectedItems.Count == 1)
            {
                ListView.SelectedListViewItemCollection items = listView1.SelectedItems;

                ListViewItem lvItem = items[0];
                string what = lvItem.Text;

                CodeEditor ce = new CodeEditor(codeList[0]);
                ce.Show();
            }
        }
    }
}
