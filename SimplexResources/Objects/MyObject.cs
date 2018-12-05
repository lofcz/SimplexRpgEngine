using System;
using System.Collections.Generic;
using System.Text;
using Microsoft.Xna.Framework;
using Microsoft.Xna.Framework.Graphics;
using SimplexCore;
using static SimplexCore.Sgml;

namespace SimplexResources.Objects
{
    public class MyObject : GameObject
    {
        public MyObject()
        {          
            EditorPath = "SampleFolder/Subfolder";         
        }

        public override void EvtDraw(SpriteBatch s, SpriteFont f, Texture2D objectTexture, DynamicVertexBuffer vb, BasicEffect be, Matrix m)
        {
            DrawStart(s, vb, be, m, this);

            draw_set_alpha(1);
            draw_sprite(objectTexture, ImageIndex, Position);
        }
    }
}
