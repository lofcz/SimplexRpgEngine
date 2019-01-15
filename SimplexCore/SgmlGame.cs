using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Text;
using System.Xml.Serialization;
using DarkUI.Controls;
using DarkUI.Forms;
using Microsoft.Xna.Framework;
using Microsoft.Xna.Framework.Graphics;
using MonoGame.Forms.Services;
using Newtonsoft.Json;
using SharpDX.Direct2D1;
using SimplexIde;

namespace SimplexCore
{
    public static partial class Sgml
    {
        public static List<Tileset> tilesets;
        public static DrawTest RoomEditor;
        public static MonoGameService RoomEditorEditor;

        public static void game_end()
        {
            System.Windows.Forms.Application.Exit();
        }

        static void ClearAll()
        {
            SceneObjects.Clear();
            roomLayers.Clear();
        }

        public static void game_load(string path)
        {
            bool flag = false;

            // First we fuck current scene
            ClearAll();

            RoomEditor?.ClearNodes();

            // Prepare XML serializer
            // Then we load raw data
            XmlSerializer ser = new XmlSerializer(typeof(Root), Form1.reflectedTypes.ToArray());
            StreamReader w = new StreamReader(path);
            bool flagGood = true;
            Root rawData = null;

            try
            {
                 rawData = (Root) ser.Deserialize(w);
            }
            catch (Exception e)
            {
                flagGood = false;
                DarkMessageBox.Show("Loading of room failed\n\n" + e.InnerException.Message, "Simplex Engine 3");
            }

            if (flagGood)
            {
                // Filter out duplicated layers
                List<string> names = new List<string>();
                List<RoomLayer> goodLayers = new List<RoomLayer>();
                for (var i = 0; i < rawData.Room.Layers.Count; i++)
                {
                    if (!names.Contains(rawData.Room.Layers[i].Name))
                    {
                        names.Add(rawData.Room.Layers[i].Name);
                        goodLayers.Add(rawData.Room.Layers[i]);
                    }
                }

                rawData.Room.Layers = goodLayers;

                // First load back room itself
                Form1.width = (int) rawData.Room.Size.X;
                Form1.height = (int) rawData.Room.Size.Y;


                currentRoom = rawData.Room;

                if (RoomEditor != null)
                {
                    RoomEditor.currentRoom = currentRoom;
                    RoomEditor?.PropagateNodes();
                    RoomEditor.roomsControl.execute = false;

                    RoomEditor.roomsControl.dtv.SelectNode(RoomEditor.roomsControl.dtv.Nodes[0].Nodes
                        .FirstOrDefault(x => x.Text == currentRoom.GetType().ToString().Split('.').Last()));
                    RoomEditor.roomsControl.execute = true;
                }

                // we need to initialize layers by type
                if (tilesets != null)
                {
                    foreach (RoomLayer rl in currentRoom.Layers)
                    {
                        if (rl.LayerType == RoomLayer.LayerTypes.typeTile)
                        {
                            // Start with empty cell data and load stuff later on
                            ((TileLayer) rl).Data =
                                new int[(int) currentRoom.Size.X / 32, (int) currentRoom.Size.Y / 32];

                            // Now select correct tileset and assign it to this.. well tileset
                            Tileset tl = tilesets.FirstOrDefault(x => x.Name == ((TileLayer) rl).TilelistName);

                            // this can fail so check for that
                            if (tl != null)
                            {
                                // also we need to load textures for the tileset
                                // all good
                                ((TileLayer) rl).Tileset = tl;
                            }
                        }
                    }
                }

                // Time to load babies
                foreach (GameObject g in rawData.Objects)
                {
                    Spritesheet s = Sprites.FirstOrDefault(x => x.Name == g.Sprite.TextureSource);

                    g.Sprite.Texture = s.Texture;
                    g.Sprite.ImageRectangle = new Microsoft.Xna.Framework.Rectangle(0, 0, s.CellWidth, s.CellHeight);
                    g.Sprite.TextureRows = s.Rows;
                    g.Sprite.TextureCellsPerRow = s.Texture.Width / s.CellWidth;
                    g.Sprite.ImageSize = new Vector2(s.CellWidth, s.CellHeight);
                    g.Sprite.FramesCount = (s.Texture.Width / s.CellWidth) * (s.Texture.Height / s.CellHeight) - 1;
                    g.FramesCount = g.Sprite.FramesCount - 1;
                    g.Sprite.cellW = s.CellHeight;
                    g.Sprite.cellH = s.CellWidth;

                    RoomLayer rt = currentRoom.Layers.FirstOrDefault(x => x.Name == g.LayerName);
                    g.Layer = (ObjectLayer) rt;

                    g.Sprite.UpdateImageRectangle();
                    g.UpdateState();
                    g.UpdateColliders();

                    // Need to give object OriginalType !!!
                    g.OriginalType = Type.GetType(g.TypeString);

                    g.EvtCreate();
                    g.EvtLoad();

                    SceneObjects.Add(g);
                    g.Layer.Objects.Add(g);
                    sh.RegisterObject(g);

                }

                foreach (GameObject g in SceneObjects)
                {
                    g.EvtCreateEnd();
                }

                // Load tiles
                foreach (Tile t in rawData.Tiles)
                {
                    RoomLayer correctLayer = currentRoom.Layers.FirstOrDefault(x => x.Name == t.TileLayerName);

                    if (correctLayer != null)
                    {
                        TileLayer crt = (TileLayer) correctLayer;
                        t.TileLayer = crt;
                        crt.Tiles.Add(t);
                    }
                    else
                    {
                        Debug.WriteLine("Tile could not be loaded - TileLayerName is wrong");
                    }
                }

                // Now update all tiles
                Texture2D ttt = RoomEditorEditor.Content.Load<Texture2D>(
                    Path.GetFullPath("../../../SimplexRpgEngine3/Content/bin/Windows/Sprites/Tilesets/" + "tileset0"));

                foreach (RoomLayer rl in currentRoom.Layers)
                {
                    if (rl is TileLayer)
                    {
                        TileLayer crt = (TileLayer) rl;

                        foreach (Tile t in crt.Tiles)
                        {
                            t.SourceTexture = ttt;
                            Autotile.UpdateTile(t, crt);
                        }
                    }
                }

                w.Close();
            }
        }


        public static void game_save(string path)
        {
            Root root = new Root();

                foreach (RoomLayer r in currentRoom.Layers)
                {
                    if (r is ObjectLayer)
                    {
                        foreach (GameObject go in ((ObjectLayer) r).Objects)
                        {
                            go.EvtSave();
                            root.Objects.Add(go);
                        }
                    }

                    if (r is TileLayer)
                    {
                        foreach (Tile t in ((TileLayer) r).Tiles)
                        {
                            root.Tiles.Add(t);
                        }
                    }
                }

                GameRoom gr =
                    (GameRoom) Activator.CreateInstance(
                        Type.GetType(("SimplexResources.Rooms." + Form1.activeRoom.Text)));
                root.Room = gr;

                XmlSerializer ser = new XmlSerializer(typeof(Root), Form1.reflectedTypes.ToArray());
                using (TextWriter w = new StreamWriter(path))
                {
                    ser.Serialize(w, root);
                }
            
        }


    }
}
