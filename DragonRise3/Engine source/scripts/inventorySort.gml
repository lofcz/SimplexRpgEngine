/// inventorySort(startSlot)

var lastFreeSlot, startSlot;
lastFreeSlot = -1;
startSlot    = argument[0];

for (i = startSlot; i < array_height_2d(slot); i++)
    {
     if (slot[i,inv_id] == 0 && lastFreeSlot == -1) {lastFreeSlot = i; break;}    
    }

if (lastFreeSlot != -1) 
    {
     q = 0;
     for (i = startSlot; i < array_height_2d(slot); i++)
     {
      if (slot[i,inv_id] != 0 && i > lastFreeSlot) 
        {
        // switch
        for (a = 0; a<inv_atributes_total; a++)
            {           
             slot[lastFreeSlot, a] = slot[i, a];  
             
             if(a!= inv_item_info_head && a!= inv_item_info_text && a!= inv_options && a!= inv_item_equip_slot)
                   {
                   slot[i,a] = 0; 
                   }
                   else {slot[i,a] = "";}      
            }
            break;
        }    
        q = i+1;
     }    
   }
