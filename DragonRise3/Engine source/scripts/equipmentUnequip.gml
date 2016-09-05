/// equipmentUnequip(slot, forceSlot)

e_slot = argument0;
fSlot  = argument1;


tul = true;
 for(a=0; a<oInventory.slots; a++)
         {                                                                                        
          if (oInventory.slot[a,inv_id] = 0)
             {
              if (tul && fSlot) {tul = false;}
              else
              {
              free_slot = a;  
              break;  
              }                                                        
             }                
         } 
      if (free_slot = -1)
         {
                                                                                         
         }
      else 
           {  
                                                                                                                        //show_message(e_slot);
           if (e_slot = 0) {oPlayerCombat.draw = 0;}
              
              // NEW
                             if (equiped_stats[e_slot,inv_item_equip_slot] = "zbraň")
                             {
                             oPlayer.draw_equ[id_Mec,0] = 0;
                             oPlayer.draw_equ[id_Mec,1] =  0;
                             oPlayerCombat.draw = 0;
                             oPlayer.bci[0, 7] = 0;
                             
                             }
                             // /NEW

                                                                                                                                                                                                                                          
            for(a = 0; a < inv_atributes_total; a++)
                  {
                   oInventory.slot[free_slot,a] = equiped_stats[e_slot,a];
                   equiped_stats[e_slot] = "";
                  }
            equiped_image[e_slot,0] = sFreeSlot; 
            equiped_image[e_slot,1] = 0;
            equiped[e_slot] = 0;

               for (a = 0; a < celkem_vlastnosti; a++)
                             {
                              
                              oPlayer.vlastnost[a] -= equiped_vlastnost[e_slot,a];
                              slot_vlastnosti[free_slot,a] = equiped_vlastnost[e_slot,a];
                              equiped_vlastnost[e_slot,a] = 0;
               


                             }

            
            
            for(a=0 a<10 a++)  {oInventory.slot_option[free_slot,a] = equiped_option[e_slot,a]}

           }
     
     
