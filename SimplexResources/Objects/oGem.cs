using Microsoft.Xna.Framework;
using MonoGame.Extended;
using SimplexCore;
using static SimplexCore.Sgml;

namespace SimplexResources.Objects
{
    public class oGem : GameObject
    {
        private float s = 0;

        public oGem()
        {
            EditorPath = "Actors";

            ColliderRectangle cr = new ColliderRectangle(this);
            cr.Name = "MainCollider";
            cr.GameObject = this;
            cr.Collision = new RectangleF(0, 0, 64, 32);

            synth_speak_async("Hello World");

            Colliders.Add(cr);
        }
        
        public override void EvtRegisterCollisions()
        {
            RegisterCollider("MainCollider", typeof(oBall), "MainCollider", BallCollision);
        }

        public void BallCollision(GameObject me, GameObject ball)
        {
            move_bounce_rectangle_object(me.CollisionContainer, ball.CollisionContainer, ball);
            instance_destroy(me);
        }

        public override void EvtStep()
        {
            Speed = random_range(0, 5);
            Direction = random_range(0, 360);


            ImageScale.X = (float)sin(s) * 5;
            ImageScale.Y = ImageScale.X;


            s += 0.1f;

            UpdateState();
            UpdateColliders();
        }

        public override void EvtCreate()
        {
            //alarm_set(0, 60);
            ImageOrigin = new Vector2(8, 8);
        }

        public override void EvtAlarm0()
        {
            show_message("asd");
        }

        public override void EvtDraw()
        {
            CollisionContainer.Height = (int) (32 * ImageScaleTarget.Y);
            CollisionContainer.Width = (int) (64 * ImageScaleTarget.X);
            CollisionContainer.X = (int) Position.X;
            CollisionContainer.Y = (int) Position.Y;


            //   draw_rectangle(Position, new Vector2(Position.X + 16 * ImageScaleTarget.X, Position.Y + 16 * ImageScaleTarget.Y), true);
            draw_sprite(sprite_get("Gem"), -2, Position, ImageScale.X, ImageScale.Y, ImageAngle, ImageOrigin.X,
                ImageOrigin.Y);
            draw_text(Position, ImageAngle.ToString());

            //draw_line_color(rr.Point1, rr.Point2, Color.Red, Color.Red);
            // draw_line_color(rr.Point2, rr.Point3, Color.Red, Color.Red);
            //draw_line_color(rr.Point3, rr.Point4, Color.Red, Color.Red);
            //  draw_line_color(rr.Point4, rr.Point1, Color.Red, Color.Red);
        }
    }
}