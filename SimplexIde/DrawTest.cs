using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Security.Cryptography.X509Certificates;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using Microsoft.Xna.Framework;
using MonoGame.Forms.Controls;
using SimplexCore;

namespace SimplexIde
{
    public class DrawTest : DrawWindow
    {
        public Type SelectedObject = null;
        public List<GameObject> SceneObjects = new List<GameObject>();


        protected override void Initialize()
        {
            base.Initialize();
        }

        protected override void Draw()
        {
            base.Draw();

            Editor.spriteBatch.Begin();

            foreach (GameObject o in SceneObjects)
            {
                o.DrawNode(Editor.spriteBatch, Editor.Font);

             //   Editor.spriteBatch.DrawString(Editor.Font, "Hello IDE",  o.Position, Color.White);
            }

            Editor.spriteBatch.DrawString(Editor.Font, "Hello IDE", new Vector2(100, 100), Color.White);
            Editor.spriteBatch.End();

        }

        public void GameClicked(MouseEventArgs e)
        {
            if (SelectedObject != null)
            {
                GameObject o = (GameObject) Activator.CreateInstance(SelectedObject);
                o.Position = new Vector2(e.X, e.Y);
                o.OriginalType = SelectedObject;
                o.TypeString = SelectedObject.ToString();

                SceneObjects.Add(o);
                Debug.WriteLine("Scene object added");
            }
        }

        public void SaveGame(string path)
        {
            XmlManager<GameObject> xmlManager = new XmlManager<GameObject>();
            xmlManager.Type = typeof(List<GameObject>);
            xmlManager.SaveList(path, SceneObjects);

        }
    }
}
