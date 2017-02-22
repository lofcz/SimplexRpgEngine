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

namespace CutsceneGenerator
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();

            Color myColor = Color.FromArgb(5, Color.Black);
            label1.ForeColor = myColor;
        }

        XmlTextWriter xw;

        private void Form1_DragDrop(object sender, DragEventArgs e)
        {
            string[] fileList = (string[])e.Data.GetData(DataFormats.FileDrop, false);
            string filePath = fileList[0];

            StreamReader sr = new StreamReader(filePath);
            string line;
            while((line = sr.ReadLine()) != null)
            {
                textBox1.Text += line + "\r\n";
            }
            string tempName = textBox1.Lines[0];
            tempName = tempName.Replace("[TITLE]", "");
            string noSuffix = tempName;
            tempName = tempName + ".timeline.gmx";
            tempName = tempName.Replace(" ", "");

            xw = new XmlTextWriter(@"C:\Users\Matěj\Documents\simplex\SimplexRPGEngine\Engine source\timelines" + tempName, Encoding.UTF8);
            xw.Formatting = Formatting.Indented;
            xw.WriteStartElement("timeline");
            getOutput();
            xw.WriteEndElement();

            xw.Close();
            sr.Close();
            List<string> stringList = new List<string>();

            StreamReader fr = new StreamReader(@"C:\Users\Matěj\Documents\simplex\SimplexRPGEngine\Engine source\DragonRise3.project.gmx");
            while ((line = fr.ReadLine()) != null)
            {
                textBox2.Text += line + "\r\n";
                stringList.Add(line);
            }
            fr.Close();

            int i = 0;
            int finalI = 0;
            foreach(string ln in stringList)
            {

                if (ln.Contains("</timelines>"))
                {
                    // MessageBox.Show(ln);
                    finalI = (i - 1);
                    break;
                }
                i++;
            }

            stringList.Insert(finalI, @"<timeline>timelines\" + noSuffix + "</timeline>");  
              

            StreamWriter sf = new StreamWriter(@"C:\Users\Matěj\Documents\simplex\SimplexRPGEngine\Engine source\DragonRise3.project.gmx");
            foreach(string l in stringList)
            {
                sf.WriteLine(l);
            }
            sf.Close();

            MessageBox.Show("Úspěšně dokončeno. GMS nyní problikne a zpracuje nové soubory.");

        }

        private void Form1_DragEnter(object sender, DragEventArgs e)
        {
            if (e.Data.GetDataPresent(DataFormats.FileDrop)) e.Effect = DragDropEffects.Copy;
        }

        void getOutput()
        {
            string cutsceneName = "NewCutscene";
            int step = 0;

            foreach(string line in textBox1.Lines)
            {
                string tempLine = line;

                // Metatag - Title
                if (tempLine.StartsWith("[TITLE]"))
                {
                    tempLine = tempLine.Replace("[TITLE]", "");
                    cutsceneName = tempLine;
                }
                else if (tempLine.StartsWith("CP:"))
                {
                    tempLine = tempLine.Replace("CP:", "");
                    int x = 0;
                    int y = 0;
                    int spd = 0;

                    string[] attrs = tempLine.Split(',');
                    x = Convert.ToInt32(attrs[0]);
                    y = Convert.ToInt32(attrs[1]);
                    spd = Convert.ToInt32(attrs[2]);
                   
                    string code = "/// Step: " + step.ToString();
                    code = code + "\n\nscrCutsceneMoveTowardsPoint(self, " + x.ToString() + ", " + y.ToString() + ", " + spd.ToString() +");";
                    addEntry(step, code);
                    step += (32 / spd);
                }
            }
        }

        void addEntry(int step, string code)
        {
            xw.WriteStartElement("entry");
            writeSingle(xw, "step", step.ToString());
            xw.WriteStartElement("event");
            xw.WriteStartElement("action");
            writeSingle(xw, "libid", "1");
            writeSingle(xw, "id", "603");
            writeSingle(xw, "kind", "7");
            writeSingle(xw, "userelative", "0");
            writeSingle(xw, "isquestion", "0");
            writeSingle(xw, "useapplyto", "-1");
            writeSingle(xw, "functionname", " ");
            writeSingle(xw, "codestring", " ");
            writeSingle(xw, "whoName", "self");
            writeSingle(xw, "relative", "0");
            writeSingle(xw, "isnot", "0");

            xw.WriteStartElement("arguments");
            xw.WriteStartElement("argument");
            writeSingle(xw, "kind", "1");
            writeSingle(xw, "string", code);
            xw.WriteEndElement();
            xw.WriteEndElement();

            xw.WriteEndElement();
            xw.WriteEndElement();
            xw.WriteEndElement();
        }

        static void writeSingle(XmlTextWriter xw, string name, string value)
        {
            xw.WriteStartElement(name);
            xw.WriteString(value);
            xw.WriteEndElement();
        }

        private void label2_Click(object sender, EventArgs e)
        {

        }
    }
}
