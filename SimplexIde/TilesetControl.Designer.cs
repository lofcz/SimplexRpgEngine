using System.Drawing;

namespace SimplexIde
{
    partial class TilesetControl
    {
        /// <summary> 
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary> 
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Component Designer generated code

        /// <summary> 
        /// Required method for Designer support - do not modify 
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.darkMenuStrip1 = new DarkUI.Controls.DarkMenuStrip();
            this.tilesToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.autotilingToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.prefabsToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.darkMenuStrip1.SuspendLayout();

            
            this.SuspendLayout();
            // 
            // darkMenuStrip1
            // 
            this.darkMenuStrip1.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(60)))), ((int)(((byte)(63)))), ((int)(((byte)(65)))));
            this.darkMenuStrip1.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(220)))), ((int)(((byte)(220)))), ((int)(((byte)(220)))));
            this.darkMenuStrip1.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.tilesToolStripMenuItem,
            this.autotilingToolStripMenuItem,
            this.prefabsToolStripMenuItem});
            this.darkMenuStrip1.LayoutStyle = System.Windows.Forms.ToolStripLayoutStyle.HorizontalStackWithOverflow;
            this.darkMenuStrip1.Location = new System.Drawing.Point(0, 25);
            this.darkMenuStrip1.Margin = new System.Windows.Forms.Padding(100, 0, 0, 0);
            this.darkMenuStrip1.Name = "darkMenuStrip1";
            this.darkMenuStrip1.Padding = new System.Windows.Forms.Padding(3, 2, 0, 2);
            this.darkMenuStrip1.Size = new System.Drawing.Size(296, 24);
            this.darkMenuStrip1.TabIndex = 0;
            this.darkMenuStrip1.Text = "darkMenuStrip1";
            // 
            // tilesToolStripMenuItem
            // 
            this.tilesToolStripMenuItem.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(60)))), ((int)(((byte)(63)))), ((int)(((byte)(65)))));
            this.tilesToolStripMenuItem.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(220)))), ((int)(((byte)(220)))), ((int)(((byte)(220)))));
            this.tilesToolStripMenuItem.Name = "tilesToolStripMenuItem";
            this.tilesToolStripMenuItem.Size = new System.Drawing.Size(43, 20);
            this.tilesToolStripMenuItem.Text = "Tiles";
            // 
            // autotilingToolStripMenuItem
            // 
            this.autotilingToolStripMenuItem.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(60)))), ((int)(((byte)(63)))), ((int)(((byte)(65)))));
            this.autotilingToolStripMenuItem.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(220)))), ((int)(((byte)(220)))), ((int)(((byte)(220)))));
            this.autotilingToolStripMenuItem.Name = "autotilingToolStripMenuItem";
            this.autotilingToolStripMenuItem.Size = new System.Drawing.Size(72, 20);
            this.autotilingToolStripMenuItem.Text = "Autotiling";
            // 
            // prefabsToolStripMenuItem
            // 
            this.prefabsToolStripMenuItem.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(60)))), ((int)(((byte)(63)))), ((int)(((byte)(65)))));
            this.prefabsToolStripMenuItem.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(220)))), ((int)(((byte)(220)))), ((int)(((byte)(220)))));
            this.prefabsToolStripMenuItem.Name = "prefabsToolStripMenuItem";
            this.prefabsToolStripMenuItem.Size = new System.Drawing.Size(58, 20);
            this.prefabsToolStripMenuItem.Text = "Prefabs";
            // 
            // TilesetControl
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.Controls.Add(this.darkMenuStrip1);
            this.DefaultDockArea = DarkUI.Docking.DarkDockArea.Document;
            this.DockText = "Tilesets";
            this.Icon = global::SimplexIde.Properties.Resources.ViewTop_16x;
            this.Name = "TilesetControl";
            this.Size = new System.Drawing.Size(296, 385);
            this.Load += new System.EventHandler(this.TilesetControl_Load);
            this.darkMenuStrip1.ResumeLayout(false);
            this.darkMenuStrip1.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();



        }

        #endregion


        private DarkUI.Controls.DarkMenuStrip darkMenuStrip1;
        private System.Windows.Forms.ToolStripMenuItem tilesToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem autotilingToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem prefabsToolStripMenuItem;

    }
}
