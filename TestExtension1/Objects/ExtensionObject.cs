using System;
using System.Collections.Generic;
using System.Text;
using Microsoft.Xna.Framework.Graphics;
using SimplexCore;
using static SimplexCore.Sgml;

namespace TestExtension1.Objects
{
    public class ExtensionObject : GameObject
    {
        private ParticleEngine pe;

        public ExtensionObject()
        {
            EditorPath = "Extensions";
        }

        public override void EvtCreate()
        {
            pe = new ParticleEngine(new List<Texture2D>() {RoomEditor.Sprites[0].Texture}, Position);        
        }

        public override void EvtSave()
        {
            pe.Update();
        }

        public override void EvtDraw()
        {
            pe.Draw(sb);

            draw_circle(Position, 32,  true);
        }
    }
}
