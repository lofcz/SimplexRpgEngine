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
using MonoGame.Extended.Shapes;
using MonoGame.Forms.Controls;
using Newtonsoft.Json;
using SharpDX.Direct2D1;
using SimplexCore;
using SimplexCore.Ext;
using SimplexResources.Objects;
using SimplexResources.Rooms;
using ButtonState = Microsoft.Xna.Framework.Input.ButtonState;
using Color = Microsoft.Xna.Framework.Color;
using FillMode = Microsoft.Xna.Framework.Graphics.FillMode;
using Keys = Microsoft.Xna.Framework.Input.Keys;
using Point = SharpDX.Point;
using RectangleF = MonoGame.Extended.RectangleF;
using VertexBuffer = Microsoft.Xna.Framework.Graphics.VertexBuffer;


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
        public GameObject clickedObject = null;
        private bool mouseLocked = false;
        private Vector2 helpVec;
        private Vector2 clickedVec;
        private bool panView = false;
        public ContextMenuStrip cms;
        private bool killClick = false;
        private bool cmsOpen = false;
        private bool goodBoy = false;
        Stack<List<GameObject>> stackedSteps = new Stack<List<GameObject>>(32);
        public static VertexBuffer vertexBuffer;
        public static BasicEffect basicEffect;
        private float k = 0;
        private VertexPositionColor[] _vertexPositionColors;
        Matrix world = Matrix.Identity;
        private Matrix m;
        private SimplexCore.Ext.MgPrimitiveBatcher mpb;

        public Vector2 GridSize = new Vector2(32, 32);
        public Vector2 GridSizeRender = new Vector2(32, 32);
        public Form1 editorForm;

        protected override void Initialize()
        {
            base.Initialize();

            Sgml.SceneObjects = SceneObjects;
            Sgml.Textures = Textures;
            
            camera = new Camera2D(Editor.graphics);
            basicEffect = new BasicEffect(Editor.graphics);

            cam.Camera = camera;
            cam.Position = Vector2.Zero;
            cam.TargetPosition = Vector2.Zero;
            cam.TransformSpeed = 0.1f;

            prevState = Keyboard.GetState();


            basicEffect = new BasicEffect(GraphicsDevice);

            VertexPositionColor[] vertices = new VertexPositionColor[3];
            vertices[0] = new VertexPositionColor(new Vector3(100, 100, 0), Color.Red);
            vertices[1] = new VertexPositionColor(new Vector3(200, 100, 0), Color.Green);
            vertices[2] = new VertexPositionColor(new Vector3(150, 150, 0), Color.Blue);

            vertexBuffer = new VertexBuffer(GraphicsDevice, typeof(VertexPositionColor), 3, BufferUsage.WriteOnly);
            vertexBuffer.SetData<VertexPositionColor>(vertices);

            m = Matrix.CreateOrthographicOffCenter(0, GraphicsDevice.Viewport.Width, GraphicsDevice.Viewport.Height, 0, 0, -1);

            mpb = new MgPrimitiveBatcher(Editor.graphics, Editor.Font);
           // Editor.spriteBatch = mpb;
        }


        public void Rsize()
        {
            Editor.graphics.Viewport = new Viewport(0, 0, this.Width, this.Height);
            
            m = Matrix.CreateOrthographicOffCenter(0, GraphicsDevice.Viewport.Width, GraphicsDevice.Viewport.Height, 0, 0, -1);
            Debug.WriteLine(GraphicsDevice.Viewport.Height);
        }

        protected override void Update(GameTime gameTime)
        {
            MousePositionTranslated = cam.Camera.ScreenToWorld(MousePosition);


            GridSizeRender = new Vector2(SimplexMath.Lerp(GridSizeRender.X, GridSize.X, 0.2f), SimplexMath.Lerp(GridSizeRender.Y, GridSize.Y, 0.2f));

            Input.KeyboardState = Keyboard.GetState();
            g = gameTime;
            base.Update(gameTime);

            cam.UpdatePosition();

            if (Input.KeyPressed(Keys.W))
            {
                cam.TargetPosition.Y -= 100;
            }

            if (Input.KeyPressed(Keys.D))
            {
                k += 1;
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

        public void ClickRelease()
        {
            mouseLocked = false;

            if (!cms.Visible)
            {
                clickedObject = null;
            }

            panView = false;
        }

        public void ClickLock(MouseButtons btn)
        {
            mouseLocked = true;

            if (btn == MouseButtons.Middle)
            {
                panView = true;
                helpVec = cam.Camera.ScreenToWorld(MousePosition);
            }

            if (btn == MouseButtons.Right && !Input.KeyboardState.IsKeyDown(Keys.LeftShift))
            {
                Vector2 vec = MousePositionTranslated;
                if (DrawGrid)
                {
                    vec = new Vector2((int)vec.X / 32 * 32, (int)vec.Y / 32 * 32);
                }

                for (var i = SceneObjects.Count - 1; i >= 0; i--)
                {
                    Microsoft.Xna.Framework.Rectangle r = new Microsoft.Xna.Framework.Rectangle((int)SceneObjects[i].Position.X, (int)SceneObjects[i].Position.Y, SceneObjects[i].Sprite.ImageRectangle.Width, SceneObjects[i].Sprite.ImageRectangle.Height);

                    if (r.Contains(vec))
                    {
                        if (goodBoy)
                        {
                            cms.Items.Clear();
                            cms.Items.AddRange(SceneObjects[i].EditorOptions);
                            cms.Invalidate();
                            cms.Size = GetPreferredSize(ClientSize);
                            cms.Show(Cursor.Position);

                            clickedObject = SceneObjects[i];
                            goodBoy = false;
                           
                        }
                        else
                        {
                            goodBoy = true;
                        }

                        break;
                    }
                }
            }
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
            double framerate = Editor.GetFrameRate;
            
            base.Draw();
            Matrix transformMatrix = cam.Camera.GetViewMatrix();
            BackgroundColor = Color.Black;
            Editor.graphics.Clear(BackgroundColor);
            Editor.spriteBatch.Begin(transformMatrix: transformMatrix);

            if (DrawGrid)
            {
                Color c = Color.Black;
                c.A = 128;
                for (float i = 0; i < 768; i += GridSizeRender.Y)
                {
                    for (float j = 0; j < 1024; j += GridSizeRender.X)
                    {
                        i = (float)Math.Round(i);
                        j = (float)Math.Round(j);
                        Editor.spriteBatch.DrawRectangle(new RectangleF(j, i, GridSizeRender.X, GridSizeRender.Y), c, 1 );
                    }
                }
            }

            Editor.spriteBatch.DrawRectangle(new RectangleF(new Point2(0, 0), new Size2(Form1.width, Form1.height)), Color.White, 2);

            Matrix view = cam.Camera.GetViewMatrix();
            Matrix projection = m;

           basicEffect.World = world;
            basicEffect.View = view;
            basicEffect.Projection = projection;
            basicEffect.VertexColorEnabled = true;

            foreach (GameObject o in SceneObjects)
            {
                 o.EvtDraw(Editor.spriteBatch, Editor.Font, o.Sprite.Texture, vertexBuffer, basicEffect);

                 if (o == clickedObject)
                 {
                     Editor.spriteBatch.DrawRectangle(new RectangleF(o.Position, new Size2(o.Sprite.ImageRectangle.Width, o.Sprite.ImageRectangle.Height)),Color.White, 2);
                 }
            }

  
            Editor.spriteBatch.DrawString(Editor.Font, "Mouse X: " +Math.Round(MousePositionTranslated.X) + "\nMouse Y: " + Math.Round(MousePositionTranslated.Y), new Vector2(200, 200), Color.White);

            Editor.spriteBatch.DrawString(Editor.Font, framerate.ToString("F1"), new Vector2(100, 100), Color.White);



            Editor.spriteBatch.End();

          //  mpb.world = world;
          //  mpb.view = view;
          //  mpb.projection = projection;
         // mpb.TransformMatrix = transformMatrix;
            
         //   mpb.TransformMatrix = transformMatrix;
          //  mpb.DrawString(new StringBuilder("Kokot"), new Vector2(100, 100), 15, Color.White);
         //   mpb.DrawCircle(new Vector2(100, 100), 64, Color.White, 64);
           // mpb.Flush();
            //mpb.Clear();

            killClick = false;
        }

        public void PreCheckMouse(MouseEventArgs e)
        {

        }

        public void WheelDown()
        {
            cam.TargetZoom -= 0.1f;
        }

        public void WheelUp()
        {
            cam.TargetZoom += 0.1f;
        }

        public void Undo()
        {
            if (stackedSteps.Count > 0)
            {
                SceneObjects = stackedSteps.Pop();
                editorForm.updateStack(stackedSteps.Count);
            }
        }

        public void GameClicked(MouseEventArgs e, MouseButtons mb)
        {
            MousePositionTranslated = cam.Camera.ScreenToWorld(MousePosition);

            if (mb == MouseButtons.Left)
            {
                goodBoy = true;
                if (clickedObject == null)
                {
                    if (SelectedObject != null)
                    {                       
                        Vector2 vec = MousePositionTranslated;

                        if (DrawGrid)
                        {
                            vec = new Vector2((int) vec.X / 32 * 32, (int) vec.Y / 32 * 32);
                        }

                        if (!Input.KeyboardState.IsKeyDown(Keys.LeftShift) || Sgml.PlaceEmpty(vec))
                        {
                            if (Sgml.PlaceEmpty(vec))
                            {
                                GameObject o = (GameObject) Activator.CreateInstance(SelectedObject);
                                Spritesheet s = Sprites.FirstOrDefault(x => x.Name == o.Sprite.TextureSource);

                                if (!cmsOpen && SelectedObject != null)
                                {
                                    if (stackedSteps.Count > 31)
                                    {
                                        stackedSteps.Pop();
                                    }
                                    stackedSteps.Push(SceneObjects.ToList());
                                    editorForm.updateStack(stackedSteps.Count);

                                    o.OriginalType = SelectedObject;
                                    o.TypeString = SelectedObject.ToString();
                                    o.Sprite.Texture = s.Texture;
                                    o.Position = vec;
                                    o.Sprite.ImageRectangle =
                                        new Microsoft.Xna.Framework.Rectangle(0, 0, s.CellWidth, s.CellHeight);
                                    o.EvtCreate();


                                    SceneObjects.Add(o);
                                }

                                if (!Input.KeyboardState.IsKeyDown(Keys.LeftShift))
                                {
                                    clickedObject = o;
                                }
                            }
                        }

                        if (!Sgml.PlaceEmpty(vec) && !Input.KeyboardState.IsKeyDown(Keys.LeftShift))
                        {
                            // there's something cool at the position already, time to grab it
                            GameObject collidingObject = Sgml.InstancePlace(vec);

                            if (collidingObject != null)
                            {
                                clickedObject = collidingObject;
                                helpVec = new Vector2(-MousePositionTranslated.X + collidingObject.Position.X, -MousePositionTranslated.Y + collidingObject.Position.Y);
                                clickedVec = MousePositionTranslated;
                            }
                        }
                    }
                }
                else
                {
                    Vector2 vec = MousePositionTranslated;
                    vec = new Vector2(vec.X + helpVec.X, vec.Y + helpVec.Y);

                    if (DrawGrid)
                    {
                        vec = MousePositionTranslated;
                        vec.X -= (int)(clickedObject.Sprite.ImageRectangle.Width - 32) / 2;//16;
                        vec.Y -= (int)(clickedObject.Sprite.ImageRectangle.Height - 32) / 2;

                        vec = new Vector2((int)vec.X / 32  * 32, (int)vec.Y / 32 * 32);
                    }

                    if (!cmsOpen)
                    {
                        clickedObject.Position = vec;
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

                    if (r.Contains(vec) && Input.KeyboardState.IsKeyDown(Keys.LeftShift))
                    {
                        SceneObjects[i].EvtDelete();
                        SceneObjects.Remove(SceneObjects[i]);
                    }
                }
            }
        }

        public void RightClickMenuSelected(ToolStripItemClickedEventArgs e)
        {
            goodBoy = true;
            if (clickedObject != null)
            {
                clickedObject.EvtContextMenuSelected(e.ClickedItem);
                clickedObject = null;
            }
        }

        public void MoveView()
        {
            if (panView)
            {
                cam.TargetPosition = new Vector2(cam.Position.X + helpVec.X - MousePositionTranslated.X, cam.Position.Y + helpVec.Y - MousePositionTranslated.Y);
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

        public void cmsClosed()
        {
            cmsOpen = false;
            clickedObject = null;
        }

        public void cmsOpened()
        {
            cmsOpen = true;
        }
    }  
}
