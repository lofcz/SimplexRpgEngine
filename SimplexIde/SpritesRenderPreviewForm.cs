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
    public partial class SpritesRenderPreviewForm : DarkToolWindow
    {
        public SpritesRenderPreviewForm()
        {
            InitializeComponent();

            spritesEditorRenderer1.Disposed += MainDisposed;
            Disposed += SelfDisposed;
        }

        void MainDisposed(object sender, EventArgs e)
        {
            //Sgml.show_message("KOKOT DISPOSED");
        }

        void SelfDisposed(object sender, EventArgs e)
        {
           // Sgml.show_message("KOKOT2 DISPOSED");
        }

        private void SpritesRenderPreviewForm_Load(object sender, EventArgs e)
        {

        }

        private void SpritesEditorRenderer1_Click(object sender, EventArgs e)
        {

        }

        private void SpritesRenderPreviewForm_Closing(object sender, EventArgs e)
        {
            //Sgml.show_message("KOKOT HALAVA");
        }
    }
}
