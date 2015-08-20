#define inventoryPickUp_new
/// inventoryPickUp()

in_inv    = 0;
free_slot = -1;

if (itm_stackable = 1)
{
 for(a=0 a<oInventory.slots a++)
         {
          if (oInventory.slot[a,inv_id] = itm_id)
             {
              in_inv  = 1;
              in_slot = a;
                                                                                          //show_message("Already in inv");
              break;
             }         
         } 
 if (in_inv = 1)
    {
                                                                                          //show_message("Sound: "+string(itm_sound));
      //if (itm_sound != 0) {audio_play_sound(itm_sound,0,0);}     
     oInventory.slot[in_slot,inv_number] += itm_number;
     event_user(event_user_destroy);
    }
 else
     {
      for(a=0; a<oInventory.slots; a++)
         {
                                                                                          //show_message("Slot id: "+string(oInventory.slot[a]));

          if (oInventory.slot[a,inv_id] = 0)
             {
              free_slot = a;                                                              //show_message("Slot: "+string(free_slot));
              break;
             }                
         } 
      if (free_slot = -1)
         {
                                                                                          //show_message("Inventory is full! (imho)");
         }
      else 
           {                                                                              //show_message("First free slot: "+string(free_slot))
                                                                                          //show_message("Item added");
                                                                                          
                                                                                          // show_message("Sound: "+string(itm_sound));
            //if (itm_sound != 0) {audio_play_sound(itm_sound,0,0);}                                                                              
            inventoryPickUpParam(1);                                                                              
            event_user(event_user_destroy);
           }
     
     
     
     }
}
else
    {
    for(a=0; a<oInventory.slots; a++)
         {
                                                                                          //show_message("Slot id: "+string(oInventory.slot[a]));

          if (oInventory.slot[a,inv_id] = 0)
             {
              free_slot = a;                                                              //show_message("Slot: "+string(free_slot));
              break;
             }                
         } 
      if (free_slot = -1)
         {
                                                                                          //show_message("Inventory is full! (imho)");
         }
      else 
           {                                                                              //show_message("First free slot: "+string(free_slot))
                                                                                          //show_message("Item added");
                                                                                          // show_message("Sound: "+string(itm_sound));                                                                              
            //if (itm_sound != 0) {audio_play_sound(itm_sound,0,0);}                                                                                   
            inventoryPickUpParam(0);                        
            event_user(event_user_destroy);
           }
     
     

    
    }

#define inventoryPickUpParam_new
///inventoryPickUpParam(stackable)

param_stackable = 0;

if (argument_count > 0) {param_stackable = argument[0];}


if (param_stackable = 1)
   {
   oInventory.slot[free_slot,inv_id]             = itm_id;
   oInventory.slot[free_slot,inv_sprite]         = itm_sprite;
   oInventory.slot[free_slot,inv_slot_stackable] = 1;
   oInventory.slot[free_slot,inv_sprite_number]  = itm_sprite_number;
   oInventory.slot[free_slot,inv_number]        += itm_number;  


   
   }
else
    {
   oInventory.slot[free_slot,inv_id]             = itm_id;
   oInventory.slot[free_slot,inv_sprite]         = itm_sprite;
   oInventory.slot[free_slot,inv_slot_stackable] = 0;
   oInventory.slot[free_slot,inv_sprite_number]  = itm_sprite_number;
   oInventory.slot[free_slot,inv_number]         = 1;


   
    }

oInventory.slot[free_slot,inv_item_effect]            = itm_effect;    
oInventory.slot[free_slot,inv_item_info_head]         = itm_info_head;
oInventory.slot[free_slot,inv_item_info_text]         = itm_info_text;
oInventory.slot[free_slot,inv_item_info_color]        = itm_info_color;
oInventory.slot[free_slot,inv_item_equip_slot]        = itm_equip_slot;

                                                                                                                      //show_message(oInventory.slot[free_slot,inv_item_equip_slot])

for(a=0 a<10 a++)                  {oInventory.slot_option[free_slot,a] = itm_options[a];}
for(a=0; a<celkem_vlastnosti; a++) {oInventory.slot_vlastnosti[free_slot,a] = vlastnost[a];}