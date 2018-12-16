using System;
using System.Collections.Generic;
using System.Text;
using Microsoft.Xna.Framework;

namespace SimplexCore
{
    public static partial class Sgml
    {
        public static void move_towards_point(Vector2 point, double pixels)
        {
            var dir = point_direction(currentObject.Position, point);
            currentObject.Position.X += (float)lengthdir_x(pixels, dir);
            currentObject.Position.Y += (float)lengthdir_y(pixels, dir);
        }

        public static void move_random(Vector2 cellSize)
        {
            currentObject.Position = new Vector2(irandom_range(0, (int)currentRoom.Size.X) / (int)cellSize.X * (int)cellSize.X, irandom_range(0, (int)currentRoom.Size.Y) / (int)cellSize.Y * (int)cellSize.Y);
        }
    }
}
