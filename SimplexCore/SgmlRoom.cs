using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SimplexCore
{
    public static partial class Sgml
    {

        public static void room_goto(Type room)
        {
            // First (again) but I've tackled down later
            // we 
            // need
            // to 
            // weed... no! We need to check if current room is persistent
            // and if that's the case well then boy.. we gonna create a shadow copy of it
            // saving state of it for later (overwrite if needed

            // R u persistent madafaka?
            if (currentRoom != null && currentRoom.Persistent)
            {
                // Save teh bitch
                game_save("temp_" + currentRoom.GetType().ToString().Split('.').Last() + ".sav");
            }

            // Now we check if the next room is persistent
            // true --> load shadow copy of that room if it exists, otherwise create it from an actual copy
            // false --> load common copy 

            // Instantiate that room to see what's inside
            GameRoom tempRoom = (GameRoom)Activator.CreateInstance(room);

            if (tempRoom.Persistent)
            {
                // TODO
            }
            else
            {
                // TODO we need fuckign load game here
            }
        }
    }
}
