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
        SpriteBatch spriteBatch;
        Sprite s = new Sprite();
        Camera2D camera;
        SimplexCamera cam = new SimplexCamera();
        KeyboardState prevState;
        SpriteFont sf;

        List<GameObject> GameObjects = new List<GameObject>();

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
            prevState = Keyboard.GetState();

            var viewportAdapter = new BoxingViewportAdapter(Window, GraphicsDevice, 1024, 768);
            camera = new Camera2D(viewportAdapter);


            cam.Camera = camera;
            cam.Position = Vector2.Zero;
            cam.TargetPosition = Vector2.Zero;
            cam.TransformSpeed = 0.1f;
            
            base.Initialize();
        }

        protected override void LoadContent()
        {

            // Create a new SpriteBatch, which can be used to draw textures.
            spriteBatch = new SpriteBatch(GraphicsDevice);
            s.Texture = Content.Load<Texture2D>("Sprites/elves");
            s.ImageSize = new Vector2(64, 64);
            s.TextureCellsPerRow = 7;
            s.TextureRows = 2;
            s.FramesCount = s.GetFramesCount();
            sf = Content.Load<SpriteFont>("Fonts/font1");

            List<SpriteDescriptor> sd = JsonConvert.DeserializeObject<List<SpriteDescriptor>>(File.ReadAllText("SpritesDescriptor.json"));
            
            XmlManager<GameObject> xml = new XmlManager<GameObject>();
            xml.Type = typeof(List<GameObject>);

            List<GameObject> goList = xml.LoadList(Path.Combine(Environment.CurrentDirectory, @"Data/save1.sav"));
            GameObjects.AddRange(goList);

            // We neeed to load back Textures2D (fucking bastards sitting in ram)
            foreach (GameObject g in GameObjects)
            {
                SpriteDescriptor s = sd.FirstOrDefault(x => ("Sprites/" + x.Name) ==  g.Sprite.TextureSource);

                if (!string.IsNullOrEmpty(g.Sprite.TextureSource) && s != null)
                {
                    g.Sprite.Texture = Content.Load<Texture2D>(g.Sprite.TextureSource);
                    g.Sprite.ImageSize = new Vector2(s.CellWidth, s.CellHeight);
                    g.Sprite.TextureCellsPerRow = s.FramesPerRow;
                    g.Sprite.TextureRows = s.Rows;
                    g.Sprite.FramesCount = g.Sprite.GetFramesCount();
                    g.FramesCount = g.Sprite.FramesCount;
                }
            }
        }



        protected override void UnloadContent()
        {
            // TODO: Unload any non ContentManager content here
        }

        protected override void Update(GameTime gameTime)
        {


            if (GamePad.GetState(PlayerIndex.One).Buttons.Back == ButtonState.Pressed || Keyboard.GetState().IsKeyDown(Keys.Escape))
                Exit();

            var keyboardState = Keyboard.GetState();


            if (keyboardState.IsKeyDown(Keys.Up) & !prevState.IsKeyDown(Keys.Up))
            {
                cam.TargetPosition.Y -= 150;
                s.ImageAngleTarget += SimplexMath.DegToRad(30);
                s.ImageScaleTarget.X -= 0.3f; // new Vector2(0.3f, 0.3f);
            }

            if (keyboardState.IsKeyDown(Keys.Down) & !prevState.IsKeyDown(Keys.Down))
            {
                GameObjects[0].Sprite.ImageIndex++;
            }

            foreach (GameObject g in GameObjects)
            {
                g.Sprite.UpdateImageAngle();
                g.Sprite.UpdateImageScale();
                g.Sprite.UpdateImageRectangle();
            }

            cam.UpdatePosition();
            // TODO: Add your update logic here

            prevState = keyboardState;

            base.Update(gameTime);
        }

        protected override void Draw(GameTime gameTime)
        {

            GraphicsDevice.Clear(Color.CornflowerBlue);
            Matrix transformMatrix = cam.Camera.GetViewMatrix();

            spriteBatch.Begin(transformMatrix: transformMatrix);
            //spriteBatch.Draw(s.Texture, new Vector2(400, 200), s.ImageRectangle, Color.White, s.ImageAngle, new Vector2(0, 0),  s.ImageScale, SpriteEffects.None, 1);

            foreach (GameObject g in GameObjects)
            {
                spriteBatch.Draw(g.Sprite.Texture, g.Position, g.Sprite.ImageRectangle, Color.White, s.ImageAngle, new Vector2(0, 0), g.Sprite.ImageScale, SpriteEffects.None, 1);
            }

            spriteBatch.DrawString(sf, "Hello world", new Vector2(100, 100), Color.White);
            spriteBatch.End();

            // TODO: Add your drawing code here

            base.Draw(gameTime);
        }
    }
}
