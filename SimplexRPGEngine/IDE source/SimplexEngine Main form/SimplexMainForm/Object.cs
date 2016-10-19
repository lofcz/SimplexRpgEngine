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

        public Object(string fileName)
        {
            InitializeComponent();
            this.TopMost = true;
            file = fileName;

            XmlReader xr = XmlReader.Create(file);
            while(xr.Read())
            {
                if (xr.NodeType == XmlNodeType.Element && xr.Name == "event")
                {
                    if (xr.GetAttribute(0) == "0" && xr.GetAttribute(1) == "0")
                    {
                        comboBox1.Items.Add("Create");
                    }
                }

                if (xr.NodeType == XmlNodeType.Element && xr.Name == "string")
                {
                    xr.Read();
                    codeList.Add(xr.Value);
                }
            }
        }

        private void Object_Load(object sender, EventArgs e)
        {
            
        }

        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if ((string)comboBox1.Items[comboBox1.SelectedIndex] == "Create")
            {
                CodeEditor ce = new CodeEditor(codeList[comboBox1.SelectedIndex]);
                ce.Show();
            }
        }

        private void textBox2_TextChanged(object sender, EventArgs e)
        {

        }
    }
}
