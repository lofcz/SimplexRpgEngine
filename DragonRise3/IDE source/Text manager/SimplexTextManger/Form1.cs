using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace SimplexTextManger
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void richTextBox1_TextChanged(object sender, EventArgs e)
        {
            // Render output
            string outputText = "";
            Color c = Color.Black;
            int i = 0;
            bool end = false;

            foreach(char znak in richTextBox1.Text)
            {
                richTextBox1.Select(i, 1);
                Color nc = richTextBox1.SelectionColor;
                if (znak == '#')
                {

                }
                else if (c != nc)
                {
                    c = nc;
                    end = !end;

                    if (end) { outputText += @""" + scrColorflag(c_" + getColorName(c) + @")" + " + " + @""""; }
                    else { outputText += @""" + scrEndColorflag() + " + @""""; }
                }

                outputText += znak;
                i++;
            }

            // Reset
            richTextBox1.SelectionLength = 0;
            richTextBox1.SelectionStart = richTextBox1.Text.Length;

            textBox1.Text = @"""" + outputText + @""";";
        }

        private void richTextBox1_MouseClick(object sender, MouseEventArgs e)
        {
            if (richTextBox1.SelectionLength > 0)
            {
                ColorDialog cd = new ColorDialog();
                cd.ShowDialog();
                Color c = cd.Color;

                richTextBox1.SelectionColor = c;
                richTextBox1.SelectionLength = 0;
                richTextBox1.SelectionStart = richTextBox1.TextLength;
            }
        }

        public string getColorName(Color c)
        {
            string o = "";
            if (c == Color.Red) { o = "red"; }

            return o;
        }

        private void button2_Click(object sender, EventArgs e)
        {
            int lineLenght = 64;
            int currentsLenght = 0;
            int i = 0;

            foreach(char znak in richTextBox1.Text)
            {
                if (currentsLenght >= lineLenght)
                {
                    int tempPos = i;
                    int tempChar = richTextBox1.Text[tempPos];

                     while (tempChar != ' ') { tempChar = richTextBox1.Text[tempPos]; tempPos--; }                                       
                     richTextBox1.Text = richTextBox1.Text.Insert(tempPos + 1, "#");
                     currentsLenght = 0;
                }

                string t = znak.ToString();
                currentsLenght += t.Length;
                i++;
            }
        }

        private void button1_Click(object sender, EventArgs e)
        {
            string o = "";
            int i = 0;
            foreach(string ln in textBox1.Lines)
            {
                if (i > 0) { o += "#"; }
                o += ln;
                i++;
            }
            Clipboard.SetText(o);
        }
    }
}
