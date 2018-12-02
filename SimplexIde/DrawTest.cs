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
using DarkUI.Collections;
using DarkUI.Controls;
using Microsoft.Xna.Framework;
using Microsoft.Xna.Framework.Graphics;
using Microsoft.Xna.Framework.Input;
using MonoGame.Extended;
using MonoGame.Extended.ViewportAdapters;
using MonoGame.Extended.Shapes;
using MonoGame.Forms.Controls;
using Newtonsoft.Json;
using SimplexCore;
using SimplexCore.Ext;
using SimplexResources.Objects;
using SimplexResources.Rooms;
using Bitmap = System.Drawing.Bitmap;
using ButtonState = Microsoft.Xna.Framework.Input.ButtonState;
using Color = Microsoft.Xna.Framework.Color;
using FillMode = Microsoft.Xna.Framework.Graphics.FillMode;
using Keys = Microsoft.Xna.Framework.Input.Keys;
using MessageBox = System.Windows.Forms.MessageBox;
using Point = SharpDX.Point;
using Rectangle = System.Drawing.Rectangle;
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
        public List<GameObject> selectedRectangleObjects = new List<GameObject>();
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
        public GameRoom currentRoom;
        public LayerTool lt;
        public RoomLayer selectedLayer;
        public List<RoomLayer> roomLayers = new List<RoomLayer>();
        public RectangleF selectionRectangle = new RectangleF();

        public Vector2 GridSize = new Vector2(32, 32);
        public Vector2 GridSizeRender = new Vector2(32, 32);
        public Form1 editorForm;
        public bool GameRunning = true;
        public Vector2 MousePrevious = new Vector2();

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

        public void RenderLayers(TreeView tv)
        {          
            tv.Nodes[0].Nodes.Clear();

            if (currentRoom != null)
            {
                GameRoom gr = (GameRoom) Activator.CreateInstance(currentRoom.GetType());

                foreach (RoomLayer rl in gr.Layers)
                {
                    tv.Nodes[0].Nodes.Add(new TreeNode(rl.Name));
                }
            }
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
                //cam.TargetPosition.Y -= 100;
            }

            if (Input.KeyPressed(Keys.D))
            {
              //  k += 1;
            }

            if (Input.KeyPressed(Keys.Q))
            {
               // cam.TargetZoom -= 0.1f;
            }

            foreach (GameObject o in SceneObjects)
            {
                if (o.Layer != null)
                {
                    if (o.Layer.Visible)
                    {
                        if (GameRunning || o == clickedObject)
                        {
                            o.EvtStep();
                        }
                    }
                }
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



            if (Input.KeyboardState.IsKeyDown(Keys.LeftControl))
            {
                selectedRectangleObjects.Clear();

                foreach (GameObject o in SceneObjects)
                {
                    RectangleF r = new RectangleF(o.Position, new Size2(o.Sprite.ImageRectangle.Width, o.Sprite.ImageRectangle.Height));

                    if (r.Intersects(selectionRectangle))
                    {
                        o.TempPosition = new Vector2(o.Position.X - MousePositionTranslated.X, o.Position.Y  - MousePositionTranslated.Y);
                        selectedRectangleObjects.Add(o);
                    }
                }
            }

            selectionRectangle = RectangleF.Empty;

            if (!cms.Visible)
            {
                clickedObject = null;
            }

            panView = false;
        }

        public void ClickLock(MouseButtons btn)
        {
            mouseLocked = true;
            MousePrevious = MousePositionTranslated;

            if (selectedRectangleObjects.Count > 0)
            {
                bool flag = false;
                foreach (GameObject o in selectedRectangleObjects)
                {
                    RectangleF r = new RectangleF(o.Position,
                        new Size2(o.Sprite.ImageRectangle.Width, o.Sprite.ImageRectangle.Height));
                    if (r.Intersects(new RectangleF(MousePositionTranslated.X, MousePositionTranslated.Y, 4, 4)))
                    {
                        flag = true;
                        break;
                    }
                }

                if (!flag)
                {
                    selectedRectangleObjects.Clear();
                }
            }

            if (btn == MouseButtons.Left && Input.KeyboardState.IsKeyDown(Keys.LeftControl))
            {
                Vector2 vec = MousePositionTranslated;
                selectionRectangle.X = vec.X;
                selectionRectangle.Y = vec.Y;
            }

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

        public void InitializeNodes(ObservableList<DarkTreeNode> nodes)
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
           // Editor.spriteBatch.Begin(transformMatrix: transformMatrix);

            if (DrawGrid)
            {
                Color c = Color.Black;
                c.A = 128;
                Editor.spriteBatch.Begin(transformMatrix: transformMatrix);
                for (float i = 0; i < 768; i += GridSizeRender.Y)
                {
                    for (float j = 0; j < 1024; j += GridSizeRender.X)
                    {
                        i = (float)Math.Round(i);
                        j = (float)Math.Round(j);
                        Editor.spriteBatch.DrawRectangle(new RectangleF(j, i, GridSizeRender.X, GridSizeRender.Y), c, 1 );
                    }
                }

                Editor.spriteBatch.End();
            }

            foreach (RoomLayer rl in roomLayers)
            {
                if (rl.LayerType == RoomLayer.LayerTypes.typeTile)
                {
                    Color c = Color.White;
                    c.A = 128;
                    Editor.spriteBatch.Begin(transformMatrix: transformMatrix);
                    for (float i = 0; i < 768; i += GridSizeRender.Y)
                    {
                        for (float j = 0; j < 1024; j += GridSizeRender.X)
                        {
                            i = (float)Math.Round(i);
                            j = (float)Math.Round(j);
                            Editor.spriteBatch.DrawRectangle(new RectangleF(j, i, GridSizeRender.X, GridSizeRender.Y), c, 1);
                        }
                    }

                    Editor.spriteBatch.End();
                }
            }

            //Editor.spriteBatch.DrawRectangle(new RectangleF(new Point2(0, 0), new Size2(Form1.width, Form1.height)), Color.White, 2);

            Matrix view = cam.Camera.GetViewMatrix();
            Matrix projection = m;

            basicEffect.World = world;
            basicEffect.View = view;
            basicEffect.Projection = projection;
            basicEffect.VertexColorEnabled = true;

            try
            {
                List<GameObject> sortedObjects = SceneObjects.OrderBy(x => x.Layer.Depth).ToList();
                foreach (GameObject o in sortedObjects)
                {
                    if (o.Layer != null)
                    {
                        if (o.Layer.Visible)
                        {
                            //if (GameRunning || o == clickedObject)
                            {
                                o.EvtDraw(Editor.spriteBatch, Editor.Font, o.Sprite.Texture, vertexBuffer, basicEffect,
                                    transformMatrix);

                                RectangleF r = new RectangleF(o.Position,
                                    new Size2(o.Sprite.ImageRectangle.Width, o.Sprite.ImageRectangle.Height));

                                if (o == clickedObject || r.Intersects(selectionRectangle) ||
                                    selectedRectangleObjects.Contains(o))
                                {
                                    Editor.spriteBatch.Begin(transformMatrix: transformMatrix);
                                    Editor.spriteBatch.DrawRectangle(
                                        new RectangleF(o.Position,
                                            new Size2(o.Sprite.ImageRectangle.Width, o.Sprite.ImageRectangle.Height)),
                                        Color.White,
                                        2);
                                    Editor.spriteBatch.End();
                                }
                            }
                        }
                    }
                }
            }
            catch (Exception e)
            {

            }

            if (Input.KeyboardState.IsKeyDown(Keys.LeftControl))
            {
                Editor.spriteBatch.Begin(transformMatrix: transformMatrix);
                Editor.spriteBatch.DrawRectangle(selectionRectangle, Color.White, 2);
                Editor.spriteBatch.End();
            }
            //Editor.spriteBatch.DrawString(Editor.Font, "Mouse X: " +Math.Round(MousePositionTranslated.X) + "\nMouse Y: " + Math.Round(MousePositionTranslated.Y), new Vector2(200, 200), Color.White);

            //Editor.spriteBatch.DrawString(Editor.Font, framerate.ToString("F1"), new Vector2(100, 100), Color.White);



           // Editor.spriteBatch.End();

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

        public static Texture2D ConvertToTexture(System.Drawing.Bitmap b, GraphicsDevice graphicsDevice)
        {
            Texture2D tx = null;
            using (MemoryStream s = new MemoryStream())
            {
                b.Save(s, System.Drawing.Imaging.ImageFormat.Png);
                s.Seek(0, SeekOrigin.Begin);
                tx = Texture2D.FromStream(graphicsDevice, s);
            }
            return tx;
        }

        public void GameClicked(MouseEventArgs e, MouseButtons mb)
        {
            MousePositionTranslated = cam.Camera.ScreenToWorld(MousePosition);

            if (mb == MouseButtons.Left)
            {
                goodBoy = true;
                Vector2 vec = MousePositionTranslated;


                if (DrawGrid)
                {
                    vec = new Vector2((int)vec.X / 32 * 32, (int)vec.Y / 32 * 32);
                }

                if (Input.KeyboardState.IsKeyDown(Keys.LeftControl))
                {
                    selectionRectangle.Width = -selectionRectangle.X + vec.X;
                    selectionRectangle.Height = -selectionRectangle.Y + vec.Y;
                }
                else if (clickedObject == null)
                {
                    if (selectedRectangleObjects.Count > 0)
                    {
                        bool flag = true;

                        if (flag)
                        {
                            if (selectedRectangleObjects.Count > 0)
                            {
                                foreach (GameObject o in selectedRectangleObjects)
                                {
                                    o.Position += new Vector2(vec.X - MousePrevious.X, vec.Y - MousePrevious.Y);
                                }
                            }
                        }
                        else
                        {
                            selectedRectangleObjects.Clear();
                            
                        }
                    }
                    else
                    {                       
                        if (!Input.KeyboardState.IsKeyDown(Keys.LeftShift) || Sgml.PlaceEmpty(vec))
                        {
                            if (Sgml.PlaceEmpty(vec))
                            {
                                if (SelectedObject != null)
                                {
                                    GameObject o = (GameObject) Activator.CreateInstance(SelectedObject);

                                    Spritesheet s = new Spritesheet();
                                    if (o.Sprite != null)
                                    {
                                        s = Sprites.FirstOrDefault(x => x.Name == o.Sprite.TextureSource);
                                    }

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

                                        if (s == null)
                                        {
                                            Texture2D tx = ConvertToTexture(Properties.Resources.Question_16x,
                                                GraphicsDevice);


                                            o.Sprite = new Sprite();
                                            o.Sprite.Texture = tx;
                                            o.Sprite.ImageRectangle = new Microsoft.Xna.Framework.Rectangle(0, 0, 16, 16);
                                        }
                                        else
                                        {
                                            o.Sprite.Texture = s.Texture;
                                            o.Sprite.ImageRectangle = new Microsoft.Xna.Framework.Rectangle(0, 0, s.CellWidth, s.CellHeight);
                                        }

                                        o.Sprite.TextureRows = s.Rows;
                                        o.Sprite.TextureCellsPerRow = s.Texture.Width / s.CellWidth;
                                        o.Sprite.ImageSize = new Vector2(s.CellWidth, s.CellHeight);
                                        o.Sprite.FramesCount = Math.Max((s.Texture.Width / s.CellWidth) * (s.Texture.Height / s.CellHeight) - 1, 1);
                                        o.FramesCount = Math.Max(o.Sprite.FramesCount - 1, 1);
                                        o.Sprite.cellW = s.CellHeight;
                                        o.Sprite.cellH = s.CellWidth;

                                        o.Position = new Vector2(vec.X - s.CellWidth / 2f, vec.Y - s.CellHeight / 2f);
                                        o.Sprite.ImageRectangle =
                                            new Microsoft.Xna.Framework.Rectangle(0, 0, s.CellWidth, s.CellHeight);
                                        o.LayerName = selectedLayer.Name;
                                        o.Layer = selectedLayer;
                                        o.EvtCreate();


                                        SceneObjects.Add(o);

                                      //  SceneObjects = SceneObjects.OrderBy(x => x.Layer.Depth).ToList();
                                    }

                                    if (!Input.KeyboardState.IsKeyDown(Keys.LeftShift))
                                    {
                                        clickedObject = o;
                                    }
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
                    vec = MousePositionTranslated;
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

            MousePrevious = MousePositionTranslated;
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
            roomLayers.Clear();
            
        }

        public void LoadGame(string path)
        {
            bool flag = false;
            // First we fuck current scene
            ClearAll();

            // Before loading layers, we load tilesets descriptor
            List<Tileset> tilesets = JsonConvert.DeserializeObject<List<Tileset>>(File.ReadAllText("../../../SimplexRpgEngine3/TilesetsDescriptor.json"));

            // Load layers
            if (lt.dtv.Nodes.Count > 0)
            {
                lt.dtv.Nodes[0].Nodes.Clear();
            }


            if (currentRoom != null)
            {
                GameRoom gr = (GameRoom)Activator.CreateInstance(currentRoom.GetType());
                selectedLayer = gr.Layers[0];
                int currentDepth = 0;
                foreach (RoomLayer rl in gr.Layers)
                {
                    DarkTreeNode dtn = new DarkTreeNode(rl.Name);
                    dtn.Tag = dtn;
                    dtn.Tag = "";

                    if (rl.LayerType == RoomLayer.LayerTypes.typeObject)
                    {
                        dtn.Icon = (System.Drawing.Bitmap) Properties.Resources.ResourceManager.GetObject("WorldLocal_16x");
                    }
                    else if (rl.LayerType == RoomLayer.LayerTypes.typeAsset)
                    {
                        dtn.Icon = (System.Drawing.Bitmap)Properties.Resources.ResourceManager.GetObject("Image_16x");
                    }
                    else
                    {
                        dtn.Icon = (System.Drawing.Bitmap)Properties.Resources.ResourceManager.GetObject("MapLineLayer_16x");
                    }

                    rl.Depth = currentDepth;
                    currentDepth += 100;
                    roomLayers.Add(rl);
                    lt?.dtv.Nodes[0].Nodes.Add(dtn);
                }
            }
            else
            {
                flag = true;
            }

            // we need to initialize layers by type
            foreach (RoomLayer rl in roomLayers)
            {
                if (rl.LayerType == RoomLayer.LayerTypes.typeTile)
                {                 
                    // Start with empty cell data and load stuff later on
                    ((TileLayer)rl).Data = new int[(int)currentRoom.Size.X / 32, (int)currentRoom.Size.Y / 32];

                    // Now select correct tileset and assign it to this.. well tileset
                    Tileset tl = tilesets.FirstOrDefault(x => x.Name == ((TileLayer) rl).TilelistName);

                    // this can fail so check for that
                    if (tl != null)
                    {
                        // all good
                        ((TileLayer) rl).Tileset = tl;
                    }
                }
            }

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

                currentRoom = rawData.Room;

                // Time to load babies
                foreach (GameObject g in rawData.Objects)
                {
                    Spritesheet s = Sprites.FirstOrDefault(x => x.Name == g.Sprite.TextureSource);

                    g.EvtLoad();
                    g.Sprite.Texture = s.Texture;
                    g.Sprite.ImageRectangle = new Microsoft.Xna.Framework.Rectangle(0, 0, s.CellWidth, s.CellHeight);
                    g.Sprite.TextureRows = s.Rows;
                    g.Sprite.TextureCellsPerRow = s.Texture.Width / s.CellWidth;
                    g.Sprite.ImageSize = new Vector2(s.CellWidth, s.CellHeight);
                    g.Sprite.FramesCount = (s.Texture.Width / s.CellWidth) * (s.Texture.Height / s.CellHeight) - 1;
                    g.FramesCount = g.Sprite.FramesCount - 1;
                    g.Sprite.cellW = s.CellHeight;
                    g.Sprite.cellH = s.CellWidth;

                    g.Layer = roomLayers.FirstOrDefault(x => x.Name == g.LayerName);

                    SceneObjects.Add(g);
                }

            }

            if (flag)
            {
                if (currentRoom != null)
                {
                    GameRoom gr = (GameRoom)Activator.CreateInstance(currentRoom.GetType());
                    selectedLayer = gr.Layers[0];
                    foreach (RoomLayer rl in gr.Layers)
                    {
                        DarkTreeNode dtn = new DarkTreeNode(rl.Name);
                        dtn.Tag = dtn;
                        dtn.Tag = "";

                        if (rl.LayerType == RoomLayer.LayerTypes.typeObject)
                        {
                            dtn.Icon = (System.Drawing.Bitmap)Properties.Resources.ResourceManager.GetObject("WorldLocal_16x");
                        }
                        else if (rl.LayerType == RoomLayer.LayerTypes.typeAsset)
                        {
                            dtn.Icon = (System.Drawing.Bitmap)Properties.Resources.ResourceManager.GetObject("Image_16x");
                        }
                        else
                        {
                            dtn.Icon = (System.Drawing.Bitmap)Properties.Resources.ResourceManager.GetObject("MapLineLayer_16x");
                        }

                        lt?.dtv.Nodes[0].Nodes.Add(dtn);
                    }
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
