using System;
using System.Collections.Generic;
using System.Text;
using SimplexCore;

namespace SimplexResources.Rooms
{
    public class Room1 : GameRoom
    {
        public Room1()
        {
            Persistent = false;

            Layers.Add(new TileLayer() { Name = "Tile layer 1", TilelistName = "tileset0" });
            Layers.Add(new ObjectLayer() { Name = "Object layer 1"});
            Layers.Add(new ObjectLayer() { Name = "Object layer 2" });
        }
    }
}
