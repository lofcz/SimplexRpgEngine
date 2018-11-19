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
using Microsoft.Xna.Framework.Graphics;
using Microsoft.Xna.Framework.Input;
using MonoGame.Forms.Controls;
using SimplexCore;
using ButtonState = Microsoft.Xna.Framework.Input.ButtonState;

namespace SimplexIde
{
    public class TextureReference
    {
        public Texture2D Texture { get; set; }
        public string Name { get; set; }
    }

    public class DrawTest : UpdateWindow
    {
        public Type SelectedObject = null;
        public List<GameObject> SceneObjects = new List<GameObject>();
        public List<TextureReference> Textures = new List<TextureReference>();
        public bool DrawGrid;  

        public void ToggleGrid(bool toggle)
        {
            DrawGrid = toggle;
        }

        public void InitializeNodes(TreeNodeCollection tnc)
        {
            foreach (TreeNode tn in tnc)
            {
                GameObject g = (GameObject)Activator.CreateInstance(Type.GetType("SimplexResources.Objects." + tn.Text));
                Texture2D tex = Editor.Content.Load<Texture2D>(@"C:\Users\lof\Documents\GitHub\SimplexRpgEngine\SimplexRpgEngine3\Content\bin\Windows\" + g.Sprite.TextureSource);

                TextureReference tr = new TextureReference();
                tr.Texture = tex;
                tr.Name = g.Sprite.TextureSource;
                Textures.Add(tr);
            }
        }

        protected override void Update(GameTime gt)
        {
            Debug.WriteLine(DateTime.Now);
        }

        protected override void Draw()
        {

            MouseState m = Mouse.GetState();

            if (m.LeftButton == ButtonState.Pressed)
            {
                if (SelectedObject != null)
                {
                    Vector2 vec = new Vector2(m.X, m.Y);

                    if (DrawGrid)
                    {
                        vec = new Vector2(m.X / 32 * 32, m.Y / 32 * 32);
                    }

                    GameObject o = (GameObject)Activator.CreateInstance(SelectedObject);
                    o.Position = vec;
                    o.OriginalType = SelectedObject;
                    o.TypeString = SelectedObject.ToString();

                    SceneObjects.Add(o);
                }
            }

            base.Draw();

            Editor.spriteBatch.Begin();

            foreach (GameObject o in SceneObjects)
            {
                o.DrawNode(Editor.spriteBatch, Editor.Font, Textures.FirstOrDefault(x => x.Name == o.Sprite.TextureSource).Texture);

             //   Editor.spriteBatch.DrawString(Editor.Font, "Hello IDE",  o.Position, Color.White);
            }

            Editor.spriteBatch.DrawString(Editor.Font, "Hello IDE", new Vector2(100, 100), Color.White);
            Editor.spriteBatch.End();

        }

        public void GameClicked(MouseEventArgs e)
        {/*
            if (SelectedObject != null)
            {
                Vector2 vec = new Vector2(e.X, e.Y);

                if (DrawGrid)
                {
                    vec = new Vector2(e.X / 32 * 32, e.Y / 32 * 32);
                }

                GameObject o = (GameObject) Activator.CreateInstance(SelectedObject);
                o.Position = vec;
                o.OriginalType = SelectedObject;
                o.TypeString = SelectedObject.ToString();

                SceneObjects.Add(o);
            }*/
        }

        public void SaveGame(string path)
        {
            XmlManager<GameObject> xmlManager = new XmlManager<GameObject>();
            xmlManager.Type = typeof(List<GameObject>);
            xmlManager.SaveList(path, SceneObjects);

        }
    }
}
