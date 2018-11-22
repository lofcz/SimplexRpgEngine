using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Xml.Serialization;
using Microsoft.Xna.Framework;
using Microsoft.Xna.Framework.Graphics;
using Microsoft.Xna.Framework.Input;
using MonoGame.Extended;
using MonoGame.Forms.Controls;
using Newtonsoft.Json;
using SimplexCore;
using SimplexResources.Objects;
using ButtonState = Microsoft.Xna.Framework.Input.ButtonState;
using Color = Microsoft.Xna.Framework.Color;
using RectangleF = MonoGame.Extended.RectangleF;

namespace SimplexIde
{
    public class DrawTest : UpdateWindow
    {
        public Type SelectedObject = null;
        public List<GameObject> SceneObjects = new List<GameObject>();
        public List<TextureReference> Textures = new List<TextureReference>();
        public bool DrawGrid;
        GameTime g = new GameTime();
        public static Color BackgroundColor = Color.CornflowerBlue;
        public List<Spritesheet> Sprites = new List<Spritesheet>();

        protected override void Initialize()
        {
            base.Initialize();

            Sgml.SceneObjects = SceneObjects;
            Sgml.Textures = Textures;
        }


        protected override void Update(GameTime gameTime)
        {
            g = gameTime;
            base.Update(gameTime);
        }

        public void ToggleGrid(bool toggle)
        {
            DrawGrid = toggle;
        }

        public void InitializeNodes(TreeNodeCollection tnc)
        {
            Sprites = JsonConvert.DeserializeObject<List<Spritesheet>>(new StreamReader("../../../SimplexRpgEngine3/SpritesDescriptor.json").ReadToEnd());

            foreach (Spritesheet s in Sprites)
            {
                Texture2D tex = Editor.Content.Load<Texture2D>(Path.GetFullPath("../../../SimplexRpgEngine3/Content/bin/Windows/Sprites/" + s.Name));
                s.Texture = tex;
            }
        }

        protected override void Draw()
        {
            double framerate = (1 / g.ElapsedGameTime.TotalSeconds);
            
            base.Draw();
      
            Editor.graphics.Clear(BackgroundColor);
            Editor.spriteBatch.Begin();

            Editor.spriteBatch.DrawRectangle(new RectangleF(new Point2(0, 0), new Size2(Form1.width, Form1.height)), Color.White);

            foreach (GameObject o in SceneObjects)
            {
                o.DrawNode(Editor.spriteBatch, Editor.Font, o.Sprite.Texture);
             //   o.DrawNode(Editor.spriteBatch, Editor.Font, Textures.FirstOrDefault(x => x.Name == o.Sprite.TextureSource).Texture);

             //   Editor.spriteBatch.DrawString(Editor.Font, "Hello IDE",  o.Position, Color.White);
            }

            Editor.spriteBatch.DrawString(Editor.Font, framerate.ToString("F1"), new Vector2(100, 100), Color.White);
            Editor.spriteBatch.End();

        }

        public void GameClicked(MouseEventArgs e, MouseButtons mb)
        {
            if (mb == MouseButtons.Left)
            {
                if (SelectedObject != null)
                {                 
                    Vector2 vec = new Vector2(e.X, e.Y);

                    if (DrawGrid)
                    {
                        vec = new Vector2(e.X / 32 * 32, e.Y / 32 * 32);
                    }

                    if (Sgml.PlaceEmpty(vec))
                    {
                        GameObject o = (GameObject)Activator.CreateInstance(SelectedObject);
                        Spritesheet s = Sprites.FirstOrDefault(x => x.Name == o.Sprite.TextureSource);


                        o.Position = vec;
                        o.OriginalType = SelectedObject;
                        o.TypeString = SelectedObject.ToString();
                        o.Sprite.Texture = s.Texture;
                        o.Sprite.ImageRectangle = new Microsoft.Xna.Framework.Rectangle(0, 0, s.CellWidth, s.CellHeight);
                        o.EvtCreate();


                        SceneObjects.Add(o);
                    }
                }
            }
            else if (mb == MouseButtons.Right)
            {
                Vector2 vec = new Vector2(e.X, e.Y);
                if (DrawGrid)
                {
                    vec = new Vector2(e.X / 32 * 32, e.Y / 32 * 32);
                }

                for (var i = 0; i < SceneObjects.Count; i++)
                {
                    Microsoft.Xna.Framework.Rectangle r = new Microsoft.Xna.Framework.Rectangle((int)SceneObjects[i].Position.X, (int)SceneObjects[i].Position.Y, SceneObjects[i].Sprite.ImageRectangle.Width, SceneObjects[i].Sprite.ImageRectangle.Height);

                    if (r.Contains(vec))
                    {
                        SceneObjects[i].EvtDelete();
                        SceneObjects.Remove(SceneObjects[i]);
                    }
                }
            }
        }

        public void SaveGame(string path)
        {
            Root root = new Root();

            foreach (GameObject g in SceneObjects)
            {
                g.EvtSave();
                root.Objects.Add(g);
            }
            //root.Objects.Add(new GameObject { Property1 = 2 });
            //root.Objects.Add(new SampleObject { Property1 = 5, Property2 = 12 });

            XmlSerializer ser = new XmlSerializer(typeof(Root), new Type[] { typeof(SampleObject), typeof(Object2) });
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

        public void LoadGame(string path)
        {
            // First we fuck current scene
            SceneObjects.Clear();

            // Then we load raw data
            Root root = new Root();
            XmlSerializer ser = new XmlSerializer(typeof(Root), new Type[] { typeof(SampleObject), typeof(Object2) });
            using (StreamReader w = new StreamReader(path))
            {
                Root rawData = (Root)ser.Deserialize(w);


                // Time to load babies
                foreach (GameObject g in rawData.Objects)
                {
                    Spritesheet s = Sprites.FirstOrDefault(x => x.Name == g.Sprite.TextureSource);

                    g.EvtLoad();
                    g.Sprite.Texture = s.Texture;
                    g.Sprite.ImageRectangle = new Microsoft.Xna.Framework.Rectangle(0, 0, s.CellWidth, s.CellHeight);
                    SceneObjects.Add(g);
                }
            }

        }
    }  
}
