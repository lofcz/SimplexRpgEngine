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
        public List<string> eventNames = new List<string> { "Create", "Destroy", "Draw", "Step", "Left pressed", "Draw begin" };
        public GameObject go;
        string eventType = "";
        ListViewItem lastItem = null;

        public Object(string fileName, GameObject go)
        {
            InitializeComponent();
            this.go = go;
            file = fileName;
         
           

            for (int i = 0; i < 15; i++)
            {
                eventNames.Add("Alarm " + i.ToString());
            }


            XmlReader xr = XmlReader.Create(file);
            while(xr.Read())
            {
                parseEvent(xr, "0", "0", "Create", 0);
                parseEvent(xr, "8", "0", "Draw", 1);
                parseEvent(xr, "8", "72", "Draw begin", 1);
                parseEvent(xr, "1", "0", "Destroy", 2);
                parseEvent(xr, "2", "-1", "Alarm", 3);
                parseEvent(xr, "3", "0", "Step", 4);
                parseEvent(xr, "6", "4", "Left pressed", 5);

                #region Instantiate SimplexEvent from parsed event
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
                #endregion
            }


            #region Swap order of Alarm events
            List<ListViewItem> listToSwap = new List<ListViewItem>();

            for (int i = 0; i < listView1.Items.Count; i++)
            {
                string str = listView1.Items[i].Text;

                if (str.StartsWith("Alarm"))
                {
                    listToSwap.Add(listView1.Items[i]);
                }
            }

            for (int i = 0; i < listToSwap.Count - 1; i++)
            {
                if (listToSwap.Count > 1)
                {
                    // Swap name
                    string str = listToSwap[i].Text;
                    string str2 = listToSwap[listToSwap.Count - 1].Text;
                    ListViewItem item = listToSwap[listToSwap.Count - 1];
                    ListViewItem item2 = listToSwap[i];

                    item2.Text = str2;
                    item.Text = str;
                    listToSwap.Remove(item);
                }
            }
            #endregion

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

        void parseEvent(XmlReader xr, string firstA, string secondA, string name, int iconIndex)
        {
            if (xr.NodeType == XmlNodeType.Element && xr.Name == "event")
            {
                if (xr.GetAttribute(0) == firstA && (xr.GetAttribute(1) == secondA || secondA == "-1"))
                {
                    if (secondA != "-1")
                    {
                        lastItem = listView1.Items.Add(name, iconIndex);
                        eventType = name;
                    }
                    else
                    {
                        lastItem = listView1.Items.Add(name + " " + xr.GetAttribute(1), 3);
                        eventType = name + " " + xr.GetAttribute(1);
                    }
                }
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
            if (w ==eventName)
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
