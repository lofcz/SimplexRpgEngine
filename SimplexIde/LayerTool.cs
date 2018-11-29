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
using Microsoft.Xna.Framework.Input;

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
            dtn.Tag = "folder";
            darkTreeView1.Nodes.Add(dtn);
            f.lt = this;
        }

        private void LayerTool_Load(object sender, EventArgs e)
        {

        }

        private void darkTreeView1_Click(object sender, EventArgs e)
        {

        }

        private void darkTreeView1_SelectedNodesChanged(object sender, EventArgs e)
        {

        }

        void realSelected(MouseEventArgs e)
        {
            if (darkTreeView1.SelectedNodes.Count > 0 && e.Button == MouseButtons.Right)
            {
                DarkTreeNode dtn = darkTreeView1.SelectedNodes[0];

                if (dtn.Tag != null && (string)dtn?.Tag != "folder")
                {
                    darkContextMenu1.Show(Cursor.Position);
                }
            }
        }

        private void darkContextMenu1_Closed(object sender, ToolStripDropDownClosedEventArgs e)
        {
            darkTreeView1.SelectedNodes.Clear();
        }

        private void darkTreeView1_MouseClick(object sender, MouseEventArgs e)
        {
            realSelected(e);
        }
    }
}
