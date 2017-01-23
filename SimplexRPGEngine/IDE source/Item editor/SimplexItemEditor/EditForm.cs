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
    public partial class EditForm : Form
    {
        string formName = "Form";
        GameObject editObject;

        public EditForm(string formName, GameObject editObject)
        {
            InitializeComponent();
            this.formName = formName;
            Text = formName;
            this.editObject = editObject;

            textBox1.Text = formName;
            textBox2.Text = editObject.name;
            textBox3.Text = editObject.ID;
            textBox6.Text = editObject.materialIndex;
            richTextBox1.Text = editObject.description;
            richTextBox2.Text = editObject.footer;
            checkBox1.Checked = editObject.isStackable;
            checkBox2.Checked = editObject.wraptext;
            textBox4.Text = editObject.durability;
            textBox5.Text = editObject.durabilityMax;
            pictureBox1.Image = editObject.idleImage;
            pictureBox2.Image = editObject.pickImage;
            comboBox1.SelectedIndex = editObject.rarityDefault;
        }

        private void EditForm_Load(object sender, EventArgs e)
        {

        }

        private void label14_Click(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            // Save entire shit
            editObject.name = formName;
            editObject.ID = textBox3.Text;
            editObject.materialIndex = textBox6.Text;
            editObject.description = richTextBox1.Text;
            editObject.footer = richTextBox2.Text;
            editObject.isStackable = checkBox1.Checked;
            editObject.wraptext = checkBox2.Checked;
            editObject.durability = textBox4.Text;
            editObject.durabilityMax = textBox5.Text;
            editObject.idleImage = pictureBox1.Image;
            editObject.pickImage = pictureBox2.Image;
            editObject.rarityDefault = comboBox1.SelectedIndex;
        }
    }
}
