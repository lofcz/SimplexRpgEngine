using System;
using System.Collections.Generic;
using System.Text;
using SimplexCore;

namespace SimplexResources.Rooms
{
    public class room3 : GameRoom
    {
        public room3()
        {
            Layers.Add(new ObjectLayer() { Name = "My layer" });
        }
    }
}
