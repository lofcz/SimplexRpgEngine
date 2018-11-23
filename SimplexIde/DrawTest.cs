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
using System.Windows.Forms.VisualStyles;
using System.Xml.Serialization;
using Microsoft.Xna.Framework;
using Microsoft.Xna.Framework.Graphics;
using Microsoft.Xna.Framework.Input;
using MonoGame.Extended;
using MonoGame.Extended.ViewportAdapters;
using MonoGame.Forms.Controls;
using Newtonsoft.Json;
using SimplexCore;
using SimplexResources.Objects;
using SimplexResources.Rooms;
using ButtonState = Microsoft.Xna.Framework.Input.ButtonState;
using Color = Microsoft.Xna.Framework.Color;
using Keys = Microsoft.Xna.Framework.Input.Keys;
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
        Camera2D camera;
        SimplexCamera cam = new SimplexCamera();
        KeyboardState prevState;
        public Vector2 MousePosition;
        public Vector2 MousePositionTranslated;
        protected override void Initialize()
        {
            base.Initialize();

            Sgml.SceneObjects = SceneObjects;
            Sgml.Textures = Textures;
            
            camera = new Camera2D(Editor.graphics);

            cam.Camera = camera;
            cam.Position = Vector2.Zero;
            cam.TargetPosition = Vector2.Zero;
            cam.TransformSpeed = 0.1f;

            prevState = Keyboard.GetState();
        }


        protected override void Update(GameTime gameTime)
        {
            MousePositionTranslated = cam.Camera.ScreenToWorld(MousePosition);


            Input.KeyboardState = Keyboard.GetState();
            g = gameTime;
            base.Update(gameTime);

            cam.UpdatePosition();

            if (Input.KeyPressed(Keys.W))
            {
                cam.TargetPosition.Y -= 100;
            }

           
            if (Input.KeyPressed(Keys.Q))
            {
                cam.TargetZoom -= 0.1f;
            }

            Input.KeyboardStatePrevious = Keyboard.GetState();
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
            Matrix transformMatrix = cam.Camera.GetViewMatrix();
            Editor.graphics.Clear(BackgroundColor);
            Editor.spriteBatch.Begin(transformMatrix: transformMatrix);

            Editor.spriteBatch.DrawRectangle(new RectangleF(new Point2(0, 0), new Size2(Form1.width, Form1.height)), Color.White, 2);

            foreach (GameObject o in SceneObjects)
            {
                o.DrawNode(Editor.spriteBatch, Editor.Font, o.Sprite.Texture);
             //   o.DrawNode(Editor.spriteBatch, Editor.Font, Textures.FirstOrDefault(x => x.Name == o.Sprite.TextureSource).Texture);

               
            }
            
            Editor.spriteBatch.DrawString(Editor.Font, "Mouse X: " +Math.Round(MousePositionTranslated.X) + "\nMouse Y: " + Math.Round(MousePositionTranslated.Y), new Vector2(200, 200), Color.White);

            Editor.spriteBatch.DrawString(Editor.Font, framerate.ToString("F1"), new Vector2(100, 100), Color.White);
            Editor.spriteBatch.End();

        }

        public void WheelDown()
        {
            cam.TargetZoom -= 0.1f;
        }

        public void WheelUp()
        {
            cam.TargetZoom += 0.1f;
        }

        public void GameClicked(MouseEventArgs e, MouseButtons mb)
        {
            MousePositionTranslated = cam.Camera.ScreenToWorld(MousePosition);

            if (mb == MouseButtons.Left)
            {
                if (SelectedObject != null)
                {
                    Vector2 vec = MousePositionTranslated;

                    if (DrawGrid)
                    {
                        vec = new Vector2((int)vec.X / 32 * 32, (int)vec.Y / 32 * 32);
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
                Vector2 vec = MousePositionTranslated;
                if (DrawGrid)
                {
                    vec = new Vector2((int)vec.X / 32 * 32, (int)vec.Y / 32 * 32);
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
            GameRoom gr = (GameRoom) Activator.CreateInstance(Type.GetType(("SimplexResources.Rooms." + Form1.activeRoom.Text)));
            root.Room = gr;

            XmlSerializer ser = new XmlSerializer(typeof(Root), Form1.reflectedTypes.ToArray());
            using (TextWriter w = new StreamWriter(path))
            {
                ser.Serialize(w, root);
                //stream.Position = 0;
                //Root deserialized = (Root)ser.Deserialize(stream);
            }

         //   XmlManager<GameObject> xmlManager = new XmlManager<GameObject>();
         //   xmlManager.Type = typeof(List<GameObject>);
         //   xmlManager.SaveList(path, SceneObjects);
          Debug.WriteLine("Save OK");
        }

        public void ClearAll()
        {
            SceneObjects.Clear();
        }

        public void LoadGame(string path)
        {
            // First we fuck current scene
            ClearAll();

            // Then we load raw data
            Root root = new Root();
            XmlSerializer ser = new XmlSerializer(typeof(Root), Form1.reflectedTypes.ToArray());
            using (StreamReader w = new StreamReader(path))
            {
                Root rawData = (Root)ser.Deserialize(w);

                // First load back room itself
                Form1.width = (int)rawData.Room.Size.X;
                Form1.height = (int)rawData.Room.Size.Y;
                Form1.ActiveForm.Text = "Simplex RPG Engine / " + rawData.Room.Name;


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
