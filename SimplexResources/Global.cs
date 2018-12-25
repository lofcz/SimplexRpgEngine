using System;
using System.Collections.Generic;
using System.Text;
using Microsoft.Xna.Framework;
using SimplexCore;
using static  SimplexCore.Sgml;

namespace SimplexResources
{
    public static class Global
    {
        public static void DrawStart()
        {

        }

        public static void DrawEnd()
        {
            CollisionsTree.DrawPairsDebug();
            int n = 0;

            if (currentRoom != null)
            {


                foreach (RoomLayer rl in currentRoom.Layers)
                {
                    if (rl is ObjectLayer)
                    {
                        n += (rl as ObjectLayer).Objects.Count;
                    }
                }
            }


            draw_text(new Vector2(200, 200), n.ToString());
        }
    }
}
