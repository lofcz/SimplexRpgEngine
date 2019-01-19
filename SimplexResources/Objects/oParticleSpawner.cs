using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Microsoft.Xna.Framework;
using Microsoft.Xna.Framework.Graphics;
using Microsoft.Xna.Framework.Input;
using MonoGame.Extended;
using SimplexCore;
using static SimplexCore.Sgml;

namespace SimplexResources.Objects
{
    public class oParticleSpawner : GameObject
    {
        private ParticleEngine pe;
        private int ttl = 240;
        public oParticleSpawner()
        {
            EditorPath = "Particles";
        }

        public override void EvtCreate()
        {
            pe = new ParticleEngine(
                new List<Texture2D>()
                {
                    RoomEditor.Sprites.FirstOrDefault(x => x.Name == "circle").Texture,
                    RoomEditor.Sprites.FirstOrDefault(x => x.Name == "star").Texture,
                    RoomEditor.Sprites.FirstOrDefault(x => x.Name == "diamond").Texture
                }, Position);

            pe.Setup();
        }

        public override void EvtStep()
        {
            pe.EmitterLocation = Position;
            pe.Update();

            ttl--;

            if (ttl <= 0)
            {
                instance_destroy(this);
            }
        }

        public override void EvtDraw()
        {
            pe.Draw(sb);
        }
    }
}
