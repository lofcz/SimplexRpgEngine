using System;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using Microsoft.Xna.Framework;
using Microsoft.Xna.Framework.Graphics;
using MonoGame.Extended;
using SimplexResources.Objects;

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

        public static void instance_destroy(GameObject go)
        {
            if (go.Layer != null)
            {
                go.Layer.Objects.Remove(go);
                SceneObjects.Remove(go);
            }
        }

        public static void instance_destroy(Type type)
        {
            foreach (RoomLayer rl in roomLayers)
            {
                if (rl is ObjectLayer)
                {
                    ObjectLayer ol = (ObjectLayer) rl;

                    foreach (GameObject go in ol.Objects)
                    {
                        if (go.OriginalType == type)
                        {
                            go.Layer.Objects.Remove(go);
                            SceneObjects.Remove(go);
                        }
                    }
                }
            }
        }

        public static List<T> instance_find<T>(Predicate<T> predicate)
        {
            List<T> outputList = new List<T>();

            foreach (RoomLayer rl in roomLayers)
            {
                if (rl is ObjectLayer)
                {
                    ObjectLayer ol = (ObjectLayer)rl;
                    outputList.AddRange(ol.Objects.FindAll(x => x.OriginalType == typeof(T)).Cast<T>().ToList().FindAll(predicate));
                }
            }

            return outputList;
        }

        public static GameObject instance_nearset(Vector2 position, Type obj, bool countMe = false)
        {
            List<GameObject> selectedObjects = SceneObjects.FindAll(x => x.OriginalType == obj);

            if (selectedObjects.Count > 0)
            {
                return selectedObjects.OrderBy(x => point_distance(x.Position, position)).ToList()[0];
            }

            return null;
        }

        public static GameObject instance_place(Vector2 vec)
        {
            foreach (RoomLayer rl in currentRoom.Layers)
            {
                if (rl.Visible)
                {
                    if (rl is ObjectLayer)
                    {
                        ObjectLayer ol = (ObjectLayer)rl;
                        for (int i = ol.Objects.Count - 1; i >= 0; i--)
                        {
                            RectangleF r = new Rectangle((int)ol.Objects[i].Position.X, (int)ol.Objects[i].Position.Y, ol.Objects[i].Sprite.ImageRectangle.Width, ol.Objects[i].Sprite.ImageRectangle.Height);
                            if (r.Contains(vec))
                            {
                                return ol.Objects[i];
                            }
                        }
                    }
                }
            }
           

            return null;
        }

        public static bool instance_exists(Guid guid)
        {
            return SceneObjects.FindIndex(x => x.Id == guid) != -1;
        }

        public static int instance_number(Type obj)
        {
            return SceneObjects.FindAll(x => x.OriginalType == obj).Count;
        }

        public static GameObject instance_furthest(Vector2 position, Type obj, bool countMe = false)
        {
            List<GameObject> selectedObjects = SceneObjects.FindAll(x => x.OriginalType == obj);

            if (selectedObjects.Count > 0)
            {
                return selectedObjects.OrderByDescending(x => point_distance(x.Position, position)).ToList()[0];
            }

            return null;
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

            return o;
        }
    }
}
