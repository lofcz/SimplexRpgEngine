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
using System.Xml.Serialization;
using Microsoft.Xna.Framework;
using Microsoft.Xna.Framework.Graphics;
using Microsoft.Xna.Framework.Input;
using MonoGame.Forms.Controls;
using SimplexCore;
using SimplexResources.Objects;
using ButtonState = Microsoft.Xna.Framework.Input.ButtonState;

namespace SimplexIde
{
    public class TextureReference
    {
        public Texture2D Texture { get; set; }
        public string Name { get; set; }
    }

    public class DrawTest : DrawWindow
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

        protected override void Draw()
        {

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
        {
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
            }
        }

        public void SaveGame(string path)
        {
            Root root = new Root();

            foreach (GameObject g in SceneObjects)
            {
                root.Objects.Add(g);
            }
            //root.Objects.Add(new GameObject { Property1 = 2 });
            //root.Objects.Add(new SampleObject { Property1 = 5, Property2 = 12 });

            XmlSerializer ser = new XmlSerializer(typeof(Root), new Type[] { typeof(SampleObject), typeof(Objekt2) });
            using (TextWriter w = new StreamWriter(path))
            {
                ser.Serialize(w, root);
                //stream.Position = 0;
                //Root deserialized = (Root)ser.Deserialize(stream);
            }

         //   XmlManager<GameObject> xmlManager = new XmlManager<GameObject>();
         //   xmlManager.Type = typeof(List<GameObject>);
         //   xmlManager.SaveList(path, SceneObjects);

        }
    }  
}
