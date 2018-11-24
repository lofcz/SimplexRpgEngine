using Microsoft.Xna.Framework;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Microsoft.Xna.Framework.Graphics;
using MonoGame.Extended;

namespace SimplexCore
{
    public static class Sgml
    {
        public static List<GameObject> SceneObjects = new List<GameObject>();
        public static List<TextureReference> Textures = new List<TextureReference>();
        public static Random Random = new Random();
        public static SpriteBatch sb;
        private static Color _color = Color.White;

        public static Color DrawColor
        {
            get { return FinalizeColor(_color); }
            set { _color = value; }
        }

        private static float drawAlpha = 1;

        private static Color FinalizeColor(Color c)
        {
            c *= drawAlpha;
            return c;
        }

        public static bool PlaceEmpty(Vector2 position)
        {
            foreach (GameObject g in SceneObjects)
            {
               Rectangle r = new Rectangle((int)g.Position.X, (int)g.Position.Y, g.Sprite.ImageRectangle.Width, g.Sprite.ImageRectangle.Height);

               if (r.Contains(position))
               {
                   return false;
               }
            }
            return true;
        }

        public static GameObject InstancePlace(Vector2 vec)
        {
            for (int i = SceneObjects.Count - 1; i >= 0; i--)
            {
                Rectangle r = new Rectangle((int)SceneObjects[i].Position.X, (int)SceneObjects[i].Position.Y, SceneObjects[i].Sprite.ImageRectangle.Width, SceneObjects[i].Sprite.ImageRectangle.Height);

                if (r.Contains(vec))
                {
                    return SceneObjects[i];
                }
            }
            return null;
        }

        public static Color RandomColor()
        {
            return new Color(Random.Next(255), Random.Next(255), Random.Next(255));
        }

        public static void DrawRectangle(float x1, float y1, float x2, float y2, bool outline)
        {
            if (!outline)
            {
                sb.FillRectangle(new RectangleF(x1, y1, Math.Abs(x1 - x2), Math.Abs(y1 - y2)), DrawColor);
            }
            else
            {
                sb.DrawRectangle(new RectangleF(x1, y1, Math.Abs(x1 - x2), Math.Abs(y1 - y2)), DrawColor);
            }          
        }

        public static void DrawRectangle(Vector2 position, Vector2 size, bool outline)
        {
            if (!outline)
            {
                sb.FillRectangle(new RectangleF(position.X, position.Y, size.X, size.Y), DrawColor);
            }
            else
            {
                sb.DrawRectangle(new RectangleF(position.X, position.Y, size.X, size.Y), DrawColor);
            }
                    
        }

        public static void DrawRectangle(Vector2 position, Vector2 size, bool outline, float lineThickness)
        {
            if (!outline)
            {
                sb.FillRectangle(new RectangleF(position.X, position.Y, size.X, size.Y), DrawColor);
            }
            else
            {
                sb.DrawRectangle(new RectangleF(position.X, position.Y, size.X, size.Y), DrawColor, lineThickness);
            }
        }

        public static void DrawSetAlpha(float alpha)
        {
            alpha = alpha.Clamp(0, 1);
            drawAlpha = alpha;
        }

        public static void DrawSetColor(Color c)
        {
            DrawColor = c;
        }

        public static double DrawGetAlpha()
        {
            return drawAlpha;
        }

        public static Color DrawGetColor()
        {
            return DrawColor;
        }

    }
}
