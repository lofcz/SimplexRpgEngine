using DarkUI.Docking;
using DarkUI.Forms;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace SimplexIde
{
    
    public partial class FormNew : DarkToolWindow
    {
        public FormNew()
        {
            InitializeComponent();

        }

        private void CreateDirectory(string newPath, string[] names)
        {
            foreach (var item in names)
            {
                Directory.CreateDirectory(newPath + item);
            }
        }
        private void NewFiles(string prePath, string newPath, string[] names){
            foreach (var item in names)
            {
                File.Copy(prePath + "Prefab.json", newPath + item);
            }
        }

        private void darkButton1_Click(object sender, EventArgs e)
        {
            string oldPath = Environment.CurrentDirectory;

            int i = oldPath.LastIndexOf("\\");
            oldPath = oldPath.Substring(0, i);
            i = oldPath.LastIndexOf("\\");
            oldPath = oldPath.Substring(0, i);
            i = oldPath.LastIndexOf("\\");
            oldPath = oldPath.Substring(0, i);

            string prePath = oldPath + "\\SimplexCore\\Prefabs\\";
            string newPath = textPath.Text + "\\" + textName.Text;

            Directory.CreateDirectory(newPath);
            newPath += "\\";

            //Create .json files
            string[] names = new string[] { "ShadersDescriptor.json", "SoundsDescriptor.json", "SpritesDescriptor.json", "TilesetsDescriptor.json", "VideosDescriptor.json" };
            this.NewFiles(prePath, newPath, names);

            //Create new sproject
            File.Copy(prePath + "Prefab.sproject", newPath + textName.Text + ".sproject");

            //Create files and replace Prefabs
            File.Copy(prePath + "Global.cs", newPath + "Global.cs");
            string text = File.ReadAllText(newPath + "Global.cs");
            text = text.Replace("Prefab", textName.Text);
            File.WriteAllText(newPath + "Global.cs", text);

            File.Copy(prePath + "Prefab.projitems", newPath + textName.Text + ".projitems");
            text = File.ReadAllText(newPath + textName.Text + ".projitems");
            text = text.Replace("Prefab", textName.Text);
            File.WriteAllText(newPath + textName.Text + ".projitems", text);

            File.Copy(prePath + "Prefab.shproj", newPath + textName.Text + ".shproj");
            text = File.ReadAllText(newPath + textName.Text + ".shproj");
            text = text.Replace("Prefab", textName.Text);
            text = text.Replace("..\\SimplexIde\\SimplexIde.projitems", oldPath + "\\SimplexIde\\SimplexIde.projitems");
            File.WriteAllText(newPath + textName.Text + ".shproj", text);
            
            //sproject
            text = File.ReadAllText(newPath + textName.Text + ".sproject");
            text = text.Replace("\"Author\": null,", "\"Author\": \"" + textAuthor.Text + "\",");
            File.WriteAllText(newPath + textName.Text + ".sproject", text);

            //csproj ref
            text = File.ReadAllText(oldPath + "\\SimplexIde\\SimplexIde.csproj");
            i = text.IndexOf("<Import Project=\"..\\");
            string rf = "<Import Project=\"" + newPath + textName.Text + ".projitems\" Label=\"Shared\" />";
            //string rf = "<Import Project=\"..\\" + textName.Text + "\\" + textName.Text + ".projitems\" Label=\"Shared\" />";
            string s = text.Substring(0, i - 1) + "\r\n" + rf + "\r\n" + text.Substring(i, text.Length - i);
            File.WriteAllText(oldPath + "\\SimplexIde\\SimplexIde.csproj", s);

            //Create directories
            names = new string[] { "Content", "Objects", "Rooms", "Shaders" };
            this.CreateDirectory(newPath, names);

            names = new string[] { "Fonts", "Shaders", "Sounds", "Sprites", "Tilesets", "Videos" };
            this.CreateDirectory(newPath + "Content\\", names);

            //sln ref
            text = File.ReadAllText(oldPath + "\\SimplexRpgEngine3.sln");
            i = text.IndexOf("Global");
            rf = "Project(\"{" + Guid.NewGuid() + "}\") = \"" + textName.Text + "\", \"" /*+ textName.Text + "\\" */+ newPath + textName.Text + ".shproj\", \"{" + Guid.NewGuid() + "}\"\r\n" + "EndProject";
            s = text.Substring(0, i - 1) + "\r\n" + rf + "\r\n" + text.Substring(i, text.Length - i);
            File.WriteAllText(oldPath + "\\SimplexRpgEngine3.sln", s);



            Close();
        }

        private void darkButton2_Click(object sender, EventArgs e)
        {
            using (var log = new FolderBrowserDialog())
            {
                string oldPath = Environment.CurrentDirectory;

                int i = oldPath.LastIndexOf("\\");
                oldPath = oldPath.Substring(0, i);
                i = oldPath.LastIndexOf("\\");
                oldPath = oldPath.Substring(0, i);
                i = oldPath.LastIndexOf("\\");
                oldPath = oldPath.Substring(0, i);

                log.SelectedPath = oldPath;
                DialogResult result = log.ShowDialog();

                if (result == DialogResult.OK && !string.IsNullOrWhiteSpace(log.SelectedPath))
                {
                    textPath.Text = log.SelectedPath;
                }
            }
        }

        private void darkButton3_Click(object sender, EventArgs e)
        {
            string oldPath = Environment.CurrentDirectory;

            int i = oldPath.LastIndexOf("\\");
            oldPath = oldPath.Substring(0, i);
            i = oldPath.LastIndexOf("\\");
            oldPath = oldPath.Substring(0, i);
            i = oldPath.LastIndexOf("\\");
            oldPath = oldPath.Substring(0, i);

            textPath.Text = oldPath;
        }

        private void darkTitle3_Click(object sender, EventArgs e)
        {

        }

        private void darkTitle1_Click(object sender, EventArgs e)
        {

        }

        private void darkTitle2_Click(object sender, EventArgs e)
        {

        }

        private void textName_TextChanged(object sender, EventArgs e)
        {

        }

        private void textAuthor_TextChanged(object sender, EventArgs e)
        {

        }

        private void textPath_TextChanged(object sender, EventArgs e)
        {

        }
    }
}
