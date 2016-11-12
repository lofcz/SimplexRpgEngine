/// equipmentHoldEquip(equipSlot, x1, x2, y1, y2, forceEquip)

var equip_slot, x_x1, x_x1, y_y1, y_y1, f, a;
equip_slot = 0;
x_x1       = 0;
x_x2       = 0;
y_y1       = 0;
y_y2       = 0;
f          = false;

if (argument_count > 0) {equip_slot = argument[0];}
if (argument_count > 1) {x_x1       = argument[1];}
if (argument_count > 2) {x_x2       = argument[2];}
if (argument_count > 3) {y_y1       = argument[3];}
if (argument_count > 4) {y_y2       = argument[4];}
if (argument_count > 5) {f          = argument[5];}

if (mouse_in(x_x1, x_x2, y_y1, y_y2) || f)
{
if ((oInventory.drag && mouse_check_button_released(mb_left) && equiped[equip_slot]) || (f && equiped[equip_slot]))
                    {
                     equipmentUnequip(equip_slot, true);
                    }     
                     else if ((oInventory.drag && mouse_check_button_released(mb_left) && !equiped[equip_slot]) || f)
                        {                       
                         oInventory.pre_switch = 1;
                         equiped[equip_slot]   = 1;
                         
                         equiped_image[equip_slot, 0] =  equip_sprite_s[0];
                         equiped_image[equip_slot, 1] =  equip_sprite_s[1];
                         equiped_image[equip_slot, 2] =  equip_sprite_s[2];
                         equiped_image[equip_slot, 3] =  equip_sprite_s[3];                                                                                                                                                        
                         equiped_image[equip_slot, 4] =  equip_sprite_s[4];      
                                         
                         drag = 0;
                         drag_controll = 0;

                         for (a = 0; a < celkem_vlastnosti; a++)
                             {
                              equiped_vlastnost[equip_slot,a] = slot_vlastnosti[h_c, a];
                              
                              if (a != vlastnost_bodyCanvasIndex && a != vlastnost_bodyCanvasSprite && a!= vlastnost_bodyCanvasSlashSprite)
                              {
                              oPlayer.vlastnost[a] += slot_vlastnosti[h_c, a];
                              }
                              else if (slot_vlastnosti[h_c,vlastnost_bodyCanvasIndex] != 0)
                                {
                                 if (a == vlastnost_bodyCanvasSprite) {oPlayer.bci[0, slot_vlastnosti[h_c,vlastnost_bodyCanvasIndex]] = slot_vlastnosti[h_c,a];}
                                 if (a == vlastnost_bodyCanvasSlashSprite) {oPlayer.bci[animationEnum.slash, slot_vlastnosti[h_c,vlastnost_bodyCanvasIndex]] = slot_vlastnosti[h_c,a]; }                                
                                }                                                    
                             }
                             
                         for (a = 0; a < inv_atributes_total; a++)
                         {
                          equiped_stats[equip_slot,a] = temp_equip[a];
                         
                          if(scrInventoryParseString(a))
                            {
                             slot[h_c,a] = 0;
                            }
                         else {slot[h_c,a] = "";}  
                   
                         if (a == inv_sprite) {slot[h_c,a] = sFreeSlot;}    
                         } 
                          
                          // NEW
                          if (equiped_stats[equip_slot,inv_item_equip_slot] == "zbraň")
                            {
                             oPlayer.draw_equ[id_Mec,0] =  equiped_vlastnost[equip_slot,vlastnost_vykresli_sprit];
                             oPlayer.draw_equ[id_Mec,1] =  equiped_vlastnost[equip_slot,vlastnost_vykresli_index];
                            }

                          draw_item_mouse = 0;
           
                        for (b = 0; b<10; b++)
                            {                              
                             equiped_option[equip_slot,b] = switch_option[0,b];
                             switch_option[h_c,b] = "";                
                            }                                       
                                               
                        for (a = 0; a < celkem_vlastnosti; a++)
                            {
                             slot_vlastnosti[h_c,a] = 0;                                                      
                            }
                        }
                
}
