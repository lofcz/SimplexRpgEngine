using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Diagnostics.PerformanceData;
using System.Runtime.CompilerServices;
using System.Text;
using System.Windows.Forms;
using System.Xml.Serialization;
using Microsoft.Xna.Framework;
using Microsoft.Xna.Framework.Graphics;
using MonoGame.Extended.Sprites;
using MonoGame.Extended.TextureAtlases;
using SimplexCore;
using SimplexIde;
using SimplexResources.Rooms;
using static SimplexCore.Sgml;
using Keys = Microsoft.Xna.Framework.Input.Keys;
using MouseButtons = SimplexCore.Sgml.MouseButtons;

namespace SimplexResources.Objects
{
    public class SampleObject : GameObject
    {
        private float lineThickness = 0;
        private float time = 0;
        private float alpha = 0;
        public SampleObject()
        {
            Sprite.TextureSource = "texture";
            Sprite.ImageRectangle = new Rectangle(0, 0, 64, 64);
            EditorPath = "Actors"; 
        }

        public override void EvtContextMenuSelected(ToolStripItem e)
        {
            if (e.Text == "Oh you can overload this?")
            {
                Debug.WriteLine(is_string("Kokot"));
                Debug.WriteLine(is_string(123));

            }
        }

        public override void OnCreate()
        {
           
        }

        public override void EvtDraw()
        {
           time++;
           ImageAlpha = Math.Abs((float)Math.Sin(MathHelper.ToRadians(time)));

           draw_set_alpha(ImageAlpha);
           draw_rectangle(Position, new Vector2(64, 64), false, 0);
           draw_set_alpha(1);

           
           // Almost like in GMS, insted of mb_left buttons are now enumerated in MouseButtons (two extra buttons x1 and x2 are defined)
           if (mouse_check_button_pressed(MouseButtons.Middle))
           {
               /*  Differencies from GMS2:
                *  Two main things are that instance_create outputs a GameObject type as it doesn't know which type to return before args are passed
                *  also object to be created needs to be referenced within typeof() rather than with a native class name
                *
                * 1 - Object3, GameObject, var, object or dynamic - all these are possible
                * 2 - We need to convert output - GameObject to desired class
                * 3 - Class name needs to be enclosed in typeof()
                */

               /* 1 */            /* 2  */                                                /* 3  */
              // Object3 myObject = (Object3)instance_create(new Vector2(100, 100), typeof(Object3), "Object layer 1");

               // Just some sample code changing position of myObject
              // myObject.Position = new Vector2(200, 200);

               if (irandom(2) == 1)
               {
                   //instance_destroy(myObject);
               }

                // This will return a list of instances that have their blend_color set to Aqua and whose position is equal to vec2(10, 10)
                List<Object3> lookHowCoolIsThis = instance_find<Object3>(x => x.color == Color.White);

                if (currentRoom.GetType() == typeof(Room2))
                {
                    room_goto(typeof(Room1));
                }
                else
                {
                    room_goto(typeof(Room2));
                }
           }
        }
    }
}
