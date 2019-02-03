namespace SimplexIde
{
    partial class FormNew
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

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.darkButton1 = new DarkUI.Controls.DarkButton();
            this.darkTitle1 = new DarkUI.Controls.DarkTitle();
            this.textName = new DarkUI.Controls.DarkTextBox();
            this.darkTitle2 = new DarkUI.Controls.DarkTitle();
            this.textAuthor = new DarkUI.Controls.DarkTextBox();
            this.darkTitle3 = new DarkUI.Controls.DarkTitle();
            this.textPath = new DarkUI.Controls.DarkTextBox();
            this.darkButton2 = new DarkUI.Controls.DarkButton();
            this.SuspendLayout();
            // 
            // darkButton1
            // 
            this.darkButton1.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.darkButton1.Location = new System.Drawing.Point(565, 267);
            this.darkButton1.Name = "darkButton1";
            this.darkButton1.Size = new System.Drawing.Size(36, 20);
            this.darkButton1.TabIndex = 3;
            this.darkButton1.Text = "OK";
            this.darkButton1.Click += new System.EventHandler(this.darkButton1_Click);
            // 
            // darkTitle1
            // 
            this.darkTitle1.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
            this.darkTitle1.AutoSize = true;
            this.darkTitle1.Location = new System.Drawing.Point(11, 173);
            this.darkTitle1.Name = "darkTitle1";
            this.darkTitle1.Size = new System.Drawing.Size(63, 13);
            this.darkTitle1.TabIndex = 5;
            this.darkTitle1.Text = "New Name:";
            // 
            // textName
            // 
            this.textName.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.textName.Location = new System.Drawing.Point(11, 189);
            this.textName.Name = "textName";
            this.textName.Size = new System.Drawing.Size(548, 20);
            this.textName.TabIndex = 4;
            // 
            // darkTitle2
            // 
            this.darkTitle2.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
            this.darkTitle2.AutoSize = true;
            this.darkTitle2.Location = new System.Drawing.Point(11, 251);
            this.darkTitle2.Name = "darkTitle2";
            this.darkTitle2.Size = new System.Drawing.Size(41, 13);
            this.darkTitle2.TabIndex = 6;
            this.darkTitle2.Text = "Author:";
            // 
            // textAuthor
            // 
            this.textAuthor.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.textAuthor.Location = new System.Drawing.Point(11, 267);
            this.textAuthor.Name = "textAuthor";
            this.textAuthor.Size = new System.Drawing.Size(548, 20);
            this.textAuthor.TabIndex = 7;
            // 
            // darkTitle3
            // 
            this.darkTitle3.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
            this.darkTitle3.AutoSize = true;
            this.darkTitle3.Location = new System.Drawing.Point(11, 212);
            this.darkTitle3.Name = "darkTitle3";
            this.darkTitle3.Size = new System.Drawing.Size(32, 13);
            this.darkTitle3.TabIndex = 8;
            this.darkTitle3.Text = "Path:";
            // 
            // textPath
            // 
            this.textPath.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.textPath.Location = new System.Drawing.Point(11, 228);
            this.textPath.Name = "textPath";
            this.textPath.Size = new System.Drawing.Size(548, 20);
            this.textPath.TabIndex = 9;
            // 
            // darkButton2
            // 
            this.darkButton2.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.darkButton2.Location = new System.Drawing.Point(565, 228);
            this.darkButton2.Name = "darkButton2";
            this.darkButton2.Size = new System.Drawing.Size(36, 20);
            this.darkButton2.TabIndex = 10;
            this.darkButton2.Text = "...";
            this.darkButton2.Click += new System.EventHandler(this.darkButton2_Click);
            // 
            // FormNew
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.Controls.Add(this.darkButton2);
            this.Controls.Add(this.textPath);
            this.Controls.Add(this.darkTitle3);
            this.Controls.Add(this.textAuthor);
            this.Controls.Add(this.darkTitle2);
            this.Controls.Add(this.darkTitle1);
            this.Controls.Add(this.textName);
            this.Controls.Add(this.darkButton1);
            this.DefaultDockArea = DarkUI.Docking.DarkDockArea.Document;
            this.DockText = "New Project";
            this.Name = "FormNew";
            this.Size = new System.Drawing.Size(616, 300);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion
        private DarkUI.Controls.DarkButton darkButton1;
        private DarkUI.Controls.DarkTitle darkTitle1;
        private DarkUI.Controls.DarkTextBox textName;
        private DarkUI.Controls.DarkTitle darkTitle2;
        private DarkUI.Controls.DarkTextBox textAuthor;
        private DarkUI.Controls.DarkTitle darkTitle3;
        private DarkUI.Controls.DarkTextBox textPath;
        private DarkUI.Controls.DarkButton darkButton2;
    }
}