/// inventoryExtend(slots, playSound)

with(oInventory)
    {
     var plus, snd;
     plus = 3;
     snd  = true;

     if (argument_count > 0) {plus = argument[0]}
     if (argument_count > 1) {snd  = argument[1]}

     for (a = slots; a < (slots + plus); a++)
        {
         slot[a] = 0;
 
         for (b = 0; b < inv_atributes_total; b++)
                  {                  
                   if (b != inv_item_info_head && b != inv_item_info_text && b != inv_options && b != inv_item_equip_slot)
                      {
                       slot[a, b] = 0;
                      }
                   else {slot[a, b] = "";}                             
                  }
       
         for (c = 0; c < 10; c++)
             {
              slot_option[a, c]    = "";
              equiped_option[a, c] = "";
             }
                  
         slot[a, inv_sprite] = sFreeSlot;
         hover_slot_alpha[a] = 0;
 
         for (d = 0; d < celkem_vlastnosti; d++)
             {
              slot_vlastnosti[a, d]   = 0;
              equiped_vlastnost[a, d] = 0;
              slot_vlastnosti_static[a, d]   = 0;
              equiped_vlastnost_static[a, d] = 0;              
             }
        }

     if (snd) {audio_play_sound(sndInventoryExtend, 0, 0);}
     slots += plus;
    }
