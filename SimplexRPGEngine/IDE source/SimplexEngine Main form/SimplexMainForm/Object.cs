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
    public partial class Object : Form
    {
        public string file;
        List<SimplexEvent> codeList = new List<SimplexEvent>();
        public List<CodeEditor> openEventsList = new List<CodeEditor>();
        public GameObject go;
        string eventType = "";
        ListViewItem lastItem = null;
        Form1 parentForm;
        Font commonFont = new Font(FontFamily.GenericSerif, 10f);
        string a = "", b = "";

        public Object(string fileName, GameObject go, Form1 parentForm)
        {
            InitializeComponent();
            this.go = go;
            file = fileName;
            this.parentForm = parentForm;
            this.Owner = parentForm;
        


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
                parseEvent(xr, "4", "-2", "Collision", 6);
                parseEvent(xr, "7", "-3", "Event user", 7);

                #region Instantiate SimplexEvent from parsed event
                if (xr.NodeType == XmlNodeType.Element && xr.Name == "string")
                {
                    xr.Read();
                    SimplexEvent  item = new SimplexEvent(eventType, xr.Value, file,  @"<event eventtype=""0"" enumb=""0"">", a, b);
                    codeList.Add(item);
                    string firstLine = item.code.Split(new[] { '\r', '\n' }).FirstOrDefault();
                    if (firstLine.StartsWith("///"))
                    {
                      //  lastItem.Text += " - (" + firstLine.Substring(4) + ")";
                    }
                }
                #endregion
            }
            xr.Close();


            #region Swap order of Alarm & User events
            List<ListViewItem> listToSwap = new List<ListViewItem>();
            List<ListViewItem> listToSwap2 = new List<ListViewItem>();

            for (int i = 0; i < listView1.Items.Count; i++)
            {
                string str = listView1.Items[i].Text;

                if (str.StartsWith("Alarm"))
                {
                    listToSwap.Add(listView1.Items[i]);
                }
            }

            for (int i = 0; i < listView1.Items.Count; i++)
            {
                string str = listView1.Items[i].Text;

                if (str.StartsWith("Event user"))
                {
                    listToSwap2.Add(listView1.Items[i]);
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

            for (int i = 0; i < listToSwap2.Count - 1; i++)
            {
                if (listToSwap2.Count > 1)
                {
                    // Swap name
                    string str = listToSwap2[i].Text;
                    string str2 = listToSwap2[listToSwap2.Count - 1].Text;
                    ListViewItem item = listToSwap2[listToSwap2.Count - 1];
                    ListViewItem item2 = listToSwap2[i];

                    item2.Text = str2;
                    item.Text = str;
                    listToSwap2.Remove(item);
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
                if (xr.GetAttribute(0) == firstA && (xr.GetAttribute(1) == secondA || int.Parse(secondA) < 0))
                {
                    a = firstA;
                    b = secondA;

                    if (int.Parse(secondA) >= 0)
                    {
                        lastItem = listView1.Items.Add(name, iconIndex);
                        eventType = name;
                    }
                    else if (int.Parse(secondA) == -1)
                    {
                        lastItem = listView1.Items.Add(name + " " + xr.GetAttribute(1), 3);
                        eventType = name + " " + xr.GetAttribute(1);
                        b = xr.GetAttribute(1);
                    }
                    else if (int.Parse(secondA) == -2)
                    {
                        lastItem = listView1.Items.Add(xr.GetAttribute(1), 6);
                        eventType = xr.GetAttribute(1);
                        b = xr.GetAttribute(1);
                    }
                    else if (int.Parse(secondA) == -3)
                    {
                        lastItem = listView1.Items.Add(name + " " + (int.Parse(xr.GetAttribute(1)) - 10).ToString(), 7);
                        eventType = name + " " + (int.Parse(xr.GetAttribute(1)) - 10).ToString();
                        b = (int.Parse(xr.GetAttribute(1))).ToString();
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
            foreach (SimplexEvent se in codeList)
            {
                XmlDocument xdoc = new XmlDocument();
                xdoc.Load(se.filePath);

                foreach (XmlElement element in xdoc.SelectNodes("object/events/event"))
                {
                    if (element.Attributes[0].Value == se.attribute0 && element.Attributes[1].Value == se.attribute1)
                    {
                        XmlNodeList nl = xdoc.SelectNodes("object/events/event/action/arguments/argument/string");
                        XmlNode targetNode = null;

                        foreach (XmlNode node in nl)
                        {
                            if (node.ParentNode.ParentNode.ParentNode.ParentNode == element) { targetNode = node; }

                        }

                        targetNode.InnerText = se.code;
                    }
                }
                xdoc.Save(se.filePath);
            }

            parentForm.formsOpen.Remove(this);
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

                foreach (SimplexEvent se in codeList)
                {
                    string s = se.eventType;
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
           // MessageBox.Show(eventName);
            if (w == eventName)
            {
                if (!formInList(eventName))
                {
                    CodeEditor ce = new CodeEditor(codeList.Where(i => i.eventType == eventName).FirstOrDefault().code, this, eventName, codeList.Where(i => i.eventType == eventName).FirstOrDefault());
                    ce.Text = "Code editor - " + Text.Substring(Text.LastIndexOf(' ')) + ", " + eventName;
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

        private void timer1_Tick(object sender, EventArgs e)
        {
            this.Invalidate();
            timer1.Interval = 1;
        }

        private void Object_Paint(object sender, PaintEventArgs e)
        { 
            /*
            int j = 0;
            foreach(ListViewItem i in listView1.Items)
            {
                e.Graphics.DrawString("test", commonFont, Brushes.Black, new Point(this.Location.X , this.Location.Y  + (j * 32)));
                j++;
                MessageBox.Show(j.ToString());
            }*/
        }
    }
}
