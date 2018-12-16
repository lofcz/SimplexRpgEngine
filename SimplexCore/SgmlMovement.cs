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

        public static void move_snap(Vector2 cellSize)
        {
            int xp = (int)currentObject.Position.X / (int)cellSize.X;
            int yp = (int)currentObject.Position.Y / (int)cellSize.Y;

            currentObject.Position.X = xp;
            currentObject.Position.Y = yp;
            currentObject.Position.X *= (int)cellSize.X;
            currentObject.Position.Y *= (int)cellSize.Y;
        }

        public static bool place_snapped(Vector2 cellSize)
        {
            return currentObject.Position.X % cellSize.X == 0 && currentObject.Position.Y % cellSize.Y == 0;
        }

        public static void motion_set(double dir, double speed)
        {
            currentObject.Direction = dir;
            currentObject.Speed = speed;
        }

        public static void motion_add(double dir, double speed)
        {
            currentObject.Direction += dir;
            currentObject.Speed += speed;
        }

        public static void move_wrap(bool hor, bool ver, int margin)
        {
            Rectangle r = new Rectangle((int)currentObject.Position.X, (int)currentObject.Position.Y, currentObject.Sprite.ImageRectangle.Width, currentObject.Sprite.ImageRectangle.Height);

            // Is outside room?
            if (!currentRoom.Rect.Intersects(r))
            {
                var x = lengthdir_x(1, currentObject.Direction);
                var y = lengthdir_y(1, currentObject.Direction);

               //
                currentObject.Position.X = currentRoom.Size.X - currentObject.Position.X;
                currentObject.Position.Y = currentRoom.Size.Y - currentObject.Position.Y;

            }
        }
    }
}
