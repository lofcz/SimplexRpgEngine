namespace SimplexIde
{
    partial class SpritesRenderPreviewForm
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
            this.spritesEditorRenderer1 = new SimplexIde.SpritesEditorRenderer();
            this.SuspendLayout();
            // 
            // spritesEditorRenderer1
            // 
            this.spritesEditorRenderer1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.spritesEditorRenderer1.Location = new System.Drawing.Point(0, 25);
            this.spritesEditorRenderer1.Margin = new System.Windows.Forms.Padding(4);
            this.spritesEditorRenderer1.MouseHoverUpdatesOnly = false;
            this.spritesEditorRenderer1.Name = "spritesEditorRenderer1";
            this.spritesEditorRenderer1.Size = new System.Drawing.Size(928, 654);
            this.spritesEditorRenderer1.TabIndex = 6;
            this.spritesEditorRenderer1.Text = "spritesEditorRenderer1";
            this.spritesEditorRenderer1.Click += new System.EventHandler(this.SpritesEditorRenderer1_Click);
            // 
            // SpritesRenderPreviewForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.Controls.Add(this.spritesEditorRenderer1);
            this.DefaultDockArea = DarkUI.Docking.DarkDockArea.Document;
            this.DockText = "Sprites Editor - live preview";
            this.Icon = global::SimplexIde.Properties.Resources.PreviewTransition_16x;
            this.Name = "SpritesRenderPreviewForm";
            this.Size = new System.Drawing.Size(928, 679);
            this.Closing += new System.EventHandler(this.SpritesRenderPreviewForm_Closing);
            this.Load += new System.EventHandler(this.SpritesRenderPreviewForm_Load);
            this.ResumeLayout(false);

        }

        #endregion

        public SpritesEditorRenderer spritesEditorRenderer1;
    }
}
