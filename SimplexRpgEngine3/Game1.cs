using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Xml;
using Microsoft.Xna.Framework;
using Microsoft.Xna.Framework.Graphics;
using Microsoft.Xna.Framework.Input;
using MonoGame.Extended;
using MonoGame.Extended.Gui;
using MonoGame.Extended.Input.InputListeners;
using MonoGame.Extended.Particles;
using MonoGame.Extended.Screens;
using MonoGame.Extended.ViewportAdapters;
using Newtonsoft.Json;
using SimplexCore;
using SimplexCore.Ext;
using SimplexResources.Sprites;
using Sprite = SimplexCore.Sprite;

namespace SimplexRpgEngine3
{
    /// <summary>
    /// This is the main type for your game.
    /// </summary>
    public class Game1 : Game
    {
        GraphicsDeviceManager graphics;
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
        public RoomLayer selectedLayer;
        public List<RoomLayer> roomLayers = new List<RoomLayer>();
        public RectangleF selectionRectangle = new RectangleF();

        public Vector2 GridSize = new Vector2(32, 32);
        public Vector2 GridSizeRender = new Vector2(32, 32);
        public bool GameRunning = true;
        public Vector2 MousePrevious = new Vector2();
        public AutotileDefinition currentAutotile = null;
        public TileLayer currentTileLayer = null;
        public RoomLayer lastLayer = null;
        public Keys lastKey = Keys.None;
        SpatialHash sh = new SpatialHash() { CellSize = 128, Cols = 20, Rows = 20 };
        private GlobalKeyboardHook _globalKeyboardHook;
        public List<Tileset> tilesets;
        RectangleF generalRectangle = RectangleF.Empty;
        Effect effect;
        private SpriteBatch sb;

        List<GameObject> GameObjects = new List<GameObject>();
        private SpriteFont spriteFont;

        public Game1()
        {
            IsMouseVisible = true;

            graphics = new GraphicsDeviceManager(this);
            graphics.PreferredBackBufferWidth = 1024;  
            graphics.PreferredBackBufferHeight = 768;   
            graphics.ApplyChanges();

            Content.RootDirectory = "Content";
            Window.Title = "Simplex RPG Engine 3";
        }

        protected override void Initialize()
        {
            sb = new SpriteBatch(graphics.GraphicsDevice);
            Sgml.SceneObjects = SceneObjects;
            Sgml.roomLayers = roomLayers;
            Sgml.Textures = Textures;
            Sgml.RoomEditor = null;
            Sgml.RoomEditorEditor = null;

            camera = new Camera2D(GraphicsDevice);
            basicEffect = new BasicEffect(GraphicsDevice);

            cam.Camera = camera;
            cam.Position = Vector2.Zero;
            cam.TargetPosition = Vector2.Zero;
            cam.TransformSpeed = 0.1f;

            prevState = Keyboard.GetState();
            basicEffect = new BasicEffect(GraphicsDevice);

            vertexBuffer = new DynamicVertexBuffer(GraphicsDevice, typeof(VertexPositionColor), 1000, BufferUsage.WriteOnly);
            m = Matrix.CreateOrthographicOffCenter(0, GraphicsDevice.Viewport.Width, GraphicsDevice.Viewport.Height, 0, 0, -1);
            _globalKeyboardHook = new GlobalKeyboardHook();
            _globalKeyboardHook.KeyboardPressed += OnKeyPressed;

            Sprites = JsonConvert.DeserializeObject<List<Spritesheet>>(new StreamReader("../../../SimplexRpgEngine3/SpritesDescriptor.json").ReadToEnd());

            foreach (Spritesheet s in Sprites)
            {
                Texture2D tex = Content.Load<Texture2D>(Path.GetFullPath("../../../SimplexRpgEngine3/Content/bin/Windows/Sprites/" + s.Name));
                s.Texture = tex;
            }

            Sgml.sh = sh;
            Sgml.Sprites = Sprites;
            Sgml.GraphicsDevice = GraphicsDevice;

            tilesets = JsonConvert.DeserializeObject<List<Tileset>>(File.ReadAllText("../../../SimplexRpgEngine3/TilesetsDescriptor.json"));
            Sgml.tilesets = tilesets;

            spriteFont = Content.Load<SpriteFont>(Path.GetFullPath("../../../SimplexRpgEngine3/Content/bin/Windows/Fonts/File"));
            prevState = Keyboard.GetState();

            var viewportAdapter = new BoxingViewportAdapter(Window, GraphicsDevice, 1024, 768);
            camera = new Camera2D(viewportAdapter);


            cam.Camera = camera;
            cam.Position = Vector2.Zero;
            cam.TargetPosition = Vector2.Zero;
            cam.TransformSpeed = 0.1f;
            
            base.Initialize();
        }

        private void OnKeyPressed(object sender, GlobalKeyboardHookEventArgs e)
        {
            Input.PressDirect(e.KeyboardData.VirtualCode);
        }

        protected override void LoadContent()
        {

        }

        protected override void UnloadContent()
        {
            
        }

        protected override void Update(GameTime gameTime)
        {
            base.Update(gameTime);

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
            Input.KeyboardState = Keyboard.GetState();

            g = gameTime;
            base.Update(gameTime);

            cam.UpdatePosition();

            foreach (GameObject o in SceneObjects)
            {
                sh.UnregisterObject(o);
                sh.RegisterObject(o);

                if (GameRunning || o == clickedObject)
                {
                    Sgml.currentObject = o;
                    o.EvtStep();
                    o.EvtDrawToSurfaces();
                }
            }
        }

        protected override void Draw(GameTime gameTime)
        {
            Sgml.drawFont = spriteFont;

            double framerate = 60;
            KeyboardState ks = Keyboard.GetState();
            Input.KeyboardState = ks;

            Matrix transformMatrix = cam.Camera.GetViewMatrix();
            BackgroundColor = Color.Black;
            GraphicsDevice.Clear(BackgroundColor);
            Input.MousePosition = MousePositionTranslated;

            Sgml.currentRoom = currentRoom;
            Sgml.sb = sb;
            Sgml.vb = vertexBuffer;
            Sgml.be = basicEffect;
            Sgml.m = transformMatrix;

            Matrix view = cam.Camera.GetViewMatrix();
            Matrix projection = m;

            basicEffect.World = world;
            basicEffect.View = view;
            basicEffect.Projection = projection;
            basicEffect.VertexColorEnabled = true;


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

            SimplexResources.Global.DrawStart();

            if (roomLayers.Count > 2)
            {
                var k = 1;
            }
            foreach (RoomLayer rl in roomLayers)
            {
                if (rl.LayerType == RoomLayer.LayerTypes.typeTile)
                {
                    Color c = Color.White;
                    c.A = 128;
                    sb.Begin(transformMatrix: transformMatrix);
                    int xIndex = 0;
                    int yIndex = 0;
                    for (float i = 0; i < 768; i += GridSizeRender.Y)
                    {
                        for (float j = 0; j < 1024; j += GridSizeRender.X)
                        {
                            xIndex++;
                            i = (float)Math.Round(i);
                            j = (float)Math.Round(j);
                        }

                        yIndex++;
                        xIndex = 0;
                    }

                    foreach (Tile t in ((TileLayer)rl).Tiles)
                    {
                        sb.Draw(t.SourceTexture, new Vector2(t.PosX * 32, t.PosY * 32), t.DrawRectangle, Color.White);
                    }

                    sb.End();
                }
            }


            // Before render, resolve collisions
            foreach (GameObject go in SceneObjects.ToList())
            {
                if (go.Colliders.Count > 0)
                {
                    List<GameObject> possibleColliders = sh.ObjectsNearby(go);

                    // Check for collision with each object from possible colliders
                    foreach (GameObject c in possibleColliders)
                    {
                        if (c == go) { continue; } // Discard self collisions

                        // Check for general rectangle collision 
                        if (c.CollisionContainer.Intersects(go.CollisionContainer))
                        {
                            // There is a possibility that two instances can collide
                            // 1) Get entry from collision tree
                            // 2) Detailed collisions
                            var entries = CollisionsTree.DefinedCollisionPairs.FirstOrDefault(x => x.Key.Object == go.GetType() && x.Value.Object == c.GetType());

                            if (entries.Key != null)
                            {
                                // Get colliders from names
                                ColliderBase cb = go.Colliders.FirstOrDefault(x => x.Name == entries.Key.ColliderName);
                                ColliderBase cb2 = c.Colliders.FirstOrDefault(x => x.Name == entries.Value.ColliderName);

                                if ((cb.GetType() == typeof(ColliderRectangle) && cb2.GetType() == typeof(ColliderCircle)))
                                {
                                    if (cb is ColliderRectangle)
                                    {
                                        // Circle-rectangle collision
                                        if (ColliderCircle.RectangleIntersectsCircle((ColliderRectangle)cb, (ColliderCircle)cb2))
                                        {

                                            // Collision occured, fire event
                                            Sgml.currentObject = go;
                                            entries.Key.CollisionAction.Invoke(go, c);
                                            break;
                                            //Debug.WriteLine("TRIGGER");
                                        }
                                    }
                                }

                                if (cb.GetType() == typeof(ColliderCircle) && cb2.GetType() == typeof(ColliderCircle))
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
                        // ------------ positions doesn't matter here -------------
                        // Layer is tile
                        if (rl is TileLayer)
                        {
                            sb.Begin(transformMatrix: transformMatrix);
                            foreach (Tile t in ((TileLayer)rl).Tiles)
                            {
                                sb.Draw(t.SourceTexture, new Vector2(t.PosX * 32, t.PosY * 32),
                                    t.DrawRectangle, Color.White);
                            }

                            sb.End();
                        }

                        // Layer is object
                        if (rl is ObjectLayer)
                        {
                            foreach (GameObject o in ((ObjectLayer)rl).Objects.ToList())
                            {
                                o.PositionPrevious = o.Position;
                                Sgml.currentObject = o;
                                o.EvtDraw();

                                generalRectangle.Width = o.Sprite.ImageRectangle.Width;
                                generalRectangle.Height = o.Sprite.ImageRectangle.Height;

                                generalRectangle.X = o.Position.X;
                                generalRectangle.Y = o.Position.Y;

                            }
                        }
                    }
                }
            }

            if (ks.IsKeyDown(Keys.LeftControl))
            {
                Sgml.draw_rectangle(selectionRectangle, true);
            }

            sb.Begin();
            sb.DrawString(spriteFont, framerate.ToString("F1"), new Vector2(10, 10), Color.White);
            sb.End();


            killClick = false;

            Sgml.sb = sb;
            Sgml.vb = vertexBuffer;
            Sgml.be = basicEffect;
            Sgml.m = transformMatrix;
            SimplexResources.Global.DrawEnd();

            Input.KeyboardStatePrevious = Keyboard.GetState();
            Input.Clear();
            base.Draw(gameTime);
        }
    }
}
