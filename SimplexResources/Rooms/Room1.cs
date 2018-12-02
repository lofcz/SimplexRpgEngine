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
            Layers.Add(new RoomLayer() {Name = "Object layer 1", LayerType = RoomLayer.LayerTypes.typeObject});
            Layers.Add(new RoomLayer() { Name = "Tile layer 1", LayerType = RoomLayer.LayerTypes.typeTile });
        }
    }
}
