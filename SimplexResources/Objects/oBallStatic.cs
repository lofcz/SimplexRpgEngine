using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using DarkUI.Controls;
using Microsoft.Xna.Framework;
using Microsoft.Xna.Framework.Graphics;
using SimplexCore;
using static SimplexCore.Sgml;

namespace SimplexResources.Objects
{
    public class oBallStatic : GameObject
    {
        private ParticleEngine pe;
        public bool ParticlesOn = false;
        private DarkCheckBox box1 = null;
        private DarkCheckBox box2 = null;

        public oBallStatic()
        {
            EditorPath = "Collisions";

            ColliderCircle cr = new ColliderCircle();
            cr.Position = Position;
            cr.Radius = 64;
            cr.Name = "Main";
            cr.GameObject = this;

            Colliders.Add(cr);

            box1 = new DarkCheckBox() { Text = "On", AutoSize = true };
            box1.CheckStateChanged += box1event;


            box2 = new DarkCheckBox() { Text = "Off", AutoSize = true };
            box2.CheckStateChanged += box2event;

            EditorProperties = new Control[3];
            EditorProperties[0] = new DarkLabel() {Text = "Toggle particles", AutoSize = true};
            EditorProperties[1] = box1;
            EditorProperties[2] = box2;

        }

        public void box1event(object sender, EventArgs e)
        {
            if (box1.Checked)
            {
                ParticlesOn = true;
                box2.Checked = false;
            }
        }

        public void box2event(object sender, EventArgs e)
        {
            if (box2.Checked)
            {
                ParticlesOn = false;
                box1.Checked = false;
            }
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

            if (ParticlesOn)
            {
                pe.EmitterLocation = Position;
                pe.Update();
            }
        }

        public override void EvtDraw()
        {
            pe.Draw(sb);

            CollisionContainer.X = (int)Position.X;
            CollisionContainer.Y = (int)Position.Y;
            CollisionContainer.Width = 64;
            CollisionContainer.Height = 64;

            oPaddleRenamed closestPaddle = (oPaddleRenamed)instance_nearset(Position, typeof(oPaddleRenamed));

            if (closestPaddle != null)
            {
                with(closestPaddle);
                draw_circle_fast(closestPaddle.Position, 24, 24, Color.Orange);
                with_reset();
            }

            draw_circle_fast(Position, 64, 24, Color.White);
        }
    }
}
