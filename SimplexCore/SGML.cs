using Microsoft.Xna.Framework;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Microsoft.Xna.Framework.Graphics;
using SimplexIde;

namespace SimplexCore
{
    public static class Sgml
    {
        public static List<GameObject> SceneObjects = new List<GameObject>();
        public static List<TextureReference> Textures = new List<TextureReference>();
        public static Random Random = new Random();

        public static bool PlaceEmpty(Vector2 position)
        {
            foreach (GameObject g in SceneObjects)
            {
               Texture2D texture = Textures.FirstOrDefault(x => x.Name == g.Sprite.TextureSource).Texture;
               Rectangle r = new Rectangle((int)g.Position.X, (int)g.Position.Y, texture.Width, texture.Height);

               if (r.Contains(position))
               {
                   return false;
               }
            }
            return true;
        }

        public static Color RandomColor()
        {
            return new Color(Random.Next(255), Random.Next(255), Random.Next(255));
        }
    }
}
