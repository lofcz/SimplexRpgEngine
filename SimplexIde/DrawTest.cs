using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Windows.Forms.VisualStyles;
using System.Xml.Serialization;
using DarkUI.Collections;
using DarkUI.Controls;
using DarkUI.Docking;
using DarkUI.Forms;
using Microsoft.Xna.Framework;
using Microsoft.Xna.Framework.Audio;
using Microsoft.Xna.Framework.Graphics;
using Microsoft.Xna.Framework.Input;
using Microsoft.Xna.Framework.Media;
using MonoGame.Extended;
using MonoGame.Extended.ViewportAdapters;
using MonoGame.Extended.Shapes;
using MonoGame.Forms.Controls;
using Newtonsoft.Json;
using SimplexCore;
using SimplexCore.Ext;
using SimplexIde.Properties;
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

namespace SimplexIde
{
    public class DrawTest : MonoGameControl
    {
        public Type SelectedObject = null;
        public List<GameObject> SceneObjects = new List<GameObject>();
        public List<TextureReference> Textures = new List<TextureReference>();
        public bool DrawGrid;
        GameTime g = new GameTime();
        public static Color BackgroundColor = Color.CornflowerBlue;
        public List<Spritesheet> Sprites = new List<Spritesheet>();
        OrthographicCamera camera;
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
        public DarkContextMenu cms;
        private bool killClick = false;
        private bool cmsOpen = false;
        private bool goodBoy = false;
        Stack<List<GameObject>> stackedSteps = new Stack<List<GameObject>>(32);
        public static DynamicVertexBuffer vertexBuffer;
        public static BasicEffect basicEffect;
        private float k = 0;
        private VertexPositionColor[] _vertexPositionColors;
        Matrix world = Matrix.Identity;
        private Matrix m;
        private SimplexCore.Ext.MgPrimitiveBatcher mpb;
        public GameRoom currentRoom;
        public LayerTool lt = null;
        public RoomLayer selectedLayer;
        public List<RoomLayer> roomLayers = new List<RoomLayer>();
        public RectangleF selectionRectangle = new RectangleF();

        public Vector2 GridSize = new Vector2(32, 32);
        public Vector2 GridSizeRender = new Vector2(32, 32);
        public Form1 editorForm;
        public bool GameRunning = true;
        public Vector2 MousePrevious = new Vector2();
        public AutotileDefinition currentAutotile = null;
        public TileLayer currentTileLayer = null;
        public RoomLayer lastLayer = null;
        public Keys lastKey = Keys.None;
        public ToolStripItemCollection toolStripItems = new ToolStripItemCollection(new ToolStrip(), new ToolStripItem[] {});

        SpatialHash sh = new SpatialHash() {CellSize = 128, Cols = 20, Rows = 20};
        private GlobalKeyboardHook _globalKeyboardHook;
        public List<Tileset> tilesets;
        public RoomsControl roomsControl;
        RectangleF generalRectangle = RectangleF.Empty;
        Effect effect;
        public List<SoundReference> audioList = new List<SoundReference>();
        public Rectangle TilesetSelectedRenRectangle = Rectangle.Empty;
        public Texture2D tileTexture = null;
        public int SheetX = 0;
        public int SheetY = 0;
        public bool UpdateRunning = true;
        private RenderTarget2D midBuffer = null;
        public List<Effect> shaders = new List<Effect>();
        public List<SoundDescriptor> Sounds = null;
        public List<ShaderDescriptor> ShaderDescriptors = null;
        public List<VideoDescriptor> VideosDescriptors = null;
        public List<VideoExtended> Videos = new List<VideoExtended>();
        private Thread thread;
        string[] lastProjects;
        public VideoPlayer videoPlayer = null;
        public GameObject lastClickedObject = null;
        public RectangleF GeneralRectangle2 = RectangleF.Empty;
        private GameObject Transformingobject = null;
        private int Transformingside = -1;
        Vector2 Transformrelative = Vector2.One;
        private bool readyToDeselect = false;
        private bool allGood = false;
        Vector2 helpVec2 = Vector2.One;

        Cursor ScaleCursor = new Cursor((Resources.cursor_scale_16_16).GetHicon());


        protected override void Initialize()
        {
            base.Initialize();
               
            Sgml.SceneObjects = SceneObjects;
            Sgml.roomLayers = roomLayers;
            Sgml.Textures = Textures;
            Sgml.RoomEditor = this;
            Sgml.RoomEditorEditor = Editor;

            camera = new OrthographicCamera(Editor.graphics);
            basicEffect = new BasicEffect(Editor.graphics);

            cam.Camera = camera;
            cam.Position = Vector2.Zero;
            cam.TargetPosition = Vector2.Zero;
            cam.TransformSpeed = 0.1f;

            prevState = Keyboard.GetState();
            basicEffect = new BasicEffect(GraphicsDevice);
        
            vertexBuffer = new DynamicVertexBuffer(GraphicsDevice, typeof(VertexPositionColor), 1000, BufferUsage.WriteOnly);
            m = Matrix.CreateOrthographicOffCenter(0, GraphicsDevice.Viewport.Width, GraphicsDevice.Viewport.Height, 0, 0, -1);
            mpb = new MgPrimitiveBatcher(Editor.graphics, Editor.Font);
            _globalKeyboardHook = new GlobalKeyboardHook();
            _globalKeyboardHook.KeyboardPressed += OnKeyPressed;

            Sgml.sh = sh;
            Sgml.GraphicsDevice = GraphicsDevice;

            midBuffer = new RenderTarget2D(GraphicsDevice, Width, Height);

            if (File.Exists("idecache.simplexcache"))
            {
                lastProjects = File.ReadAllLines("idecache.simplexcache");
            }
            else
            {
                lastProjects = null;
            }

            videoPlayer = new VideoPlayer(GraphicsDevice);
            Sgml.videoPlayer = videoPlayer;
        }

        private void OnKeyPressed(object sender, GlobalKeyboardHookEventArgs e)
        {
            Input.PressDirect(e.KeyboardData.VirtualCode);
        }

        public void Rsize()
        {
            // Fix weird errors folks are getting with this method
            if (Editor != null)
            {
                Editor.graphics.Viewport = new Viewport(0, 0, this.Width, this.Height);
                m = Matrix.CreateOrthographicOffCenter(0, GraphicsDevice.Viewport.Width, GraphicsDevice.Viewport.Height,
                    0, 0, -1);
            }
        }

        protected override void Update(GameTime gameTime)
        {
            if (Keyboard.GetState().IsKeyDown(Keys.Escape))
            {
                //if (editorForm.renderSize != Size.)
                {
                    Location = editorForm.renderPos;
                    Size = editorForm.renderSize;
                }
            }

            if (UpdateRunning)
            {
                var originalPos = cam.Camera.Position;
                var originalZoom = cam.Camera.Zoom;

                Matrix view = cam.Camera.GetViewMatrix();

                cam.Camera.Position = new Vector2(0, 0);
                cam.Camera.Zoom = 1;

                Matrix normalizedMatrix = cam.Camera.GetViewMatrix();

                cam.Camera.Position = originalPos;
                cam.Camera.Zoom = originalZoom;

                // Matrix projection = m;

                Sgml.world = world;
                Sgml.view = view;
                Sgml.normalizedMatrix = normalizedMatrix;

                KeyboardState ks = new KeyboardState();
                Keys[] keys = ks.GetPressedKeys();

                if (ks.IsKeyUp(lastKey))
                {
                    lastKey = Keys.None;
                }

                if (keys.Length > 0 && lastKey == Keys.None)
                {
                    lastKey = keys[0];
                    var keyValue = keys[0].ToString();
                    Sgml.keyboard_string += keyValue;
                }

                MousePositionTranslated = cam.Camera.ScreenToWorld(MousePosition);
                GridSizeRender = new Vector2(SimplexMath.Lerp(GridSizeRender.X, GridSize.X, 0.2f),
                    SimplexMath.Lerp(GridSizeRender.Y, GridSize.Y, 0.2f));

                Input.KeyboardState = Keyboard.GetState();

                g = gameTime;
                base.Update(gameTime);

                cam.UpdatePosition();

                sh.UnregisterAll();
                GameObject[] obj = SceneObjects.ToArray();
                for (var i = 0; i < obj.Length; i++)
                {
                    sh.RegisterObject(obj[i]);

                    if (GameRunning || obj[i] == clickedObject)
                    {
                        Sgml.currentObject = obj[i];
                        obj[i].EvtStep();
                        obj[i].EvtDrawToSurfaces();
                    }
                }
            }
        }

        public void ToggleGrid(bool toggle)
        {
            DrawGrid = toggle;
        }

        public void ClickRelease(MouseButtons mb)
        {
            mouseLocked = false;

            if ((mb & MouseButtons.Left) != 0) { Input.ReleasedButtons[0] = 1; Input.PressedButtonsOnce[0] = 0; }
            if ((mb & MouseButtons.Right) != 0) { Input.ReleasedButtons[1] = 1; }
            if ((mb & MouseButtons.Middle) != 0) { Input.ReleasedButtons[2] = 1; }
            if ((mb & MouseButtons.None) != 0) { Input.ReleasedButtons[3] = 1; }
            if ((mb & MouseButtons.XButton1) != 0) { Input.ReleasedButtons[5] = 1; }
            if ((mb & MouseButtons.XButton2) != 0) { Input.ReleasedButtons[6] = 1; }

            Input.CheckAnyReleased();
            Transformingobject = null;

            if (Input.KeyboardState.IsKeyDown(Keys.LeftControl))
            {
                selectedRectangleObjects.Clear();

                foreach (GameObject o in SceneObjects)
                {
                    RectangleF r = new RectangleF(o.Position, new Size2(o.Sprite.ImageRectangle.Width, o.Sprite.ImageRectangle.Height));

                    if (r.Intersects(selectionRectangle))
                    {
                        o.TempPosition = new Vector2(o.Position.X - MousePositionTranslated.X, o.Position.Y - MousePositionTranslated.Y);
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
            allGood = true;
        }

        public void InitializeNodes(ObservableList<DarkTreeNode> nodes)
        {

        }

        protected override void Draw()
        {
            Sgml.drawFont = Editor.Font;

            double framerate = Editor.GetFrameRate;
            KeyboardState ks = Keyboard.GetState();
            Input.KeyboardState = ks;

            base.Draw();
            Matrix transformMatrix = cam.Camera.GetViewMatrix();
            BackgroundColor = Color.Black;
            Editor.graphics.Clear(BackgroundColor);
            Input.MousePosition = MousePositionTranslated;

            Sgml.currentRoom = currentRoom;
            Sgml.sb = Editor.spriteBatch;
            Sgml.vb = vertexBuffer;
            Sgml.be = basicEffect;
            Sgml.m = transformMatrix;
            Sgml.effect = effect;

            Matrix view = cam.Camera.GetViewMatrix();
            Matrix projection = m;

            basicEffect.World = world;
            basicEffect.View = view;
            basicEffect.Projection = projection;
            basicEffect.VertexColorEnabled = true;

            if (lastClickedObject != null)
            {
                if (Sgml.mouse_check_button_pressed(Sgml.MouseButtons.Left) && Input.KeyDown(Keys.LeftControl))
                {
                    float dir = (float)Sgml.point_direction(lastClickedObject.Position, Sgml.mouse);
                    lastClickedObject.ImageAngle = 360 - (dir );
                    lastClickedObject.ImageAngleTarget = 360 - (dir); 

                }
            }

            if (editorForm.projectFile == "")
            {
                Sgml.draw_text(new Vector2((Width / 2) - ((int)Sgml.string_width("Click to open a project") / 2), Height / 2 - 5), "Click to open a project");

                if (lastProjects == null)
                { 
                    Sgml.draw_text(new Vector2((Width / 2) - ((int)Sgml.string_width("Recently opened projects will appear here") / 2), Height / 2 + 15), "Recently opened projects will appear here");

                    if (Sgml.mouse_check_button_pressed(Sgml.MouseButtons.Left))
                    {
                        // Open project if no project is loaded
                        if (editorForm.projectFile == "")
                        {
                            editorForm.openFileDialog1.Filter = "Simplex project files | *.sproject";
                            if (editorForm.openFileDialog1.ShowDialog() == DialogResult.OK)
                            {
                                string path = editorForm.openFileDialog1.FileName;

                                // Try to load the project
                                SimplexProjectStructure sps = JsonConvert.DeserializeObject<SimplexProjectStructure>(File.ReadAllText(path));
                                LoadProject(sps, path);

                                editorForm.projectFile = path;
                                File.WriteAllText("idecache.simplexcache", path);
                            }
                        }
                    }
                }
                else
                {
                    int index = 0;
                    bool hit = false;
                    foreach (string s in lastProjects)
                    {
                        Color c = Color.White;

                        // check for hover
                        if (Sgml.point_in_rectangle(Sgml.mouse, new RectangleF(new Vector2((Width / 2) - ((int)Sgml.string_width(Path.GetFileNameWithoutExtension(s)) / 2), Height / 2 + 40 + 15 * index), new Size2((float)Sgml.string_width(Path.GetFileNameWithoutExtension(s)), 15))))
                        {
                            c = Color.CornflowerBlue;
                            hit = true;

                            if (Sgml.mouse_check_button_pressed(Sgml.MouseButtons.Left))
                            {
                                string path = s;

                                // Try to load the project
                                SimplexProjectStructure sps = JsonConvert.DeserializeObject<SimplexProjectStructure>(File.ReadAllText(path));
                                LoadProject(sps, path);

                                editorForm.projectFile = path;
                                File.WriteAllText("idecache.simplexcache", path);
                            }
                        }

                        Sgml.draw_set_color(c);
                        Sgml.draw_text(new Vector2((Width / 2) - ((int)Sgml.string_width(Path.GetFileNameWithoutExtension(s)) / 2), Height / 2 + 40 + 15 * index), Path.GetFileNameWithoutExtension(s));
                        Sgml.draw_set_color(Color.White);
                        index++;
                    }

                    if (Sgml.mouse_check_button_pressed(Sgml.MouseButtons.Left) && !hit)
                    {
                        // Open project if no project is loaded
                        if (editorForm.projectFile == "")
                        {
                            editorForm.openFileDialog1.Filter = "Simplex project files | *.sproject";
                            if (editorForm.openFileDialog1.ShowDialog() == DialogResult.OK)
                            {
                                string path = editorForm.openFileDialog1.FileName;

                                // Try to load the project
                                SimplexProjectStructure sps = JsonConvert.DeserializeObject<SimplexProjectStructure>(File.ReadAllText(path));
                                LoadProject(sps, path);

                                editorForm.projectFile = path;
                                File.WriteAllText("idecache.simplexcache", path);
                            }
                        }
                    }
                }
            }
            else if (UpdateRunning)
            {
                SimplexResources.Global.DrawStart();

                // Before render, resolve collisions
                foreach (GameObject go in SceneObjects.ToList())
                {
                    if (go.Colliders.Count > 0)
                    {
                        List<GameObject> possibleColliders = sh.ObjectsNearby(go);

                        // Check for collision with each object from possible colliders
                        foreach (GameObject c in possibleColliders)
                        {
                            if (c == go)
                            {
                                continue;
                            } // Discard self collisions

                            // Check for general rectangle collision 
                            if (c.CollisionContainer.Intersects(go.CollisionContainer))
                            {
                                // There is a possibility that two instances can collide
                                // 1) Get entry from collision tree
                                // 2) Detailed collisions
                                var entries = CollisionsTree.DefinedCollisionPairs.FirstOrDefault(x =>
                                    x.Key.Object == go.GetType() && x.Value.Object == c.GetType());

                                if (entries.Key != null)
                                {
                                    // Get colliders from names
                                    ColliderBase cb =
                                        go.Colliders.FirstOrDefault(x => x.Name == entries.Key.ColliderName);
                                    ColliderBase cb2 =
                                        c.Colliders.FirstOrDefault(x => x.Name == entries.Value.ColliderName);

                                    if ((cb.GetType() == typeof(ColliderRectangle) &&
                                         cb2.GetType() == typeof(ColliderCircle)))
                                    {
                                        if (cb is ColliderRectangle)
                                        {
                                            // Circle-rectangle collision
                                            if (ColliderCircle.RectangleIntersectsCircle((ColliderRectangle) cb,
                                                (ColliderCircle) cb2))
                                            {

                                                // Collision occured, fire event
                                                Sgml.currentObject = go;
                                                entries.Key.CollisionAction.Invoke(go, c);
                                                break;
                                                //Debug.WriteLine("TRIGGER");
                                            }
                                        }
                                    }

                                    if (cb.GetType() == typeof(ColliderRectangle) &&
                                        cb2.GetType() == typeof(ColliderRectangle))
                                    {
                                        if ((cb as ColliderRectangle).CollisionTransformed.Intersects((cb2 as ColliderRectangle).CollisionTransformed))
                                        {
                                            Sgml.currentObject = go;
                                            entries.Key.CollisionAction.Invoke(go, c);
                                            break;
                                        }
                                    }

                                    if (cb.GetType() == typeof(ColliderCircle) &&
                                        cb2.GetType() == typeof(ColliderCircle))
                                    {
                                        if (ColliderCircle.CircleInCircle(cb as ColliderCircle, cb2 as ColliderCircle))
                                        {
                                            Sgml.currentObject = go;
                                            entries.Key.CollisionAction.Invoke(go, c);
                                            break;
                                        }
                                    }
                                }
                            }
                        }
                    }
                }

                if (currentRoom != null)
                {
                    foreach (RoomLayer rl in currentRoom.Layers.ToList())
                    {
                        if (rl.Visible)
                        {
                            if (currentRoom.Layers.Count > 3)
                            {
                                var z = 1;
                            }
                            // ------------ positions doesn't matter here -------------
                            // Layer is object
                            if (rl is ObjectLayer)
                            {
                                foreach (GameObject o in ((ObjectLayer) rl).Objects.ToList())
                                {
                                    Sgml.currentObject = o;
                                    Sgml.realObject = o;
                                    o.PositionPrevious = o.Position;
                                    o.EvtDraw();

                                    ComputeRectanglesForInstance(o);

                                    if (o == lastClickedObject)
                                    {
                                        int flag = -1;

                                        Color c1 = Color.CornflowerBlue;
                                        Color c2 = Color.CornflowerBlue;
                                        Color c3 = Color.CornflowerBlue;
                                        Color c4 = Color.CornflowerBlue;

                                        if (Transformingobject != null)
                                        {
                                            if (Transformingside == 1)
                                            {
                                                c1 = Color.Red;
                                            }

                                            if (Transformingside == 2)
                                            {
                                                c2 = Color.Red;
                                            }

                                            if (Transformingside == 3)
                                            {
                                                c3 = Color.Red;
                                            }

                                            if (Transformingside == 4)
                                            {
                                                c4 = Color.Red;
                                            }
                                        }


                                        // check for mouse in active area
                                        if (o.ImageAngle == 0)
                                        {
                                            if ((Sgml.point_in_rectangle(Sgml.mouse, GeneralRectangle2) && !Sgml.point_in_rectangle(Sgml.mouse, generalRectangle)))
                                            {
                                                //Cursor = ScaleCursor;

                                                if (o.ImageAngle == 0)
                                                {
                                                    if (Sgml.point_in_rectangle(Sgml.mouse, new RectangleF(GeneralRectangle2.Position, new Size2(generalRectangle.Width, 4))))
                                                    {
                                                        c1 = Color.Red;
                                                        flag = 1;
                                                    }
                                                    else if (Sgml.point_in_rectangle(Sgml.mouse, new RectangleF(new Point2(GeneralRectangle2.Position.X + 4, GeneralRectangle2.Position.Y + generalRectangle.Height + 4), new Size2(generalRectangle.Width, 4))))
                                                    {
                                                        c3 = Color.Red;
                                                        flag = 3;
                                                    }
                                                    else if (Sgml.point_in_rectangle(Sgml.mouse, new RectangleF(new Point2(GeneralRectangle2.Position.X, GeneralRectangle2.Position.Y + 4), new Size2(4, generalRectangle.Height))))
                                                    {
                                                        c2 = Color.Red;
                                                        flag = 2;
                                                    }
                                                    else if (Sgml.point_in_rectangle(Sgml.mouse, new RectangleF(new Point2(GeneralRectangle2.Position.X + generalRectangle.Width + 4, GeneralRectangle2.Position.Y + 4), new Size2(4, generalRectangle.Height))))
                                                    {
                                                        c4 = Color.Red;
                                                        flag = 4;
                                                    }
                                                }

                                                //Sgml.draw_rectangle(new RectangleF(new Point2(GeneralRectangle2.Position.X + generalRectangle.Width + 4, GeneralRectangle2.Position.Y + 4), new Size2(4, generalRectangle.Height)), true);


                                                if (Sgml.mouse_check_button_pressed(Sgml.MouseButtons.Left))
                                                {
                                                    // scale start

                                                    if (Transformingobject == null)
                                                    {
                                                        Transformingside = flag;
                                                    }

                                                    Transformingobject = lastClickedObject;
                                                    Transformrelative = Sgml.mouse;
                                                }
                                            }
                                        }
                                        else
                                        {
                                            RotatedRectangle rr = new RotatedRectangle(Vector2.One, Vector2.One, Vector2.One, Vector2.One);
                                            Vector2 rPoint = new Vector2(generalRectangle.X + o.ImageOrigin.X * o.ImageScale.X, generalRectangle.Y + o.ImageOrigin.Y * o.ImageScale.Y);

                                            Vector2 r1 = Sgml.rotate_vector2(new Vector2(generalRectangle.Position.X, generalRectangle.Position.Y), rPoint, o.ImageAngle);
                                            Vector2 r2 = Sgml.rotate_vector2(new Vector2(generalRectangle.X + generalRectangle.Width, generalRectangle.Y), rPoint, o.ImageAngle);

                                            rr.Point1 = r1;
                                            rr.Point2 = r2;

                                            r2 = Sgml.rotate_vector2(new Vector2(generalRectangle.X, generalRectangle.Y - 4), rPoint, o.ImageAngle);

                                            rr.Point4 = r2;

                                            r1 = Sgml.rotate_vector2(new Vector2(generalRectangle.X + generalRectangle.Width, generalRectangle.Y - 4), rPoint, o.ImageAngle);

                                            rr.Point3 = r1;

                                            if (rr.Contains(Sgml.mouse))
                                            {
                                                c1 = Color.Red;
                                                flag = 1;
                                            }


                                            r1 = Sgml.rotate_vector2(new Vector2(generalRectangle.Position.X + generalRectangle.Width, generalRectangle.Position.Y), rPoint, o.ImageAngle);
                                            r2 = Sgml.rotate_vector2(new Vector2(generalRectangle.X + generalRectangle.Width + 4, generalRectangle.Y), rPoint, o.ImageAngle);

                                            rr.Point1 = r1;
                                            rr.Point2 = r2;

                                            r2 = Sgml.rotate_vector2(new Vector2(generalRectangle.X + generalRectangle.Width, generalRectangle.Y + generalRectangle.Height), rPoint, o.ImageAngle);

                                            rr.Point4 = r2;

                                            r1 = Sgml.rotate_vector2(new Vector2(generalRectangle.X + generalRectangle.Width + 4, generalRectangle.Y + generalRectangle.Height), rPoint, o.ImageAngle);

                                            rr.Point3 = r1;

                                            if (rr.Contains(Sgml.mouse))
                                            {
                                                c4 = Color.Red;
                                                flag = 4;
                                            }

                                            r1 = Sgml.rotate_vector2(new Vector2(generalRectangle.Position.X, generalRectangle.Position.Y + generalRectangle.Height), rPoint, o.ImageAngle);
                                            r2 = Sgml.rotate_vector2(new Vector2(generalRectangle.X + generalRectangle.Width, generalRectangle.Y + generalRectangle.Height), rPoint, o.ImageAngle);

                                            rr.Point1 = r1;
                                            rr.Point2 = r2;

                                            r2 = Sgml.rotate_vector2(new Vector2(generalRectangle.X, generalRectangle.Y + generalRectangle.Height + 4), rPoint, o.ImageAngle);

                                            rr.Point4 = r2;

                                            r1 = Sgml.rotate_vector2(new Vector2(generalRectangle.X + generalRectangle.Width, generalRectangle.Y + generalRectangle.Height + 4), rPoint, o.ImageAngle);

                                            rr.Point3 = r1;

                                            if (rr.Contains(Sgml.mouse))
                                            {
                                                c3 = Color.Red;
                                                flag = 3;
                                            }

                                            r1 = Sgml.rotate_vector2(new Vector2(generalRectangle.Position.X, generalRectangle.Position.Y), rPoint, o.ImageAngle);
                                            r2 = Sgml.rotate_vector2(new Vector2(generalRectangle.X - 4, generalRectangle.Y), rPoint, o.ImageAngle);

                                            rr.Point1 = r1;
                                            rr.Point2 = r2;

                                            r2 = Sgml.rotate_vector2(new Vector2(generalRectangle.X, generalRectangle.Y + generalRectangle.Height), rPoint, o.ImageAngle);

                                            rr.Point4 = r2;

                                            r1 = Sgml.rotate_vector2(new Vector2(generalRectangle.X - 4, generalRectangle.Y + generalRectangle.Height), rPoint, o.ImageAngle);

                                            rr.Point3 = r1;

                                            if (rr.Contains(Sgml.mouse))
                                            {
                                                c2 = Color.Red;
                                                flag = 2;
                                            }

                                           // o.rr = rr;


                                            if (flag != -1 && Sgml.mouse_check_button_pressed(Sgml.MouseButtons.Left))
                                            {
                                                // scale start

                                                if (Transformingobject == null)
                                                {
                                                    Transformingside = flag;
                                                }

                                                Transformingobject = lastClickedObject;
                                                Transformrelative = Sgml.mouse;
                                            }

                                            /* if (Sgml.point_in_rectangle_rotated(new Point2(Sgml.mouse.X, Sgml.mouse.Y), new RectangleF(GeneralRectangle2.Position, new Size2(generalRectangle.Width, 4)), o.ImageAngle, o.ImageOrigin))
                                             {
                                                 c1 = Color.Red;
                                                 flag = 1;
                                             }*/
                                        }

                                        if (!Input.KeyboardState.IsKeyDown(Keys.LeftControl))
                                        {
                                            Vector2 rPoint = new Vector2(generalRectangle.X + o.ImageOrigin.X * o.ImageScale.X, generalRectangle.Y + o.ImageOrigin.Y * o.ImageScale.Y);
                                            RotatedRectangle rr = new RotatedRectangle(Vector2.One, Vector2.One, Vector2.One, Vector2.One);

                                            Vector2 r1 = Sgml.rotate_vector2(new Vector2(generalRectangle.Position.X, generalRectangle.Position.Y), rPoint, o.ImageAngle);
                                            Vector2 r2 = Sgml.rotate_vector2(new Vector2(generalRectangle.X + generalRectangle.Width, generalRectangle.Y), rPoint, o.ImageAngle);

                                            Sgml.draw_line_color(r1, r2, c1, c1);
                                            rr.Point1 = r1;
                                            rr.Point2 = r2;

                                            r1 = Sgml.rotate_vector2(new Vector2(generalRectangle.Position.X, generalRectangle.Position.Y), rPoint, o.ImageAngle);
                                            r2 = Sgml.rotate_vector2(new Vector2(generalRectangle.X, generalRectangle.Y + generalRectangle.Height), rPoint, o.ImageAngle);
                                        
                                            Sgml.draw_line_color(r1, r2, c2, c2);
                                            rr.Point4 = r2;

                                            r1 = Sgml.rotate_vector2(new Vector2(generalRectangle.X, generalRectangle.Y + generalRectangle.Height), rPoint, o.ImageAngle);
                                            r2 = Sgml.rotate_vector2(new Vector2(generalRectangle.X + generalRectangle.Width, generalRectangle.Y + generalRectangle.Height), rPoint, o.ImageAngle);

                                            Sgml.draw_line_color(r1, r2, c3, c3);

                                            r1 = Sgml.rotate_vector2(new Vector2(generalRectangle.X + generalRectangle.Width, generalRectangle.Y + generalRectangle.Height), rPoint, o.ImageAngle);
                                            r2 = Sgml.rotate_vector2(new Vector2(generalRectangle.X + generalRectangle.Width, generalRectangle.Y), rPoint, o.ImageAngle);

                                            Sgml.draw_line_color(r1, r2, c4, c4);
                                            rr.Point3 = r1;

                                            o.rr = rr;
                                        }
                                        else
                                        {
                                            double d = Sgml.point_direction(generalRectangle.Position, Sgml.mouse);
                                            double dd = Sgml.max(generalRectangle.Width, generalRectangle.Height) / 2;

                                            Sgml.draw_circle_fast(new Vector2(generalRectangle.Position.X + o.ImageOrigin.X * o.ImageScale.X, generalRectangle.Position.Y + o.ImageOrigin.Y * o.ImageScale.Y), (int)Sgml.max(generalRectangle.Width, generalRectangle.Height), 24, Color.CornflowerBlue);
                                            Sgml.draw_line_color(new Vector2(generalRectangle.Position.X + o.ImageOrigin.X * o.ImageScale.X, generalRectangle.Position.Y + o.ImageOrigin.Y * o.ImageScale.Y), new Vector2((float)Sgml.lengthdir_x(dd, d) + generalRectangle.Position.X + o.ImageOrigin.X * o.ImageScale.X, (float)Sgml.lengthdir_y(dd, d) + generalRectangle.Position.Y + o.ImageOrigin.Y * o.ImageScale.Y), Color.Red, Color.Red);
                                        }
                                    }
                                }
                            }

                            // Layer is tile
                            if (rl is TileLayer)
                            {
                                Editor.spriteBatch.Begin(transformMatrix: transformMatrix, samplerState: SamplerState.PointWrap, sortMode: SpriteSortMode.Texture);
                                TileLayer tl = ((TileLayer) rl);

                                Vector2 tempVec = Vector2.One;                                

                                foreach (Tile t in tl.Tiles)
                                {
                                    tempVec.X = t.PosX * 32;
                                    tempVec.Y = t.PosY * 32;

                                    Editor.spriteBatch.Draw(tl.Tileset.Texture, tempVec, t.DrawRectangle, Color.White);
                                }

                                Editor.spriteBatch.End();
                            }
                        }
                    }
                }

                if (DrawGrid)
                {
                    Color c = Color.White;
                    c.A = 128;

                    for (float i = 0; i < 768; i += GridSizeRender.Y)
                    {
                        for (float j = 0; j < 1024; j += GridSizeRender.X)
                        {
                            i = (float)Math.Round(i);
                            j = (float)Math.Round(j);
                            Sgml.draw_rectangle(new RectangleF(j, i, GridSizeRender.X, GridSizeRender.Y), true);
                            // Editor.spriteBatch.DrawRectangle(new RectangleF(j, i, GridSizeRender.X, GridSizeRender.Y), c, 1);
                        }
                    }

                }

                if (ks.IsKeyDown(Keys.LeftControl) && lastClickedObject == null)
                {
                    Sgml.draw_rectangle(selectionRectangle, true);
                }

                Editor.spriteBatch.Begin();
                Editor.spriteBatch.DrawString(Editor.Font, framerate.ToString("F1"), new Vector2(10, 10), Color.White);
                Editor.spriteBatch.End();


                killClick = false;

                Sgml.sb = Editor.spriteBatch;
                Sgml.vb = vertexBuffer;
                Sgml.be = basicEffect;
                Sgml.m = transformMatrix;
                SimplexResources.Global.DrawEnd();

                Input.KeyboardStatePrevious = Keyboard.GetState();
                Input.Clear();
            }
        }

        void ComputeRectanglesForInstance(GameObject o)
        {
            generalRectangle.Width = o.Sprite.ImageRectangle.Width * o.ImageScale.X;
            generalRectangle.Height = o.Sprite.ImageRectangle.Height * o.ImageScale.Y;

            generalRectangle.X = o.Position.X - (o.ImageOrigin.X * o.ImageScale.X);
            generalRectangle.Y = o.Position.Y - (o.ImageOrigin.Y * o.ImageScale.Y);

            GeneralRectangle2.X = (generalRectangle.X) - 4;
            GeneralRectangle2.Y = (generalRectangle.Y) - 4;

            GeneralRectangle2.Width = generalRectangle.Width + 8;
            GeneralRectangle2.Height = generalRectangle.Height + 8;
        }

        bool CursorInInstanceDraggersArea(GameObject o)
        {
            if (o.ImageAngle == 0)
            {
                return Sgml.point_in_rectangle(Sgml.mouse, GeneralRectangle2);
            }

            RotatedRectangle rr = new RotatedRectangle(Vector2.One, Vector2.One, Vector2.One, Vector2.One);
            Vector2 rPoint = new Vector2(generalRectangle.X + o.ImageOrigin.X * o.ImageScale.X, generalRectangle.Y + o.ImageOrigin.Y * o.ImageScale.Y);

            Vector2 r1 = Sgml.rotate_vector2(new Vector2(generalRectangle.Position.X, generalRectangle.Position.Y), rPoint, o.ImageAngle);
            Vector2 r2 = Sgml.rotate_vector2(new Vector2(generalRectangle.X + generalRectangle.Width, generalRectangle.Y), rPoint, o.ImageAngle);

            rr.Point1 = r1;
            rr.Point2 = r2;

            r2 = Sgml.rotate_vector2(new Vector2(generalRectangle.X, generalRectangle.Y - 4), rPoint, o.ImageAngle);

            rr.Point4 = r2;

            r1 = Sgml.rotate_vector2(new Vector2(generalRectangle.X + generalRectangle.Width, generalRectangle.Y - 4), rPoint, o.ImageAngle);

            rr.Point3 = r1;

            if (rr.Contains(Sgml.mouse))
            {
                return true;
            }


            r1 = Sgml.rotate_vector2(new Vector2(generalRectangle.Position.X + generalRectangle.Width, generalRectangle.Position.Y), rPoint, o.ImageAngle);
            r2 = Sgml.rotate_vector2(new Vector2(generalRectangle.X + generalRectangle.Width + 4, generalRectangle.Y), rPoint, o.ImageAngle);

            rr.Point1 = r1;
            rr.Point2 = r2;

            r2 = Sgml.rotate_vector2(new Vector2(generalRectangle.X + generalRectangle.Width, generalRectangle.Y + generalRectangle.Height), rPoint, o.ImageAngle);

            rr.Point4 = r2;

            r1 = Sgml.rotate_vector2(new Vector2(generalRectangle.X + generalRectangle.Width + 4, generalRectangle.Y + generalRectangle.Height), rPoint, o.ImageAngle);

            rr.Point3 = r1;

            if (rr.Contains(Sgml.mouse))
            {
                return true;
            }

            r1 = Sgml.rotate_vector2(new Vector2(generalRectangle.Position.X, generalRectangle.Position.Y + generalRectangle.Height), rPoint, o.ImageAngle);
            r2 = Sgml.rotate_vector2(new Vector2(generalRectangle.X + generalRectangle.Width, generalRectangle.Y + generalRectangle.Height), rPoint, o.ImageAngle);

            rr.Point1 = r1;
            rr.Point2 = r2;

            r2 = Sgml.rotate_vector2(new Vector2(generalRectangle.X, generalRectangle.Y + generalRectangle.Height + 4), rPoint, o.ImageAngle);

            rr.Point4 = r2;

            r1 = Sgml.rotate_vector2(new Vector2(generalRectangle.X + generalRectangle.Width, generalRectangle.Y + generalRectangle.Height + 4), rPoint, o.ImageAngle);

            rr.Point3 = r1;

            if (rr.Contains(Sgml.mouse))
            {
                return true;
            }

            r1 = Sgml.rotate_vector2(new Vector2(generalRectangle.Position.X, generalRectangle.Position.Y), rPoint, o.ImageAngle);
            r2 = Sgml.rotate_vector2(new Vector2(generalRectangle.X - 4, generalRectangle.Y), rPoint, o.ImageAngle);

            rr.Point1 = r1;
            rr.Point2 = r2;

            r2 = Sgml.rotate_vector2(new Vector2(generalRectangle.X, generalRectangle.Y + generalRectangle.Height), rPoint, o.ImageAngle);

            rr.Point4 = r2;

            r1 = Sgml.rotate_vector2(new Vector2(generalRectangle.X - 4, generalRectangle.Y + generalRectangle.Height), rPoint, o.ImageAngle);

            rr.Point3 = r1;

            if (rr.Contains(Sgml.mouse))
            {
                return true;
            }

            return false;
        }

        public void PreCheckMouse(MouseEventArgs e)
        {
            // mouse moved
            if (Transformingobject != null)
            {
                if (!Input.KeyDown(Keys.LeftControl))
                {
                    if (Transformingside == 1)
                    {
                        float dif = 0;
                        float yd = Sgml.mouse.Y - Transformrelative.Y;
                        float xd = Sgml.mouse.X - Transformrelative.X;

                        if (Transformingobject.ImageAngle >= 45 && Transformingobject.ImageAngle < 135)
                        {
                            dif = (float)Sgml.point_distance(Sgml.mouse, Transformrelative) * Sgml.sign(xd);
                        }
                        else if (Transformingobject.ImageAngle >= 135 && Transformingobject.ImageAngle < 225)
                        {
                            dif = (float)Sgml.point_distance(Sgml.mouse, Transformrelative) * Sgml.sign(yd);
                        }
                        else if (Transformingobject.ImageAngle >= 225 && Transformingobject.ImageAngle < 315)
                        {
                            dif = (float)Sgml.point_distance(Sgml.mouse, Transformrelative) * -Sgml.sign(xd);
                        }
                        else
                        {
                            dif = (float)Sgml.point_distance(Sgml.mouse, Transformrelative) * -Sgml.sign(yd);
                        }


                        float height = Transformingobject.Sprite.ImageSize.Y;
                        float heightNew = dif + height;
                        float ratio = Math.Abs(dif / height);


                        float k = (Sgml.sign(dif)) * ratio;
                        Transformingobject.ImageScaleTarget.Y += k;
                        Transformingobject.ImageScale.Y += k;


                        Transformingobject.Y -= (dif) * (float)Math.Sin((Transformingobject.ImageAngle + 90) * Math.PI / 180) / 2f;
                        Transformingobject.X -= (dif) * (float)Math.Cos((Transformingobject.ImageAngle + 90) * Math.PI / 180) / 2f;
                    }
                    else if (Transformingside == 3)
                    {
                        float dif = 0;
                        float yd = Sgml.mouse.Y - Transformrelative.Y;
                        float xd = Sgml.mouse.X - Transformrelative.X;

                        if (Transformingobject.ImageAngle >= 45 && Transformingobject.ImageAngle < 135)
                        {
                            dif = (float)Sgml.point_distance(Sgml.mouse, Transformrelative) * -Sgml.sign(xd);
                        }
                        else if (Transformingobject.ImageAngle >= 135 && Transformingobject.ImageAngle < 225)
                        {
                            dif = (float)Sgml.point_distance(Sgml.mouse, Transformrelative) * -Sgml.sign(yd);
                        }
                        else if (Transformingobject.ImageAngle >= 225 && Transformingobject.ImageAngle < 315)
                        {
                            dif = (float)Sgml.point_distance(Sgml.mouse, Transformrelative) * Sgml.sign(xd);
                        }
                        else
                        {
                            dif = (float)Sgml.point_distance(Sgml.mouse, Transformrelative) * Sgml.sign(yd);
                        }

                        float height = Transformingobject.Sprite.ImageSize.Y;
                        float heightNew = dif + height;
                        float ratio = Math.Abs(dif / height);


                        float k = (Sgml.sign(dif)) * ratio;
                        Transformingobject.ImageScaleTarget.Y += k;
                        Transformingobject.ImageScale.Y += k;

                    }
                    else if (Transformingside == 2)
                    {
                        float dif = 0;
                        float yd = Sgml.mouse.Y - Transformrelative.Y;
                        float xd = Sgml.mouse.X - Transformrelative.X;

                        if (Transformingobject.ImageAngle >= 45 && Transformingobject.ImageAngle < 135)
                        {
                            dif = (float)Sgml.point_distance(Sgml.mouse, Transformrelative) * -Sgml.sign(xd);

                            if (Transformingobject.ImageAngle > 80)
                            {
                                dif = (float)Sgml.point_distance(Sgml.mouse, Transformrelative) * -Sgml.sign(yd);
                            }
                        }
                        else if (Transformingobject.ImageAngle >= 135 && Transformingobject.ImageAngle < 225)
                        {
                            dif = (float)Sgml.point_distance(Sgml.mouse, Transformrelative) * -Sgml.sign(yd);

                            if (Transformingobject.ImageAngle > 170)
                            {
                                dif = (float)Sgml.point_distance(Sgml.mouse, Transformrelative) * Sgml.sign(xd);
                            }
                        }
                        else if (Transformingobject.ImageAngle >= 225 && Transformingobject.ImageAngle < 315)
                        {
                            dif = (float)Sgml.point_distance(Sgml.mouse, Transformrelative) * Sgml.sign(xd);

                            if (Transformingobject.ImageAngle > 260)
                            {
                                dif = (float)Sgml.point_distance(Sgml.mouse, Transformrelative) * Sgml.sign(yd);
                            }
                        }
                        else
                        {
                            dif = (float)Sgml.point_distance(Sgml.mouse, Transformrelative) * -Sgml.sign(xd);
                        }

                        float height = Transformingobject.Sprite.ImageSize.X;
                        float heightNew = dif + height;
                        float ratio = Math.Abs(dif / height);


                        float k = (Sgml.sign(dif)) * ratio;
                        Transformingobject.ImageScaleTarget.X += k;
                        Transformingobject.ImageScale.X += k;

                        Transformingobject.Y -= (dif) * (float)Math.Sin((Transformingobject.ImageAngle) * Math.PI / 180) / 2f;
                        Transformingobject.X -= (dif) * (float)Math.Cos((Transformingobject.ImageAngle) * Math.PI / 180) / 2f;
                    }
                    else if (Transformingside == 4)
                    {
                        float dif = 0;
                        float yd = Sgml.mouse.Y - Transformrelative.Y;
                        float xd = Sgml.mouse.X - Transformrelative.X;

                        if (Transformingobject.ImageAngle >= 45 && Transformingobject.ImageAngle < 135)
                        {
                            dif = (float)Sgml.point_distance(Sgml.mouse, Transformrelative) * Sgml.sign(xd);

                            if (Transformingobject.ImageAngle > 60)
                            {
                                dif = (float)Sgml.point_distance(Sgml.mouse, Transformrelative) * Sgml.sign(yd);
                            }

                            if (Transformingobject.ImageAngle > 100)
                            {
                                dif = (float)Sgml.point_distance(Sgml.mouse, Transformrelative) * Sgml.sign(yd);
                            }
                        }
                        else if (Transformingobject.ImageAngle >= 135 && Transformingobject.ImageAngle < 225)
                        {
                            dif = (float)Sgml.point_distance(Sgml.mouse, Transformrelative) * Sgml.sign(yd);

                            if (Transformingobject.ImageAngle > 170)
                            {
                                dif = (float)Sgml.point_distance(Sgml.mouse, Transformrelative) * -Sgml.sign(xd);
                            }
                        }
                        else if (Transformingobject.ImageAngle >= 225 && Transformingobject.ImageAngle < 315)
                        {
                            dif = (float)Sgml.point_distance(Sgml.mouse, Transformrelative) * -Sgml.sign(xd);

                            if (Transformingobject.ImageAngle > 260)
                            {
                                dif = (float)Sgml.point_distance(Sgml.mouse, Transformrelative) * Sgml.sign(yd);
                            }


                            if (Transformingobject.ImageAngle > 290)
                            {
                                dif = (float)Sgml.point_distance(Sgml.mouse, Transformrelative) * -Sgml.sign(yd);
                            }
                        }
                        else
                        {
                            dif = (float)Sgml.point_distance(Sgml.mouse, Transformrelative) * Sgml.sign(xd);
                        }
                        float height = Transformingobject.Sprite.ImageSize.X;
                        float heightNew = dif + height;
                        float ratio = Math.Abs(dif / height);


                        float k = (Sgml.sign(dif)) * ratio;
                        Transformingobject.ImageScaleTarget.X += k;
                        Transformingobject.ImageScale.X += k;
                    }
                }

                Transformrelative = Sgml.mouse;
            }
        }

        public void WheelDown()
        {
            cam.TargetZoom -= 0.1f;
            cam.TargetZoom = (float)Sgml.clamp(cam.TargetZoom, 0.05, 10);
            Input.WheelDown = true;
        }

        public void WheelUp()
        {
            cam.TargetZoom += 0.1f;
            cam.TargetZoom = (float)Sgml.clamp(cam.TargetZoom, 0.05, 10);
            Input.WheelUp = true;
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

        public void DeleteAll()
        {
            sh.Clear();

            if (currentRoom != null)
            {
                foreach (RoomLayer rl in currentRoom.Layers)
                {
                    if (rl is ObjectLayer)
                    {
                        ObjectLayer ol = rl as ObjectLayer;
                        ol.Objects.Clear();
                    }
                }
            }
        }

        public void ClickLock(MouseButtons btn)
        {
            mouseLocked = true;
            MousePrevious = MousePositionTranslated;

            if ((btn & MouseButtons.Left) != 0) { Input.PressedButtonsOnce[0] = 1; Sgml.LastButton = Sgml.MouseButtons.Left;}
            if ((btn & MouseButtons.Right) != 0) { Input.PressedButtonsOnce[1] = 1; Sgml.LastButton = Sgml.MouseButtons.mb_right; }
            if ((btn & MouseButtons.Middle) != 0) { Input.PressedButtonsOnce[2] = 1; Sgml.LastButton = Sgml.MouseButtons.Middle; }
            if ((btn & MouseButtons.None) != 0) { Input.PressedButtonsOnce[3] = 1;}
            if ((btn & MouseButtons.XButton1) != 0) { Input.PressedButtonsOnce[5] = 1; Sgml.LastButton = Sgml.MouseButtons.mb_x1; }
            if ((btn & MouseButtons.XButton2) != 0) { Input.PressedButtonsOnce[6] = 1; Sgml.LastButton = Sgml.MouseButtons.mb_x2; }

            Input.CheckAnyPressedOnce();

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

            if (btn == MouseButtons.Left)
            {
                Vector2 vec = MousePositionTranslated;
                selectionRectangle.X = vec.X;
                selectionRectangle.Y = vec.Y;
            }

            if (btn == MouseButtons.Middle)
            {
                panView = true;
                helpVec2 = cam.Camera.ScreenToWorld(MousePosition);
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

                            foreach (string items in SceneObjects[i].EditorOptions)
                            {
                                if (items == "[magic_separator]")
                                {
                                    cms.Items.Add(new ToolStripSeparator());
                                }
                                else
                                {
                                    cms.Items.Add(items);
                                }
                            }

                            cms.Invalidate();
                            cms.Size = GetPreferredSize(ClientSize);
                            cms.Show(Cursor.Position);

                            clickedObject = SceneObjects[i];
                            lastClickedObject = clickedObject;

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

            allGood = true;
            if (lastClickedObject != null)
            {
                readyToDeselect = false;
                if (!Input.KeyDown(Keys.LeftControl))
                {
                    // check if we can deselect
                    // therefore run heuristic checks against currently selected instances 
                    // not in any active area? fuck you then

                    if (Sgml.PlaceEmpty(Sgml.mouse))
                    {
                        // also user might be in the draggers area so check that
                        ComputeRectanglesForInstance(lastClickedObject);

                        if (!CursorInInstanceDraggersArea(lastClickedObject))
                        {
                            readyToDeselect = true;
                        }
                    }
                }

                if (readyToDeselect)
                {
                    lastClickedObject = null;
                    Transformingobject = null;
                }

                allGood = readyToDeselect;
            }
        }


        public void GameClicked(MouseEventArgs e, MouseButtons mb)
        {
            if (editorForm.projectFile != "")
            {
                KeyboardState ks = Keyboard.GetState();

                if ((mb & MouseButtons.Left) != 0)
                {
                    Input.PressedButtonsOnce[0] = 1;
                    Sgml.LastButton = Sgml.MouseButtons.Left;
                }

                if ((mb & MouseButtons.Right) != 0)
                {
                    Input.PressedButtonsOnce[1] = 1;
                    Sgml.LastButton = Sgml.MouseButtons.mb_right;
                }

                if ((mb & MouseButtons.Middle) != 0)
                {
                    Input.PressedButtonsOnce[2] = 1;
                    Sgml.LastButton = Sgml.MouseButtons.Middle;
                }

                if ((mb & MouseButtons.None) != 0)
                {
                    Input.PressedButtonsOnce[3] = 1;
                }

                if ((mb & MouseButtons.XButton1) != 0)
                {
                    Input.PressedButtonsOnce[5] = 1;
                    Sgml.LastButton = Sgml.MouseButtons.mb_x1;
                }

                if ((mb & MouseButtons.XButton2) != 0)
                {
                    Input.PressedButtonsOnce[6] = 1;
                    Sgml.LastButton = Sgml.MouseButtons.mb_x2;
                }


                Input.CheckAnyPressed();

                MousePositionTranslated = cam.Camera.ScreenToWorld(MousePosition);

                if (mb == MouseButtons.Left)
                {
                    goodBoy = true;
                    Vector2 vec = MousePositionTranslated;


                    if (DrawGrid)
                    {
                        vec = new Vector2((int) vec.X / 32 * 32, (int) vec.Y / 32 * 32);
                    }

                    if (ks.IsKeyDown(Keys.LeftControl))
                    {
                        selectionRectangle.Width = -selectionRectangle.X + vec.X;
                        selectionRectangle.Height = -selectionRectangle.Y + vec.Y;

                    }
                    else if (clickedObject == null)
                    {
                        if (TilesetSelectedRenRectangle != Rectangle.Empty)
                        {
                            Vector2 m = MousePositionTranslated;


                            // optimize -> prefetch tiles which could be possibly colliding
                            int sx = (int)(m.X / 32);
                            int sy = (int)(m.Y / 32);
                            int mx = TilesetSelectedRenRectangle.Height / 32;
                            int my = TilesetSelectedRenRectangle.Width / 32;


                            List<Tile> possibleColliders = currentTileLayer.Tiles.FindAll(x => x.PosX >= sx && x.PosX <= sx + mx + 1 && x.PosY >= sy && x.PosY <= sy + my + 1);
                            
                            // Check if a chunk is selected, if so -> process one by one
                            for (var i = 0; i < mx; i++)
                            {
                                for (var j = 0; j < my; j++)
                                {
                                    int tx = (int) m.X / 32;
                                    int ty = (int) m.Y / 32;

                                    Tile alreadyT = possibleColliders.FirstOrDefault(x => x.PosX == tx + j && x.PosY == ty + i);

                                    if (alreadyT == null)
                                    {
                                        Tile t = new Tile();
                                        t.Bits = 16;
                                        t.DrawRectangle = new Microsoft.Xna.Framework.Rectangle(TilesetSelectedRenRectangle.X + j * 32, TilesetSelectedRenRectangle.Y + i * 32, 32, 32);
                                        t.SourceTexture = tileTexture;
                                        t.PosX = tx + j;
                                        t.PosY = ty + i;
                                        t.TileLayer = currentTileLayer;
                                        t.TileLayerName = t.TileLayer.Name;

                                        currentTileLayer.Tiles.Add(t);
                                    }
                                }
                            }

                            possibleColliders = null; // fcking trash everywhere, eat that GC
                        }
                        else if (currentAutotile == null)
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
                                bool placeEmpty = Sgml.PlaceEmpty(vec); // reduce collision checks needed

                                if (!ks.IsKeyDown(Keys.LeftShift) || placeEmpty)
                                {
                                    if (placeEmpty)
                                    {
                                        if (SelectedObject != null)
                                        {
                                            if (selectedLayer != null && selectedLayer.GetType() == typeof(ObjectLayer))
                                            {
                                                // there is a fair chance user is trying to scale / rotate some innocent object right now
                                                // so to fix us being dickheads spawning unintended instances we will perform fast (slow as fuck) check and if positive abort this shit
                                                if (allGood)
                                                {
                                                    GameObject o = (GameObject)Activator.CreateInstance(SelectedObject);

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
                                                            o.Sprite.ImageRectangle =
                                                                new Microsoft.Xna.Framework.Rectangle(0, 0, 16, 16);
                                                        }
                                                        else
                                                        {
                                                            o.Sprite.Texture = s.Texture;
                                                            o.Sprite.ImageRectangle =
                                                                new Microsoft.Xna.Framework.Rectangle(0, 0, s.CellWidth,
                                                                    s.CellHeight);
                                                        }

                                                        o.Sprite.TextureRows = s.Rows;
                                                        o.Sprite.TextureCellsPerRow = s.Texture.Width / s.CellWidth;
                                                        o.Sprite.ImageSize = new Vector2(s.CellWidth, s.CellHeight);
                                                        o.Sprite.FramesCount =
                                                            Math.Max(
                                                                (s.Texture.Width / s.CellWidth) *
                                                                (s.Texture.Height / s.CellHeight) - 1, 1);
                                                        o.FramesCount = Math.Max(o.Sprite.FramesCount - 1, 1);
                                                        o.Sprite.cellW = s.CellHeight;
                                                        o.Sprite.cellH = s.CellWidth;

                                                        o.Position = new Vector2(vec.X, vec.Y);
                                                        o.Sprite.ImageRectangle =
                                                            new Microsoft.Xna.Framework.Rectangle(0, 0, s.CellWidth,
                                                                s.CellHeight);
                                                        o.LayerName = selectedLayer.Name;
                                                        o.Layer = (ObjectLayer)selectedLayer;

                                                        Sgml.currentObject = o;
                                                        o.EvtCreate();
                                                        o.EvtCreateEnd();

                                                        o.Layer.Objects.Add(o);
                                                        SceneObjects.Add(o);
                                                        sh.RegisterObject(o);

                                                    }

                                                    if (!ks.IsKeyDown(Keys.LeftShift))
                                                    {
                                                        clickedObject = o;
                                                        lastClickedObject = o;
                                                    }
                                                }
                                               
                                            }
                                            else
                                            {
                                                if (selectedLayer == null)
                                                {
                                                    DarkMessageBox.Show("Select a layer to place instances", "Simplex Engine");
                                                }
                                                else 
                                                {
                                                    DarkMessageBox.Show("Object instances can only be placed when object layer is selected. ", "Simplex Engine");
                                                }
                                                
                                            }


                                        }


                                    }
                                }

                                helpVec = Vector2.Zero;

                                if (!placeEmpty && !ks.IsKeyDown(Keys.LeftShift))
                                {
                                    // there's something cool at the position already, time to grab it
                                    GameObject collidingObject = Sgml.instance_place(vec);

                                    if (collidingObject != null && Transformingobject == null)
                                    {
                                        clickedObject = collidingObject;
                                        lastClickedObject = clickedObject;

                                        helpVec = new Vector2(-MousePositionTranslated.X + collidingObject.X,
                                            -MousePositionTranslated.Y + collidingObject.Y);
                                        clickedVec = MousePositionTranslated;

                                        // load properties in the props tab
                                        editorForm.properties.RegisterControls(clickedObject.EditorProperties);
                                       // Sgml.show_debug_message("kokotí hlavička 69");

                                      
                                    }

                                   // Debug.WriteLine("ASD asd");
                                }
                                else
                                {

                                }
                            }
                        }
                        else
                        {
                            Vector2 m = MousePositionTranslated;

                            Tile alreadyT = currentTileLayer.Tiles.FirstOrDefault(x =>
                                x.PosX == (int) m.X / 32 && x.PosY == (int) m.Y / 32);

                            if (alreadyT == null)
                            {
                                Tile t = new Tile();
                                t.Bits = 16;
                                t.DrawRectangle = new Microsoft.Xna.Framework.Rectangle(0, 0, 32, 32);
                                t.SourceTexture = currentAutotile.Texture;
                                t.PosX = (int) m.X / 32;
                                t.PosY = (int) m.Y / 32;
                                t.TileLayer = currentTileLayer;
                                t.TileLayerName = t.TileLayer.Name;
                                t.SheetX = currentAutotile.X;
                                t.SheetY = currentAutotile.Y;
                                
                                currentTileLayer.Tiles.Add(t);

                                t = Autotile.UpdateTile(t, currentTileLayer);

                                // basic 4
                                Tile t1 = currentTileLayer.Tiles.FirstOrDefault(x =>
                                    x.PosX == t.PosX && x.PosY == t.PosY - 1); // N // 2
                                Tile t2 = currentTileLayer.Tiles.FirstOrDefault(x =>
                                    x.PosX == t.PosX && x.PosY == t.PosY + 1); // S // 64
                                Tile t3 = currentTileLayer.Tiles.FirstOrDefault(x =>
                                    x.PosX == t.PosX + 1 && x.PosY == t.PosY); // W // 16
                                Tile t4 = currentTileLayer.Tiles.FirstOrDefault(x =>
                                    x.PosX == t.PosX - 1 && x.PosY == t.PosY); // S // 8

                                // extended 4
                                Tile t5 = currentTileLayer.Tiles.FirstOrDefault(x =>
                                    x.PosX == t.PosX - 1 && x.PosY == t.PosY - 1); // EN // 1
                                Tile t6 = currentTileLayer.Tiles.FirstOrDefault(x =>
                                    x.PosX == t.PosX + 1 && x.PosY == t.PosY - 1); // WN // 4
                                Tile t7 = currentTileLayer.Tiles.FirstOrDefault(x =>
                                    x.PosX == t.PosX - 1 && x.PosY == t.PosY + 1); // ES // 32
                                Tile t8 = currentTileLayer.Tiles.FirstOrDefault(x =>
                                    x.PosX == t.PosX + 1 && x.PosY == t.PosY + 1); // WS // 128

                                if (t1 != null && t1.SheetX == t.SheetX && t1.SheetY == t.SheetY)
                                {
                                    Autotile.UpdateTile(t1, currentTileLayer);
                                }

                                if (t2 != null && t2.SheetX == t.SheetX && t2.SheetY == t.SheetY)
                                {
                                    Autotile.UpdateTile(t2, currentTileLayer);
                                }

                                if (t3 != null && t3.SheetX == t.SheetX && t3.SheetY == t.SheetY)
                                {
                                    Autotile.UpdateTile(t3, currentTileLayer);
                                }

                                if (t4 != null && t4.SheetX == t.SheetX && t4.SheetY == t.SheetY)
                                {
                                    Autotile.UpdateTile(t4, currentTileLayer);
                                }

                                if (t5 != null && t5.SheetX == t.SheetX && t5.SheetY == t.SheetY)
                                {
                                    Autotile.UpdateTile(t5, currentTileLayer);
                                }

                                if (t6 != null && t6.SheetX == t.SheetX && t6.SheetY == t.SheetY)
                                {
                                    Autotile.UpdateTile(t6, currentTileLayer);
                                }

                                if (t7 != null && t7.SheetX == t.SheetX && t7.SheetY == t.SheetY)
                                {
                                    Autotile.UpdateTile(t7, currentTileLayer);
                                }

                                if (t8 != null && t8.SheetX == t.SheetX && t8.SheetY == t.SheetY)
                                {
                                    Autotile.UpdateTile(t8, currentTileLayer);
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
                            vec.X -= (int) (clickedObject.Sprite.ImageRectangle.Width - 32) / 2; //16;
                            vec.Y -= (int) (clickedObject.Sprite.ImageRectangle.Height - 32) / 2;

                            vec = new Vector2((int) vec.X / 32 * 32, (int) vec.Y / 32 * 32);
                        }

                        if (!cmsOpen)
                        {
                            clickedObject.Position = vec;
                          ////  Debug.WriteLine("KOKOTI AKCE");
                        }
                    }
                }
                else if (mb == MouseButtons.Right)
                {
                    //  Debug.WriteLine("----");
                    Vector2 vec = MousePositionTranslated;
                    if (DrawGrid)
                    {
                        vec = new Vector2((int) vec.X / 32 * 32, (int) vec.Y / 32 * 32);
                    }

                    if (currentRoom != null)
                    {
                        if (currentTileLayer == null)
                        {
                            foreach (RoomLayer rl in currentRoom.Layers)
                            {
                                if (rl.Visible)
                                {
                                    if (rl is ObjectLayer ol)
                                    {
                                        if (ks.IsKeyDown(Keys.LeftShift))
                                        {
                                            for (var i = ol.Objects.Count - 1; i >= 0; i--)
                                            {
                                                if (ol.Objects[i].CollidingWithPoint(vec))
                                                {
                                                    SceneObjects.Remove(ol.Objects[i]);
                                                    ol.Objects[i].EvtDelete();
                                                    ol.Objects.Remove(ol.Objects[i]);
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        else
                        {
                            Tile alreadyT = currentTileLayer.Tiles.FirstOrDefault(x =>
                                x.PosX == (int) vec.X / 32 && x.PosY == (int) vec.Y / 32);

                            if (alreadyT != null)
                            {
                                Tile t = new Tile();
                                t.PosX = alreadyT.PosX;
                                t.PosY = alreadyT.PosY;

                                currentTileLayer.Tiles.Remove(alreadyT);

                                if (currentAutotile != null)
                                {
                                    // basic 4
                                    Tile t1 = currentTileLayer.Tiles.FirstOrDefault(x =>
                                        x.PosX == t.PosX && x.PosY == t.PosY - 1); // N // 2
                                    Tile t2 = currentTileLayer.Tiles.FirstOrDefault(x =>
                                        x.PosX == t.PosX && x.PosY == t.PosY + 1); // S // 64
                                    Tile t3 = currentTileLayer.Tiles.FirstOrDefault(x =>
                                        x.PosX == t.PosX + 1 && x.PosY == t.PosY); // W // 16
                                    Tile t4 = currentTileLayer.Tiles.FirstOrDefault(x =>
                                        x.PosX == t.PosX - 1 && x.PosY == t.PosY); // S // 8

                                    // extended 4
                                    Tile t5 = currentTileLayer.Tiles.FirstOrDefault(x =>
                                        x.PosX == t.PosX - 1 && x.PosY == t.PosY - 1); // EN // 1
                                    Tile t6 = currentTileLayer.Tiles.FirstOrDefault(x =>
                                        x.PosX == t.PosX + 1 && x.PosY == t.PosY - 1); // WN // 4
                                    Tile t7 = currentTileLayer.Tiles.FirstOrDefault(x =>
                                        x.PosX == t.PosX - 1 && x.PosY == t.PosY + 1); // ES // 32
                                    Tile t8 = currentTileLayer.Tiles.FirstOrDefault(x =>
                                        x.PosX == t.PosX + 1 && x.PosY == t.PosY + 1); // WS // 128

                                    if (t1 != null)
                                    {
                                        Autotile.UpdateTile(t1, currentTileLayer);
                                    }

                                    if (t2 != null)
                                    {
                                        Autotile.UpdateTile(t2, currentTileLayer);
                                    }

                                    if (t3 != null)
                                    {
                                        Autotile.UpdateTile(t3, currentTileLayer);
                                    }

                                    if (t4 != null)
                                    {
                                        Autotile.UpdateTile(t4, currentTileLayer);
                                    }

                                    if (t5 != null)
                                    {
                                        Autotile.UpdateTile(t5, currentTileLayer);
                                    }

                                    if (t6 != null)
                                    {
                                        Autotile.UpdateTile(t6, currentTileLayer);
                                    }

                                    if (t7 != null)
                                    {
                                        Autotile.UpdateTile(t7, currentTileLayer);
                                    }

                                    if (t8 != null)
                                    {
                                        Autotile.UpdateTile(t8, currentTileLayer);
                                    }
                                }
                            }
                        }
                    }
                }

                MousePrevious = MousePositionTranslated;
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
            if (editorForm.projectFile != "" && panView)
            {
                cam.TargetPosition = new Vector2(cam.Position.X + helpVec2.X - MousePositionTranslated.X, cam.Position.Y + helpVec2.Y - MousePositionTranslated.Y);
            }
        }

        public void ClearAll()
        {
            SceneObjects?.Clear();
            roomLayers?.Clear();
            currentRoom?.Layers.Clear();
        }

        public void ClearNodes()
        {
            if (lt.dtv.Nodes.Count > 0)
            {
                lt.dtv.Nodes[0].Nodes.Clear();
            }
        }

        public void PropagateNodes()
        {
            selectedLayer = currentRoom.Layers[0];
            int currentDepth = 0;
            foreach (RoomLayer rl in currentRoom.Layers)
            {
                DarkTreeNode dtn = new DarkTreeNode(rl.Name);
                dtn.Tag = dtn;
                dtn.Tag = "";
                dtn.SuffixText = "[Visible]";

                if (rl.LayerType == RoomLayer.LayerTypes.typeObject)
                {
                    dtn.Icon = (System.Drawing.Bitmap)Properties.Resources.ResourceManager.GetObject("WorldLocal_16x");
                }
                else if (rl.LayerType == RoomLayer.LayerTypes.typeAsset)
                {
                    dtn.Icon = (System.Drawing.Bitmap)Properties.Resources.ResourceManager.GetObject("Image_16x");
                }
                else if (rl.LayerType == RoomLayer.LayerTypes.typeParticle)
                {
                    dtn.Icon = (System.Drawing.Bitmap)Properties.Resources.ResourceManager.GetObject("ParticleLayer");
                }
                else
                {
                    dtn.Icon = (System.Drawing.Bitmap)Properties.Resources.ResourceManager.GetObject("MapLineLayer_16x");
                }

                rl.Depth = currentDepth;
                currentDepth += 100;
                lt?.dtv.Nodes[0].Nodes.Add(dtn);
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

        public void ToggleGrid()
        {
            DrawGrid = !DrawGrid;
        }

        public void LoadProject(SimplexProjectStructure sps, string path)
        {
            sps.RootPath = path.Substring(0, path.LastIndexOf('\\'));
            sps.ProjectPath = path;
            
            path = path.Replace(".sproject", "");
            string[] parts = path.Split('\\');
            editorForm.loadObjects(parts[parts.Length - 1], sps);

            editorForm.Text = "SimplexEngine - " + parts[parts.Length - 1] + ".sproject";

            // Load sprites, shaders, sounds, tilesets
            thread = new Thread(BackgroundLoad);
            thread.IsBackground = true;
            thread.Start(sps);

            editorForm.darkProgressBar1.Visible = true;
        }

        void BackgroundLoad(object ss)
        {

            SimplexProjectStructure sps = ss as SimplexProjectStructure;
            
            // Sprites
            Sprites = JsonConvert.DeserializeObject<List<Spritesheet>>(File.ReadAllText(sps.RootPath + "/SpritesDescriptor.json"));

            foreach (Spritesheet s in Sprites)
            {
                Texture2D tex = Editor.Content.Load<Texture2D>(Path.GetFullPath(sps.RootPath + "/Content/bin/Windows/Sprites/" + s.Name));
                s.Texture = tex;
            }

            Sgml.Sprites = Sprites;
            UpdateProgress(25);

            // Audio
            Sounds = JsonConvert.DeserializeObject<List<SoundDescriptor>>(File.ReadAllText(sps.RootPath + "/SoundsDescriptor.json"));

            foreach (SoundDescriptor s in Sounds)
            {
                SoundReference r = new SoundReference();
                r.Name = s.Name;
                r.RelativeVolume = s.RelativeVolume;
                r.Source = Editor.Content.Load<SoundEffect>(Path.GetFullPath(sps.RootPath + "/Content/bin/Windows/Sounds/" + s.Name));

                audioList.Add(r);
            }

            Sgml.Sounds = audioList;
            UpdateProgress(50);

            // Tilesets
            tilesets = JsonConvert.DeserializeObject<List<Tileset>>(File.ReadAllText(sps.RootPath + "/TilesetsDescriptor.json"));

            foreach (Tileset tl in tilesets)
            {
                tl.Texture = Editor.Content.Load<Texture2D>(Path.GetFullPath(sps.RootPath + "/Content/bin/Windows/Sprites/Tilesets/" + tl.Name));
            }

            Sgml.tilesets = tilesets;
            UpdateProgress(75);

            // Shaders
            ShaderDescriptors = JsonConvert.DeserializeObject<List<ShaderDescriptor>>(File.ReadAllText(sps.RootPath + "/ShadersDescriptor.json"));

            foreach (ShaderDescriptor sd in ShaderDescriptors)
            {
                Effect e = Editor.Content.Load<Effect>(Path.GetFullPath(sps.RootPath + "/Content/bin/Windows/Shaders/" + sd.Name));
                e.Name = sd.Name;

                shaders.Add(e);
            }

            UpdateProgress(90);

            // Videos
            VideosDescriptors = JsonConvert.DeserializeObject<List<VideoDescriptor>>(File.ReadAllText(sps.RootPath + "/VideosDescriptor.json"));

            foreach (VideoDescriptor sd in VideosDescriptors)
            {
                Video e = Editor.Content.Load<Video>(Path.GetFullPath(sps.RootPath + "/Content/bin/Windows/Videos/" + sd.Name));             
                Videos.Add(new VideoExtended(e, sd.Name));
            }

            Sgml.Videos = Videos;
            UpdateProgress(100);

            Invoke(new Action(() =>
            {
                editorForm.darkProgressBar1.Visible = false;
            }));


        }

        private void UpdateProgress(int percent)
        {
            RunOnUiThread(() => editorForm.darkProgressBar1.Value = percent);
        }

        private void RunOnUiThread(Action action)
        {
            if (InvokeRequired)
            {
                Invoke(action);
            }
            else
            {
                action();
            }
        }
    }
}
