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
    public partial class LayerTool : DarkToolWindow
    {
        public DarkTreeView dtv = null;

        public LayerTool(DrawTest f)
        {         
            InitializeComponent();

            dtv = darkTreeView1;

            DarkTreeNode dtn = new DarkTreeNode("Layers");
            dtn.Icon = (Bitmap)Properties.Resources.ResourceManager.GetObject("Folder_16x");
            darkTreeView1.Nodes.Add(dtn);
            f.lt = this;
        }

        private void LayerTool_Load(object sender, EventArgs e)
        {

        }

        private void darkTreeView1_Click(object sender, EventArgs e)
        {

        }
    }
}
