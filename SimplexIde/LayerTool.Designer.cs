namespace SimplexIde
{
    partial class LayerTool
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
            this.darkTreeView1 = new DarkUI.Controls.DarkTreeView();
            this.darkContextMenu1 = new DarkUI.Controls.DarkContextMenu();
            this.toggleToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.darkContextMenu1.SuspendLayout();
            this.SuspendLayout();
            // 
            // darkTreeView1
            // 
            this.darkTreeView1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.darkTreeView1.Location = new System.Drawing.Point(0, 25);
            this.darkTreeView1.MaxDragChange = 20;
            this.darkTreeView1.Name = "darkTreeView1";
            this.darkTreeView1.ShowIcons = true;
            this.darkTreeView1.Size = new System.Drawing.Size(301, 306);
            this.darkTreeView1.TabIndex = 0;
            this.darkTreeView1.Text = "darkTreeView1";
            this.darkTreeView1.SelectedNodesChanged += new System.EventHandler(this.darkTreeView1_SelectedNodesChanged);
            this.darkTreeView1.Click += new System.EventHandler(this.darkTreeView1_Click);
            this.darkTreeView1.MouseClick += new System.Windows.Forms.MouseEventHandler(this.darkTreeView1_MouseClick);
            // 
            // darkContextMenu1
            // 
            this.darkContextMenu1.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(60)))), ((int)(((byte)(63)))), ((int)(((byte)(65)))));
            this.darkContextMenu1.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(220)))), ((int)(((byte)(220)))), ((int)(((byte)(220)))));
            this.darkContextMenu1.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.toggleToolStripMenuItem});
            this.darkContextMenu1.Name = "darkContextMenu1";
            this.darkContextMenu1.Size = new System.Drawing.Size(181, 48);
            this.darkContextMenu1.Closed += new System.Windows.Forms.ToolStripDropDownClosedEventHandler(this.darkContextMenu1_Closed);
            this.darkContextMenu1.Opening += new System.ComponentModel.CancelEventHandler(this.darkContextMenu1_Opening);
            // 
            // toggleToolStripMenuItem
            // 
            this.toggleToolStripMenuItem.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(60)))), ((int)(((byte)(63)))), ((int)(((byte)(65)))));
            this.toggleToolStripMenuItem.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(220)))), ((int)(((byte)(220)))), ((int)(((byte)(220)))));
            this.toggleToolStripMenuItem.Name = "toggleToolStripMenuItem";
            this.toggleToolStripMenuItem.Size = new System.Drawing.Size(180, 22);
            this.toggleToolStripMenuItem.Text = "Toggle";
            this.toggleToolStripMenuItem.Click += new System.EventHandler(this.toggleToolStripMenuItem_Click);
            // 
            // LayerTool
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.Controls.Add(this.darkTreeView1);
            this.DefaultDockArea = DarkUI.Docking.DarkDockArea.Document;
            this.DockText = "Layers";
            this.Icon = global::SimplexIde.Properties.Resources.LayerTool_16x;
            this.Name = "LayerTool";
            this.Size = new System.Drawing.Size(301, 331);
            this.Load += new System.EventHandler(this.LayerTool_Load);
            this.darkContextMenu1.ResumeLayout(false);
            this.ResumeLayout(false);

        }

        #endregion

        private DarkUI.Controls.DarkTreeView darkTreeView1;
        private DarkUI.Controls.DarkContextMenu darkContextMenu1;
        private System.Windows.Forms.ToolStripMenuItem toggleToolStripMenuItem;
    }
}
