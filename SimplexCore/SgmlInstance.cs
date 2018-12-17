using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using Microsoft.Xna.Framework;
using Microsoft.Xna.Framework.Graphics;

namespace SimplexCore
{
    public static partial class Sgml
    {
        public static List<Spritesheet> Sprites;
        public static GraphicsDevice GraphicsDevice;
        public static SpatialHash sh;

        static Texture2D ConvertToTexture(System.Drawing.Bitmap b, GraphicsDevice graphicsDevice)
        {
            Texture2D tx = null;
            using (MemoryStream s = new MemoryStream())
            {
                b.Save(s, System.Drawing.Imaging.ImageFormat.Png);
                s.Seek(0, SeekOrigin.Begin);
                tx = Texture2D.FromStream(graphicsDevice, s);
            }
            return tx;
        }

        public static GameObject instance_create(Vector2 position, Type obj, string layer)
        {
            // First we need to convert layer name to actual layer
            RoomLayer realLayer = roomLayers.FirstOrDefault(x => x.Name == layer);

            GameObject o = (GameObject)Activator.CreateInstance(obj);
            Spritesheet s = new Spritesheet();
            if (o.Sprite != null)
            {
                s = Sprites.FirstOrDefault(x => x.Name == o.Sprite.TextureSource);
            }

            o.OriginalType = obj;
            o.TypeString = obj.ToString();


            if (s == null)
            {
                Texture2D tx = ConvertToTexture(SimplexIde.Properties.Resources.Question_16x, GraphicsDevice);

                o.Sprite = new Sprite();
                o.Sprite.Texture = tx;
                o.Sprite.ImageRectangle = new Microsoft.Xna.Framework.Rectangle(0, 0, 16, 16);
                o.Sprite.TextureRows = 1;
                o.Sprite.TextureCellsPerRow = 1;
                o.Sprite.ImageSize = new Vector2(16, 16);
                o.Sprite.FramesCount = 1;
                o.FramesCount = 1;
                o.Sprite.cellW = 16;
                o.Sprite.cellH = 16;

                o.Position = new Vector2(position.X - 8, position.Y - 8);
                o.Sprite.ImageRectangle = new Microsoft.Xna.Framework.Rectangle(0, 0, 16, 16);
            }
            else
            {
                o.Sprite.Texture = s.Texture;
                o.Sprite.ImageRectangle = new Microsoft.Xna.Framework.Rectangle(0, 0, s.CellWidth, s.CellHeight);
                o.Sprite.TextureRows = s.Rows;
                o.Sprite.TextureCellsPerRow = s.Texture.Width / s.CellWidth;
                o.Sprite.ImageSize = new Vector2(s.CellWidth, s.CellHeight);
                o.Sprite.FramesCount = Math.Max((s.Texture.Width / s.CellWidth) * (s.Texture.Height / s.CellHeight) - 1, 1);
                o.FramesCount = Math.Max(o.Sprite.FramesCount - 1, 1);
                o.Sprite.cellW = s.CellHeight;
                o.Sprite.cellH = s.CellWidth;

                o.Position = new Vector2(position.X - s.CellWidth / 2f, position.Y - s.CellHeight / 2f);
                o.Sprite.ImageRectangle = new Microsoft.Xna.Framework.Rectangle(0, 0, s.CellWidth, s.CellHeight);
            }


            o.LayerName = realLayer.Name;
            o.Layer = (ObjectLayer)realLayer;

            currentObject = o;
            o.EvtCreate();


            o.Layer.Objects.Add(o);
            SceneObjects.Add(o);
            sh.RegisterObject(o);

            return null;
        }
    }
}
