namespace SimplexIde
{
    partial class SimplexRender
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
            this.drawTest1 = new SimplexIde.DrawTest();
            this.SuspendLayout();
            // 
            // drawTest1
            // 
            this.drawTest1.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.drawTest1.Location = new System.Drawing.Point(0, 28);
            this.drawTest1.MouseHoverUpdatesOnly = false;
            this.drawTest1.Name = "drawTest1";
            this.drawTest1.Size = new System.Drawing.Size(700, 532);
            this.drawTest1.TabIndex = 0;
            this.drawTest1.Text = "drawTest1";
            this.drawTest1.OnMouseWheelUpwards += new MonoGame.Forms.Controls.GraphicsDeviceControl.MouseWheelUpwardsEvent(this.DrawTest1_OnMouseWheelUpwards);
            this.drawTest1.OnMouseWheelDownwards += new MonoGame.Forms.Controls.GraphicsDeviceControl.MouseWheelDownwardsEvent(this.DrawTest1_OnMouseWheelDownwards);
            this.drawTest1.Click += new System.EventHandler(this.DrawTest1_Click);
            this.drawTest1.MouseClick += new System.Windows.Forms.MouseEventHandler(this.DrawTest1_MouseClick);
            this.drawTest1.MouseDown += new System.Windows.Forms.MouseEventHandler(this.DrawTest1_MouseDown);
            this.drawTest1.MouseMove += new System.Windows.Forms.MouseEventHandler(this.DrawTest1_MouseMove);
            this.drawTest1.MouseUp += new System.Windows.Forms.MouseEventHandler(this.DrawTest1_MouseUp);
            // 
            // SimplexRender
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(120F, 120F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Dpi;
            this.Controls.Add(this.drawTest1);
            this.DefaultDockArea = DarkUI.Docking.DarkDockArea.Document;
            this.DockText = "Room editor";
            this.Name = "SimplexRender";
            this.Size = new System.Drawing.Size(700, 560);
            this.Load += new System.EventHandler(this.SimplexRender_Load);
            this.ResumeLayout(false);

        }

        #endregion

        public DrawTest drawTest1;
    }
}
