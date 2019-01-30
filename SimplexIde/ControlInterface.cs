using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using DarkUI.Docking;
using SimplexCore;

namespace SimplexIde
{
    public partial class ControlInterface : DarkToolWindow
    {
        private Control[] controls = null;
        public GameObject lastObject = null;

        public ControlInterface()
        {
            InitializeComponent();
        }

        private void ControlInterface_Load(object sender, EventArgs e)
        {

        }

        public void RegisterControls(Control[] controls)
        {
            if (controls != null)
            {
                int index = 0;
                foreach (Control c in controls)
                {
                    if (c != null)
                    {
                        c.Location = new Point(10, 30 + index * 20);
                        //c.Size = DefaultSize;

                        Controls.Add(c);
                        index++;
                    }
                }
            }

            this.controls = controls;


            Invalidate();
        }
    }
}
