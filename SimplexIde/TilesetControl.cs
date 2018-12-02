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
    public partial class TilesetControl : DarkToolWindow
    {
        public Tileset currentTileset;
        public Bitmap currentTilesetBitmap;
        public int mode = 0;

        public TilesetControl()
        {
            InitializeComponent();
        }

        private void TilesetControl_Load(object sender, EventArgs e)
        {

        }

        private void TilesetControl_Paint(object sender, PaintEventArgs e)
        {
            // Draw entire tileset
            if (mode == 0)
            {
                if (currentTilesetBitmap != null)
                {
                    e.Graphics.DrawImage(currentTilesetBitmap, new PointF(0, 50));
                }
            }
        }
    }
}
