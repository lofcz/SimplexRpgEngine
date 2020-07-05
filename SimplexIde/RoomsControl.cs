using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Data;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using DarkUI.Controls;
using DarkUI.Docking;
using DarkUI.Forms;
using SimplexCore;

namespace SimplexIde
{
    public partial class RoomsControl : DarkToolWindow
    {
        public DarkTreeView dtv = null;
        public Form1 form1;
        public DrawTest drawTest1;
        public bool execute = true;
        public RoomsControl()
        {
            InitializeComponent();

            dtv = darkTreeView1;

            DarkTreeNode dtn = new DarkTreeNode("Rooms");
            dtn.Tag = "folder";
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
            if (dtv.SelectedNodes.Count > 0)
            {
                Debug.WriteLine(dtv.SelectedNodes[0].Text);
            }


            if (dtv.SelectedNodes.Count > 0 && execute)
            {
                if ((string)dtv.SelectedNodes[0].Tag != "folder")
                {
                    string mapContent = Path.Combine(form1.currentProject.RootPath, @"Data\" + dtv.SelectedNodes[0].Text);

                    if (Form1.activeRoom != null)
                    {
                        Sgml.game_save(mapContent, true);
                    }

                    Form1.activeRoom = dtv.SelectedNodes[0];
                    form1.setStatusBottom("Editing " + Form1.activeRoom.Text);


                    if (File.Exists(mapContent))
                    {
                        Root dataDump = Sgml.game_load(mapContent, false);
                        drawTest1.LastRoomState = dataDump;
                    }
                    else
                    {
                        Sgml.currentRoom = (GameRoom) Activator.CreateInstance(Type.GetType("SimplexResources.Rooms." + Form1.activeRoom.Text));
                      
                        Sgml.game_save(mapContent);
                        drawTest1.ClearAll();              
                    }
                }
            }
        }

        private void darkTreeView1_DoubleClick(object sender, EventArgs e)
        {
            
        }
    }
}
