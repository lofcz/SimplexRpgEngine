using System;
using System.Collections.Generic;
using System.Text;
using Microsoft.Xna.Framework;
using Microsoft.Xna.Framework.Graphics;
using Microsoft.Xna.Framework.Input;
using Microsoft.Xna.Framework.Media;
using MonoGame.Extended;
using SimplexCore;
using static SimplexCore.Sgml;

namespace SimplexResources.Objects
{
    public class oGeorgeNew : GameObject
    {
        FrameManager frameManager = new FrameManager();
        private float speed = 5;
        private float imgSpd = .1f;
        private ColliderRectangle bodyCollider = null;
        public int gemsRemaining = 0;
        private float k = 0;
        private float time = 0;
        private RenderTarget2D surface = null;

        public oGeorgeNew()
        {
            EditorPath = "Actors";
            Sprite.TextureSource = "george";
            

            bodyCollider = new ColliderRectangle();
            bodyCollider.Collision = new RectangleF(0, 0, 48, 48);
            bodyCollider.GameObject = this;
            bodyCollider.Name = "main";

            Colliders.Add(bodyCollider);
        }

        public override void EvtRegisterCollisions()
        {
            RegisterCollider("main", typeof(oGem), "main", GemCollision);
            RegisterCollider("main", typeof(oSolidMask), "main", WallCollision);
        }

        public void GemCollision(GameObject me, GameObject other)
        {
            instance_create(new Vector2(other.Position.X  + 8, other.Position.Y + 8), typeof(oParticleSpawner), "Object layer 2");
            instance_destroy(other);
            ((oGeorgeNew)me).gemsRemaining--;

            if (((oGeorgeNew) me).gemsRemaining <= 0)
            {
                show_message("You have collected all the gems! Level will now restart.");
                room_restart();
            }

            audio_play_sound_fast(audio_get("sndGem1"));
        }

        public void WallCollision(GameObject me, GameObject other)
        {
           // me.Position = me.PositionPrevious;
        }

        public override void EvtCreate()
        {
            Sprite.Texture = sprite_get("george");
           // Sprite.change_color_bypixel(Color.Red, 189, 132, 51);
            frameManager.AddAnimation("george", new[] { 0, 1, 2, 3  }, "south"); 
            frameManager.AddAnimation("george", new[] { 4, 5, 6, 7  }, "west"); 
            frameManager.AddAnimation("george", new[] { 8, 9, 10, 11 }, "north"); 
            frameManager.AddAnimation("george", new[] { 12, 13, 14, 15 }, "east");

            //show_message(darcsin(-1).ToString());
            // int k = system_get_ram();
            // video_play(video_get("MyVideo"));
            /* surface = surface_create(16, 16);
             surface_set_target(surface);
             draw_sprite(sprite_get("Gem"), -2, new Vector2(0, 0));
             surface_reset_target();
 
             surface_save_ext(surface, "kokot", 64, 64);*/
            //alarm_set(0, 100);
            video_play(video_get("MyVideo"));
        }

        public override void EvtAlarm0()
        {
            //video_play(video_get("MyVideo"));
            //  show_message("kokotí hlava");
        }


        public override void EvtCreateEnd()
        {
            gemsRemaining = instance_number(typeof(oGem));
        }

        public override void EvtStep()
        {
            UpdateState();
            UpdateColliders();

            CollisionContainer.X = (int)Position.X;
            CollisionContainer.Y = (int)Position.Y;
            CollisionContainer.Width = 48;
            CollisionContainer.Height = 48;

            Sprite.UpdateImageRectangle();

            if (keyboard_check(Keys.W))
            {
                frameManager.ApplyAnimation("george", "north");
                ImageSpeed = imgSpd;

                if (instance_place(new Vector2(Position.X, Position.Y - speed), typeof(oSolidMask)) == null)
                {
                    Position.Y -= speed;
                }
            }
            else if (keyboard_check(Keys.S))
            {
                frameManager.ApplyAnimation("george", "south");

                if (instance_place(new Vector2(Position.X, Position.Y + speed), typeof(oSolidMask)) == null)
                {
                    Position.Y += speed;
                }

                ImageSpeed = imgSpd;
            }
            else if (keyboard_check(Keys.A))
            {
                frameManager.ApplyAnimation("george", "west");

                if (instance_place(new Vector2(Position.X - speed, Position.Y), typeof(oSolidMask)) == null)
                {
                    Position.X -= speed;
                }

                ImageSpeed = imgSpd;
            }
            else if (keyboard_check(Keys.D))
            {
                frameManager.ApplyAnimation("george", "east");

                if (instance_place(new Vector2(Position.X + speed, Position.Y), typeof(oSolidMask)) == null)
                {
                    Position.X += speed;
                }

                ImageSpeed = imgSpd;
            }
            else
            {
                ImageSpeed = 0;
                ImageIndex = ((int)ImageIndex / 4) * 4;
            }

            if (keyboard_check_pressed(Keys.Q))
            {
                audio_play_sound_fast(audio_get("MySong"), .3f);
            }


        }

        public override void EvtDraw()
        {
            float d = (float)(string_width("Gems remaining: " + gemsRemaining) / 2f);

            // Oscillate greyscale amount
            k = (float)abs(dsin(time));
            time += 1;

            // Set shader just like in GMS, it's even easier!
            shader_set(shader_get("shader1"));
            shader_set_uniform_float("amt", k);
          //  draw_sprite(Sprite.Texture, ImageIndex, Position);
            shader_reset();

         //  draw_text(new Vector2(Position.X - d + 24, Position.Y - 16), "Gems remaining: " + gemsRemaining);

            draw_sprite(sprite_get("simplex"), -2, Position);

            draw_video(Position, new Vector2(166, 100));
        }
    }
}
