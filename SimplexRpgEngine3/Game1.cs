using System;
using System.Diagnostics;
using Microsoft.Xna.Framework;
using Microsoft.Xna.Framework.Graphics;
using Microsoft.Xna.Framework.Input;
using MonoGame.Extended;
using MonoGame.Extended.Gui;
using MonoGame.Extended.Input.InputListeners;
using MonoGame.Extended.Screens;
using MonoGame.Extended.ViewportAdapters;
using SimplexCore;
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
            // TODO: use this.Content to load your game content here


        
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
                s.ImageIndex++;
                Debug.WriteLine(s.ImageIndex);
            }

            s.UpdateImageAngle();
            s.UpdateImageScale();
            s.UpdateImageRectangle();
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
            spriteBatch.Draw(s.Texture, new Vector2(400, 200), s.ImageRectangle, Color.White, s.ImageAngle, new Vector2(0, 0),  s.ImageScale, SpriteEffects.None, 1);

            spriteBatch.DrawString(sf, "Hello world", new Vector2(100, 100), Color.White);
            spriteBatch.End();

            // TODO: Add your drawing code here

            base.Draw(gameTime);
        }
    }
}
