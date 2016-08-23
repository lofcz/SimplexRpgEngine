using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace SimplexMainForm
{
    public partial class Achievements : Form
    {
        Form1 parentForm = null;

        public Achievements(Form1 parentForm)
        {
            InitializeComponent();
            this.parentForm = parentForm;
            comboType.SelectedIndex = 0;
        }

        private void button1_Click(object sender, EventArgs e)
        {
            listBox1.Items.Add(textCaption.Text);
            parentForm.achList.Add(new AchievementClass(textCaption.Text, textText.Text, Globalization.setID(), int.Parse(textIndex.Text), comboType.SelectedIndex));
            textCaption.Text = "";
            textText.Text = "";
            textIndex.Text = "0";
            comboType.SelectedIndex = 0;
        }

        private void listBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            foreach (AchievementClass a in parentForm.achList)
            {
                if (a.Caption == (string)listBox1.Items[listBox1.SelectedIndex])
                {
                    textCaption.Text = a.Caption;
                    textText.Text = a.Text;
                    textIndex.Text = a.imageIndex.ToString();
                    comboType.SelectedIndex = a.medalType;
                }
            }
        }
    }
}
