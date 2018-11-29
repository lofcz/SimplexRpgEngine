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
using SimplexIde.Properties;

namespace SimplexIde
{
    public partial class ToolWindow : DarkToolWindow
    {
        public DarkTreeView dtv = null;
        public ToolWindow()
        {
            InitializeComponent();

            DarkTreeNode dtn = new DarkTreeNode("Objects");
            dtn.Icon = (Bitmap)Resources.ResourceManager.GetObject("Folder_16x");
            dtn.IsRoot = true;
            dtv = darkTreeView1;
            darkTreeView1.Nodes.Add(dtn);

        }

        private void backgroundWorker1_DoWork(object sender, DoWorkEventArgs e)
        {
           
        }

        private void ToolWindow_Load(object sender, EventArgs e)
        {

        }

        private void darkTreeView1_Click(object sender, EventArgs e)
        {
           
        }
    }
}
