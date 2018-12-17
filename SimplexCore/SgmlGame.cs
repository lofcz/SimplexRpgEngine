using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Text;
using System.Xml.Serialization;
using SimplexIde;

namespace SimplexCore
{
    public static partial class Sgml
    {
        public static void game_end()
        {
            System.Windows.Forms.Application.Exit();
        }

        public static void game_save(string path)
        {
            Root root = new Root();

            foreach (RoomLayer r in roomLayers)
            {
                if (r is ObjectLayer)
                {
                    foreach (GameObject go in ((ObjectLayer)r).Objects)
                    {
                        go.EvtSave();
                        root.Objects.Add(go);
                    }
                }

                if (r is TileLayer)
                {
                    foreach (Tile t in ((TileLayer)r).Tiles)
                    {
                        root.Tiles.Add(t);
                    }
                }
            }

            GameRoom gr = (GameRoom)Activator.CreateInstance(Type.GetType(("SimplexResources.Rooms." + Form1.activeRoom.Text)));
            root.Room = gr;

            XmlSerializer ser = new XmlSerializer(typeof(Root), Form1.reflectedTypes.ToArray());
            using (TextWriter w = new StreamWriter(path))
            {
                ser.Serialize(w, root);
            }  
        }


    }
}
