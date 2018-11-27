using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Diagnostics.PerformanceData;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Text;
using Microsoft.Xna.Framework;
using Microsoft.Xna.Framework.Graphics;
using MonoGame.Extended;
using MonoGame.Extended.Shapes;
using MonoGame.Extended.TextureAtlases;
using SimplexCore;
using SimplexIde;
using static SimplexCore.Sgml;
using Color = System.Drawing.Color;


namespace SimplexResources.Objects
{
    public class Object2 : GameObject
    {       
        public Object2()
        {
            Sprite.TextureSource = "texture";
            EditorPath = "Colliders";
           // ImageAlpha = 0.9f;
        }
        
        // Defines what happens once instance is placed in the room editor
        public override void EvtCreate()
        {
            // DrawTest.BackgroundColor = Color.White; //RandomColor();
            Debug.WriteLine(string_digits("kokot123kokot"));
        }

        // This actual GMS-like Create event
        public override void OnCreate()
        {
            Debug.WriteLine("Hello c#");
        }

        public override void EvtDraw(SpriteBatch s, SpriteFont f, Texture2D objectTexture, VertexBuffer vb, BasicEffect be)
        {
            // Initialize render engine for this instance
            DrawStart(s, vb, be);
        //    s.Draw(objectTexture, Position, DrawColor);
            // Actual code starts here
           // draw_set_alpha(0.5);
            // draw_triangle(Position.X, Position.Y, Position.X + 100, Position.Y, Position.X + 50, Position.Y + 50, false);

           draw_set_alpha(0.5);
           draw_circle(new Vector2(Position.X + 16, Position.Y + 16), 32, false);
        }
    }
}