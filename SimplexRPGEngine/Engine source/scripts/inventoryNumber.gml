/// inventoryNumber(id)

var idd, ret, t;
idd = 1;
ret = 0;
t   = -1;

if (argument_count > 0) {idd = argument[0];}

// Iterate all the slots
for (a = 0; a < oInventory.slots; a++)
    {
     if (oInventory.slot[a, inv_id] == idd)
        {
         ret += oInventory.slot[a, inv_number];
         t    = i;
        }    
    }    
    
if (oInventory.drag)
   {
     if (oInventory.equip_sprite_s[6] == idd)
        {
          ret += oInventory.equip_sprite_s[5];
        }
   }

global.tempArray[0] = t;    
return (ret);
