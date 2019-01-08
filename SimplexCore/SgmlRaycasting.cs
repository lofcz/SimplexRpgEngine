using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Text;
using Microsoft.Xna.Framework;
using MonoGame.Extended;

namespace SimplexCore
{
    public static partial class Sgml
    {
        public static bool point_in_rectangle(Point2 point, RectangleF rectangle)
        {
            return rectangle.Contains(point);
        }
    }
}
