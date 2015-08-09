/// equipmentUnequip(slot)

e_slot = argument0;

 for(a=0; a<oInventory.slots; a++)
         {                                                                                        
          if (oInventory.slot[a,inv_id] = 0)
             {
              free_slot = a;                                                            
              break;
             }                
         } 
      if (free_slot = -1)
         {
                                                                                         
         }
      else 
           {  
           if (e_slot = 0) {oPlayerCombat.draw = 0;}
                                                                                                                                                                                                                                             
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
                              
                              oPlayer.vlastnost[a] -= equiped_vlastnost[equip_slot,a];
                              slot_vlastnosti[free_slot,a] = equiped_vlastnost[equip_slot,a];
                              equiped_vlastnost[equip_slot,a] = 0;
               


                             }

            
            
            for(a=0 a<10 a++)  {oInventory.slot_option[free_slot,a] = equiped_option[equip_slot,a]}

           }
     
     