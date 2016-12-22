/// scrItemPickUpFromGround(pickSound)

var ps;
ps = sndRindPickup;

if (argument_count > 0) {ps = argument[0];}

if (loot == 0)
   {
    if (inventoryPickUp())
       {
        if (ps != -1) {audio_play_sound(sndRindPickup, 0, 0);}
        scrLog(-1, -1, -1, 0, 0.5);
        }
    }

