using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Text;
using Microsoft.Xna.Framework;
using Microsoft.Xna.Framework.Graphics;
using SimplexCore;
using static SimplexCore.Sgml;

namespace SimplexResources.Objects
{
    public class oBallStatic : GameObject
    {
        private ParticleEngine pe;

        public oBallStatic()
        {
            EditorPath = "Collisions";

            ColliderCircle cr = new ColliderCircle();
            cr.Position = Position;
            cr.Radius = 64;
            cr.Name = "Main";
            cr.GameObject = this;

            Colliders.Add(cr);
        }

        public override void EvtCreate()
        {
            pe = new ParticleEngine(new List<Texture2D>() { RoomEditor.Sprites.FirstOrDefault(x => x.Name == "circle").Texture, RoomEditor.Sprites.FirstOrDefault(x => x.Name == "star").Texture, RoomEditor.Sprites.FirstOrDefault(x => x.Name == "diamond").Texture }, Position);

            if (instance_exists(typeof(oBallStatic), false))
            {
                audio_play_sound_fast(audio_get("MySong"));              
            }
        }

        public override void EvtRegisterCollisions()
        {
            RegisterCollider("Main", typeof(oBallStatic), "Main", StaticCol);
        }

        public void StaticCol(GameObject me, GameObject other)
        {
          //  me.Position.X -= 4;
           // other.Position.X += 4;
        //    ColliderCircle.ResolveCircleCircleStatic(me.Colliders[0] as ColliderCircle, other.Colliders[0] as ColliderCircle);
          ////  Debug.WriteLine(me.Id);
        }

        public override void EvtStep()
        {
            UpdateColliders();
            UpdateState();

            CollisionContainer.X = (int)Position.X;
            CollisionContainer.Y = (int)Position.Y;
            CollisionContainer.Width = 64;
            CollisionContainer.Height = 64;

            pe.EmitterLocation = mouse;
            pe.Update();
        }

        public override void EvtDraw()
        {
            pe.Draw(sb);

            CollisionContainer.X = (int)Position.X;
            CollisionContainer.Y = (int)Position.Y;
            CollisionContainer.Width = 64;
            CollisionContainer.Height = 64;    

            draw_circle_fast(Position, 64, 24, Color.White);
        }
    }
}
