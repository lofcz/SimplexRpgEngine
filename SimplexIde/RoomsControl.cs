using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Data;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using DarkUI.Controls;
using DarkUI.Docking;

namespace SimplexIde
{
    public partial class RoomsControl : DarkToolWindow
    {
        public DarkTreeView dtv = null;
        public Form1 form1;
        public DrawTest drawTest1;

        public RoomsControl()
        {
            InitializeComponent();

            dtv = darkTreeView1;

            DarkTreeNode dtn = new DarkTreeNode("Rooms");
            dtn.Icon = (Bitmap)Properties.Resources.ResourceManager.GetObject("Folder_16x");
            darkTreeView1.Nodes.Add(dtn);
        }

        private void RoomsControl_Load(object sender, EventArgs e)
        {

        }

        private void darkTreeView1_Click(object sender, EventArgs e)
        {

        }

        private void darkTreeView1_SelectedNodesChanged(object sender, EventArgs e)
        {

        }

        private void darkTreeView1_DoubleClick(object sender, EventArgs e)
        {
            var k = darkTreeView1.SelectedNodes.Count;

            if (k > 0)
            {
                if (Form1.activeRoom != null)
                {
                    drawTest1.SaveGame(Path.Combine(Environment.CurrentDirectory, @"Data/" + Form1.activeRoom.Text));
                }

                Form1.activeRoom = dtv.SelectedNodes[0];

                if (File.Exists(Path.Combine(Environment.CurrentDirectory, @"Data/" + Form1.activeRoom.Text)))
                {
                    drawTest1.LoadGame(Path.Combine(Environment.CurrentDirectory, @"Data/" + Form1.activeRoom.Text));
                }
                else
                {
                    drawTest1.ClearAll();
                }
            }
        }
    }
}
