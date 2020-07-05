using System;
using System.Collections.Generic;
using System.Text;
using Microsoft.Xna.Framework;
using MonoGame.Extended;

namespace SimplexCore
{
    public static partial class Sgml
    {
        public static void move_towards_point(Vector2 point, double pixels)
        {
            var dir = point_direction(currentObject.Position, point);
            currentObject.X += (float)lengthdir_x(pixels, dir);
            currentObject.Y += (float)lengthdir_y(pixels, dir);
        }

        public static void move_random(Vector2 cellSize)
        {
            currentObject.Position = new Vector2(irandom_range(0, (int)currentRoom.Size.X) / (int)cellSize.X * (int)cellSize.X, irandom_range(0, (int)currentRoom.Size.Y) / (int)cellSize.Y * (int)cellSize.Y);
        }

        public static void move_snap(Vector2 cellSize)
        {
            int xp = (int)currentObject.Position.X / (int)cellSize.X;
            int yp = (int)currentObject.Position.Y / (int)cellSize.Y;

            currentObject.X = xp;
            currentObject.Y = yp;
            currentObject.X *= (int)cellSize.X;
            currentObject.Y *= (int)cellSize.Y;
        }

        public static bool place_snapped(Vector2 cellSize)
        {
            return currentObject.Position.X % cellSize.X == 0 && currentObject.Position.Y % cellSize.Y == 0;
        }

        public static void motion_set(float dir, float speed)
        {
            currentObject.Direction = dir;
            currentObject.Speed = speed;
        }

        public static void motion_add(float dir, float speed)
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
                currentObject.X = currentRoom.Size.X - currentObject.Position.X;
                currentObject.Y = currentRoom.Size.Y - currentObject.Position.Y;

            }
        }

        public static void move_bounce_rectangle(RectangleF rect1, RectangleF rect2)
        {
            if (rect1.Intersects(rect2))
            {
                if (currentObject.Position.X <= rect2.X || currentObject.Position.X >= rect2.X + rect2.Width) 
                {
                    currentObject.Direction = 180 - currentObject.Direction;
                }
                else if (currentObject.Position.Y <= rect2.Y || currentObject.Position.Y >= rect2.Y + rect2.Height)
                {
                    currentObject.Direction = 360 - currentObject.Direction;
                }

            }
        }

        public static void move_bounce_rectangle_object(Rectangle rect1, Rectangle rect2, GameObject go)
        {
            if (rect1.Intersects(rect2))
            {
                if (rect2.Y <= go.Position.Y || rect2.Y + rect2.Height >= go.Position.Y)
                {
                    go.Direction = 360 - go.Direction;
                }
                else if (rect2.X <= go.Position.X || rect2.X  + rect2.Width >= go.Position.X)
                {
                    go.Direction = 180 - go.Direction;
                }
            }
        }

        public static void move_bounce_rectangle_outside(Rectangle rect1, Rectangle rect2)
        {
            if (!rect1.Intersects(rect2))
            {
                if (currentObject.Position.X <= 0 || currentObject.Position.X >= 1024)
                {
                    currentObject.Direction = 180 - currentObject.Direction;                   
                }
                else if (rect2.Y <= currentObject.Position.Y || rect2.Y + rect2.Height >= currentObject.Position.Y)
                {
                    currentObject.Direction = 360 - currentObject.Direction;

                    if (rect2.Y <= currentObject.Position.Y)
                    {
                        currentObject.Y -= (float)currentObject.Speed;
                    }
                    else
                    {
                        currentObject.Y += (float)currentObject.Speed;
                    }
                }
            }
        }
    }
}
