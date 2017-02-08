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
        List<SimplexEvent> codeList = new List<SimplexEvent>();
        public List<CodeEditor> openEventsList = new List<CodeEditor>();
        public string[] eventNames = { "Create", "Destroy", "Draw" };
        
        public GameObject go;

        public Object(string fileName, GameObject go)
        {
            InitializeComponent();
            this.go = go;
            file = fileName;
            string eventType = "";
            ListViewItem lastItem = null;

            XmlReader xr = XmlReader.Create(file);
            while(xr.Read())
            {
                if (xr.NodeType == XmlNodeType.Element && xr.Name == "event")
                {
                    if (xr.GetAttribute(0) == "0" && xr.GetAttribute(1) == "0")
                    {
                        lastItem = listView1.Items.Add("Create", 0);
                        eventType = "Create";
                    }
                }

                if (xr.NodeType == XmlNodeType.Element && xr.Name == "event")
                {
                    if (xr.GetAttribute(0) == "8" && xr.GetAttribute(1) == "0")
                    {
                        lastItem = listView1.Items.Add("Draw", 1);
                        eventType = "Draw";
                    }
                }

                if (xr.NodeType == XmlNodeType.Element && xr.Name == "event")
                {
                    if (xr.GetAttribute(0) == "1" && xr.GetAttribute(1) == "0")
                    {
                        lastItem = listView1.Items.Add("Destroy", 2);
                        eventType = "Destroy";
                    }
                }

                if (xr.NodeType == XmlNodeType.Element && xr.Name == "string")
                {
                    xr.Read();
                    SimplexEvent  item = new SimplexEvent(eventType, xr.Value);
                    codeList.Add(item);
                    string firstLine = item.code.Split(new[] { '\r', '\n' }).FirstOrDefault();
                    if (firstLine.StartsWith("///"))
                    {
                      //  lastItem.Text += " - (" + firstLine.Substring(4) + ")";
                    }
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

                foreach (string s in eventNames)
                {
                    handleEvent(what, s);
                }
            }
        }

        bool formInList(string formName)
        {
            if (openEventsList.Where(i => i.type == formName).FirstOrDefault() != null)
            {
                return true;
            }

            return false;
        }

        public void handleEvent(string w, string eventName)
        {
            if (w.StartsWith(eventName))
            {
                if (!formInList(eventName))
                {
                    CodeEditor ce = new CodeEditor(codeList.Where(i => i.eventType == eventName).FirstOrDefault().code, this, eventName);
                    openEventsList.Add(ce);
                    ce.Show();
                }
                else
                {
                    CodeEditor ce = openEventsList.Where(i => i.type == eventName).FirstOrDefault();
                    ce.Focus();
                }

            }
        }
    }
}
