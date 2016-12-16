#define inventoryDelete
/// inventoryDelete(id, count)

var ar_id, ar_count;
ar_id    = 0;
ar_count = 1;

if (argument_count > 0) {ar_id    = argument[0];}
if (argument_count > 1) {ar_count = argument[1];}

if (inventoryNumber(ar_id) > 0)
   {
    // Iterate all the slots
    for (a = (oInventory.slots - 1); a >= 0; a--)
        {
         if (oInventory.slot[a,inv_id] == ar_id)
            {
             slot_count = oInventory.slot[a,inv_number];
    
             if (slot_count >= ar_count)
                {
                 if (slot_count == ar_count) {inventoryResetSlot(a);}
                 else {oInventory.slot[a,inv_number] -= ar_count;}
                }
             else
                 {                                                                                                                                                                              
                  inventoryResetSlot(a);  
                  inventoryDelete(ar_id, ar_count);
                 }
             break;
            }                 
       }
    // Check if item is not being draged
    if (ar_count > 0)
       {
        if (oInventory.drag)
           {
            if (oInventory.equip_sprite_s[6] == ar_id)
               {
                oInventory.equip_sprite_s[5] -= ar_count;
                
                // Check if item was has been completely deleted
                if (oInventory.equip_sprite_s[5] <= 0)
                   {
                    oInventory.drag            = false;
                    oInventory.draw_item_mouse = false;
                   }
               }
           }
       }
  }

#define inventoryResetSlot
/// inventoryResetSlot(slot)

var sslot;
sslot = 0;

if (argument_count > 0) {sslot = argument[0];}
 
for (b = 0; b < inv_atributes_total; b++)
    {                  
     if (b != inv_item_info_head && b != inv_item_info_text && b != inv_options && b != inv_item_equip_slot)
         {
          oInventory.slot[sslot, b] = 0;
         }
     else {oInventory.slot[sslot, b] = "";}                             
    }
    
for (c = 0; c < 10; c++)
    {
     oInventory.slot_option[sslot, c] = "";
    }
                  
oInventory.slot[sslot, inv_sprite] = sFreeSlot;
return true;
#define inventoryDeleteTempSlot
/// inventoryDeleteTempSlot()

with (oInventory)
     {
      drag            = false;
      drag_controll   = 0;
      draw_item_mouse = false;

            for (a = 0; a < inv_atributes_total; a++)
          {
          if (scrInventoryParseString()) {slot[h_c, a] = 0;}
           else {slot[h_c, a] = "";}  
                   
           if (a == inv_sprite) {slot[h_c, a] = sFreeSlot;}    
           
          }     
                 
      for (b = 0; b < 10; b++)
          {
           switch_option[0, b] = "";   
          }                       
     inventoryResetSlot(h_c)
     }