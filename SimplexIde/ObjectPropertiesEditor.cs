using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using DarkUI.Controls;
using DarkUI.Docking;

namespace SimplexIde
{
    public partial class ObjectPropertiesEditor : DarkToolWindow
    {
        public DarkTreeNode editingNode = null;

        public ObjectPropertiesEditor()
        {
            InitializeComponent();
        }

        private void ObjectPropertiesEditor_Load(object sender, EventArgs e)
        {
            // First we need SimplexProjectEntry

            darkTextBox1.Text = editingNode?.Text;
        }

        private void DarkButton5_Click(object sender, EventArgs e)
        {
            if (colorDialog1.ShowDialog() == DialogResult.OK)
            {

            }
        }
    }
}
