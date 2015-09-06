/// equipmentHoldEquip(equip_slot,x1,x2,y1,y2)

x_x1  = argument1;
x_x2  = argument2;
y_y1  = argument3;
y_y2  = argument4;

equip_slot = argument0;


if (mouse_x > x_x1 && mouse_x < x_x2 && mouse_y > y_y1 && mouse_y < y_y2)
                    {                  
                       if (oInventory.drag && mouse_check_button_released(mb_left) && equiped[equip_slot] = 0)
                        {
                        //if(equip_slot = 0) {oPlayerCombat.draw = 1; oPlayerCombat.sprite = oInventory.slot_vlastnosti[h_c,vlastnost_vykresli_sprit]; oPlayerCombat.image = oInventory.slot_vlastnosti[h_c,vlastnost_vykresli_index];}
                        
                         oInventory.pre_switch = 1;
                         equiped[equip_slot]   = 1;
                         
                         equiped_image[equip_slot,0] =  equip_sprite_s[0];
                         equiped_image[equip_slot,1] =  equip_sprite_s[1];
                         equiped_image[equip_slot,2] =  equip_sprite_s[2];
                                                                                                                                                                      
                       
                         drag = 0;
                         drag_controll = 0;

                         for (a = 0; a < celkem_vlastnosti; a++)
                             {
                              equiped_vlastnost[equip_slot,a] = slot_vlastnosti[h_c,a];
                              oPlayer.vlastnost[a] += slot_vlastnosti[h_c,a];
                                                                                           //if (a = vlastnost_max_mana) {show_message(oPlayer.vlastnost[a]);}
                             }
                             
                          
                             
                         for (a = 0; a<inv_atributes_total; a++)
                         {
                         equiped_stats[equip_slot,a] = temp_equip[a];
                         
                         
                         
                         if(scrInventoryParseString())
                            {
                            slot[h_c,a] = 0;
                            }
                         else {slot[h_c,a] = "";}  
                   
                         if (a = inv_sprite) {slot[h_c,a] = sFreeSlot;}    
                          } 
                          
                             // NEW
                             if (equiped_stats[equip_slot,inv_item_equip_slot] = "zbraň")
                             {
                             oPlayer.draw_equ[id_Mec,0] =  equiped_vlastnost[equip_slot,vlastnost_vykresli_sprit];
                               oPlayer.draw_equ[id_Mec,1] =  equiped_vlastnost[equip_slot,vlastnost_vykresli_index];

                             }
                             // /NEW

                          

                      draw_item_mouse = 0;
           
                                      for (b = 0; b<10; b++)
                                      {
                              
                                      equiped_option[equip_slot,b] = switch_option[0,b];
                                      switch_option[h_c,b] = "";                
                                      }            
                         
                        }

                    }