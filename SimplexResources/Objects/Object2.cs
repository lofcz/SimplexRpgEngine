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

        public override void DrawNode(SpriteBatch s, SpriteFont f, Texture2D objectTexture)
        {
            sb = s;

            DrawSetAlpha(0.5f);

            IEnumerable<Vector2> vertices = new List<Vector2>();
            vertices.Append(new Vector2(0, 0));
            vertices.Append(new Vector2(10, 100));
            vertices.Append(new Vector2(90, 10));
            vertices.Append(new Vector2(0, 40));
            vertices.Append(new Vector2(0, 0));
            Polygon p = new Polygon(vertices);

            sb.DrawPolygon(Position, p, DrawColor);
           // draw_circle(Position, 24, true, Microsoft.Xna.Framework.Color.Red, 1);
           
           
        }
    }
}