using System.Collections.Generic;
using Microsoft.Xna.Framework;
using Microsoft.Xna.Framework.Graphics;
using MonoGame.Extended;
using SimplexCore;
using static SimplexCore.Sgml;

namespace SimplexResources.Objects
{
    public class oGem : GameObject
    {
        private ParticleEngine pe;
        private bool drawParticles;
        private bool pickedUp;

        public oGem()
        {
            EditorPath = "Actors";

            ColliderRectangle cr = new ColliderRectangle(this);
            cr.Name = "MainCollider";
            cr.GameObject = this;
            cr.Collision = new RectangleF(0, 0, 64, 32);

          //  synth_speak_async("Hello World");
            Sprite.TextureSource = "Gem";
            Colliders.Add(cr);
        }

        public override void EvtSetup()
        {
            pickedUp = false;
            drawParticles = false;
            pe = null;
        }
        
        public override void EvtRegisterCollisions()
        {
            RegisterCollider("MainCollider", typeof(oPlayer), "bodyCollider", PlayerCollision);
        }

        private void PlayerCollision(GameObject me, GameObject player)
        {
            oGem meCasted = (oGem) me;

            if (!meCasted.pickedUp)
            {
                meCasted.pe = new ParticleEngine(new List<Texture2D> {meCasted.Sprite.Texture}, meCasted.Position);
                meCasted.pe.Setup();

                alarm_set(0, 120);
                meCasted.pickedUp = true;
            }
           // move_bounce_rectangle_object(me.CollisionContainer, player.CollisionContainer, player);
        }

        public override void EvtStep()
        {
            UpdateState();
            UpdateColliders();

            if (pickedUp)
            {
                pe.Update();
            }
        }

        public override void EvtCreate()
        {
            //alarm_set(0, 60);
            ImageOrigin = new Vector2(8, 8);
        }

        public override void EvtAlarm0()
        {
            instance_destroy();
        }

        public override void EvtDraw()
        {
            CollisionContainer.Height = (int) (32 * ImageScaleTarget.Y);
            CollisionContainer.Width = (int) (64 * ImageScaleTarget.X);
            CollisionContainer.X = (int) Position.X;
            CollisionContainer.Y = (int) Position.Y;

            //   draw_rectangle(Position, new Vector2(Position.X + 16 * ImageScaleTarget.X, Position.Y + 16 * ImageScaleTarget.Y), true);

            if (pickedUp)
            {
                ImageAlpha = (float)lerp_aggressive(ImageAlpha, 0, 0.1);
            }

            draw_self();

            if (pickedUp)
            {
                pe.Draw(sb);
            }

            draw_text(X, Y - 64, pickedUp.ToString());
            draw_text(X, Y - 96, "Alpha: " + ImageAlpha.ToString());
            //draw_line_color(rr.Point1, rr.Point2, Color.Red, Color.Red);
            // draw_line_color(rr.Point2, rr.Point3, Color.Red, Color.Red);
            //draw_line_color(rr.Point3, rr.Point4, Color.Red, Color.Red);
            //  draw_line_color(rr.Point4, rr.Point1, Color.Red, Color.Red);
        }
    }
}