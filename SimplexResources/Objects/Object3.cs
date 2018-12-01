using System;
using System.Collections.Generic;
using System.Drawing;
using System.Text;
using Microsoft.Xna.Framework;
using Microsoft.Xna.Framework.Graphics;
using MonoGame.Extended.TextureAtlases;
using SimplexCore;
using static SimplexCore.Sgml;
using Color = Microsoft.Xna.Framework.Color;


namespace SimplexResources.Objects
{
    public class Object3 : GameObject
    {
        public Object3()
        {
            Sprite.TextureSource = "texture";
            EditorPath = "Colliders";
        }

        public override void EvtDraw(SpriteBatch s, SpriteFont f, Texture2D objectTexture, VertexBuffer vb, BasicEffect be, Matrix m)
        {
            DrawStart(s, vb, be, m, this);


            draw_sprite(objectTexture, 0, Position);
            sb.Begin(transformMatrix: m);
           // sb.DrawString(f, Sprite.cellW.ToString(), Position, Color.Chartreuse);
            sb.End();
            // DrawRectangle(Position, new Vector2(32, 32), true, 3);
        }
    }
}
