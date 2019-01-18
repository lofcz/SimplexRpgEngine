using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Xml;
using Microsoft.Xna.Framework;
using Microsoft.Xna.Framework.Graphics;
using Microsoft.Xna.Framework.Input;
using Microsoft.Xna.Framework.Media;
using MonoGame.Extended;
using MonoGame.Extended.Gui;
using MonoGame.Extended.Input.InputListeners;
using MonoGame.Extended.Particles;
using MonoGame.Extended.Screens;
using MonoGame.Extended.ViewportAdapters;
using Newtonsoft.Json;

namespace SimplexRpgEngine3
{
    /// <summary>
    /// This is the main type for your game.
    /// </summary>
    public class Game1 : Game
    {
        GraphicsDeviceManager graphics;
        private VideoPlayer vp = null;
        private SpriteBatch sb = null;

        public Game1()
        {
            IsMouseVisible = true;

            graphics = new GraphicsDeviceManager(this);
            graphics.PreferredBackBufferWidth = 1024;  
            graphics.PreferredBackBufferHeight = 768;   
            graphics.ApplyChanges();

            Content.RootDirectory = "Content";
            Window.Title = "Simplex RPG Engine 3";

            sb = new SpriteBatch(GraphicsDevice);
        }

        protected override void Initialize()
        {
           
            base.Initialize();
        }


        protected override void LoadContent()
        {
            Video vid = Content.Load<Video>("MyVideo");

            vp = new VideoPlayer();
            vp.Play(vid);
        }

        protected override void UnloadContent()
        {
            
        }

        protected override void Update(GameTime gameTime)
        {
            base.Update(gameTime);

          
        }

        protected override void Draw(GameTime gameTime)
        {
            
            base.Draw(gameTime);

            Texture2D videoTexture = null;

            if (vp.State != MediaState.Stopped)
                videoTexture = vp.GetTexture();

            if (videoTexture != null)
            {
                sb.Begin();
                sb.Draw(videoTexture, new Rectangle(0, 0, 400, 240), Color.White);
                sb.End();
            }
        }
    }
}
