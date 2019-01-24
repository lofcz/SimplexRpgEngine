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
            this.textName = new DarkUI.Controls.DarkTextBox();
            this.darkTitle1 = new DarkUI.Controls.DarkTitle();
            this.SuspendLayout();
            // 
            // darkButton1
            // 
            this.darkButton1.Location = new System.Drawing.Point(342, 268);
            this.darkButton1.Name = "darkButton1";
            this.darkButton1.Size = new System.Drawing.Size(36, 20);
            this.darkButton1.TabIndex = 3;
            this.darkButton1.Text = "OK";
            this.darkButton1.Click += new System.EventHandler(this.darkButton1_Click);
            // 
            // textName
            // 
            this.textName.Location = new System.Drawing.Point(12, 268);
            this.textName.Name = "textName";
            this.textName.Size = new System.Drawing.Size(321, 20);
            this.textName.TabIndex = 4;
            // 
            // darkTitle1
            // 
            this.darkTitle1.AutoSize = true;
            this.darkTitle1.Location = new System.Drawing.Point(12, 252);
            this.darkTitle1.Name = "darkTitle1";
            this.darkTitle1.Size = new System.Drawing.Size(63, 13);
            this.darkTitle1.TabIndex = 5;
            this.darkTitle1.Text = "New Name:";
            // 
            // FormNew
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(616, 300);
            this.Controls.Add(this.darkTitle1);
            this.Controls.Add(this.textName);
            this.Controls.Add(this.darkButton1);
            this.Name = "FormNew";
            this.Text = "FormNew";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion
        private DarkUI.Controls.DarkButton darkButton1;
        private DarkUI.Controls.DarkTextBox textName;
        private DarkUI.Controls.DarkTitle darkTitle1;
    }
}