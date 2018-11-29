using System;
using System.Collections.Generic;
using System.Text;
using SimplexCore;

namespace SimplexResources.Rooms
{
    public class Room2 : GameRoom
    {
        public Room2()
        {
             Layers.Add(new RoomLayer() {Name = "Object layer 69", LayerType = RoomLayer.LayerTypes.typeObject});
        }
    }
}
