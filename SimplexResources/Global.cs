using System;
using System.Collections.Generic;
using System.Text;
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
        }
    }
}
