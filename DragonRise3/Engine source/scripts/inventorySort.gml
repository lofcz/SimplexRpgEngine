/// inventorySort(startSlot)

var lastFreeSlot, startSlot;
lastFreeSlot = -1;
startSlot    = 0;

if (argument_count > 0) {startSlot = argument[0];}

for (i = startSlot; i < array_height_2d(slot); i++)
    {
     if (slot[i,inv_id] == 0 && lastFreeSlot == -1) {lastFreeSlot = i; break;}    
    }

if (lastFreeSlot != -1) 
    {
     for (i = startSlot; i < array_height_2d(slot); i++)
     {
      if (slot[i,inv_id] != 0 && i > lastFreeSlot) 
        {
         for (a = 0; a<inv_atributes_total; a++)
            {           
             slot[lastFreeSlot, a] = slot[i, a];  
             
             if (a!= inv_item_info_head && a!= inv_item_info_text && a!= inv_options && a!= inv_item_equip_slot)
                   {
                   slot[i,a] = 0; 
                   }
             else {slot[i,a] = "";}      
            }
            
        for (b = 0; b<10; b++)
            {
             slot_option[lastFreeSlot, b] =  slot_option[i, b];
             slot_option[i,b] = "";
            }
            
        for(d=0; d<celkem_vlastnosti; d++)
           {
            slot_vlastnosti[lastFreeSlot, d] = slot_vlastnosti[i, d];
            slot_vlastnosti[i, d] = 0;
           }        
         break;
        }    
     }    
   }
