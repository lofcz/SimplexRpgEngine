/// equipmentUnequip(slot, forceSlot)

var e_slot, fSlot, tul, free_slot;
e_slot    = argument0;
fSlot     = argument1;
tul       = true;
free_slot = -1;

if (!fSlot)
{             
for(a = 0; a < oInventory.slots; a++)
    {                                                                                        
     if (oInventory.slot[a,inv_id] == 0)
        {
        free_slot = a;  
        break;                                                                       
        }                        
     } 
      if (free_slot = -1)
         {
          apiPlayerSay("Potřebuji místo na sundání předmětu.");                                                                               
         }
      else
      {            
           if (e_slot == 0) {oPlayerCombat.draw = 0;}  
                      
              // NEW
              if (equiped_stats[e_slot,inv_item_equip_slot] == "zbraň")
                {
                 oPlayer.draw_equ[id_Mec,0] = 0;
                 oPlayer.draw_equ[id_Mec,1] = 0;
                 oPlayerCombat.draw         = 0;
                 oPlayerCombat.sprite         = 0;
                // oPlayer.bci[0, 7]          = 0;                  
                 }
                                                                                                                                                                                                                                          
            for(a = 0; a < inv_atributes_total; a++)
                  {
                   if (a == inv_sprite_number) {equiped_stats[0,a] = equiped_image[0,1];}
                   slot[free_slot,a] = equiped_stats[e_slot,a];
                   equiped_stats[e_slot] = 0;
                  }
            equiped_image[e_slot,0] = sFreeSlot; 
            equiped_image[e_slot,1] = 0;
            equiped[e_slot]         = false;

            for (a = 0; a < celkem_vlastnosti; a++)
                  {                          
                   slot_vlastnosti[free_slot,a] = equiped_vlastnost[e_slot,a];                 
                   slot_vlastnosti_static[free_slot,a] = equiped_vlastnost_static[e_slot,a];                 
                              
                   if (a != vlastnost_bodyCanvasIndex && a != vlastnost_bodyCanvasSprite && a != vlastnost_bodyCanvasSlashSprite && a != vlastnost_bodyCanvasFireSprite && a != vlastnost_bodyCanvasDieSprite && a != vlastnost_bodyCanvasBashSprite && a != vlastnost_bodyCanvasThrustSprite)
                      {
                       oPlayer.vlastnostStatic[a] -= (equiped_vlastnost[e_slot,a] + equiped_vlastnost_static[e_slot,a]);
                      }
                   else if (equiped_vlastnost[e_slot,vlastnost_bodyCanvasIndex] != 0)
                        {
                         if (a == vlastnost_bodyCanvasSprite) {oPlayer.bci[0, equiped_vlastnost[e_slot,vlastnost_bodyCanvasIndex]] = 0;}
                         if (a == vlastnost_bodyCanvasSlashSprite) {oPlayer.bci[animationEnum.slash, equiped_vlastnost[e_slot,vlastnost_bodyCanvasIndex]] = 0;}    
                         if (a == vlastnost_bodyCanvasFireSprite) {oPlayer.bci[animationEnum.fire, equiped_vlastnost[e_slot,vlastnost_bodyCanvasIndex]] = 0;}    
                         if (a == vlastnost_bodyCanvasDieSprite) {oPlayer.bci[animationEnum.die, equiped_vlastnost[e_slot,vlastnost_bodyCanvasIndex]] = 0;}    
                         if (a == vlastnost_bodyCanvasBashSprite) {oPlayer.bci[animationEnum.bash, equiped_vlastnost[e_slot,vlastnost_bodyCanvasIndex]] = 0;}    
                         if (a == vlastnost_bodyCanvasThrustSprite) {oPlayer.bci[animationEnum.thrust, equiped_vlastnost[e_slot,vlastnost_bodyCanvasIndex]] = 0;}                                                                                                                                                               
                        }                   
                  }            
            for(a=0; a<10; a++)  {oInventory.slot_option[free_slot,a] = equiped_option[e_slot,a];}
        }
}
else 
{
 // Store temp vars from old item
 for(a = 0; a < inv_atributes_total; a++)
    {
     tempEqipStats[a] = equiped_stats[e_slot,a];

     equiped_stats[e_slot] = "";
    }
 for (a = 0; a < celkem_vlastnosti; a++)
    {                          
     oPlayer.vlastnost[a]        -= (equiped_vlastnost[e_slot,a] + equiped_vlastnost_static[e_slot,a]);
     tempSlotVlastnosti[a]        = equiped_vlastnost[e_slot,a];
     tempSlotVlastnostiStatic[a]        = equiped_vlastnost_static[e_slot,a];
    
     equiped_vlastnost[e_slot,a]  = 0;
     equiped_vlastnost_static[e_slot,a]  = 0;
    }            
 for(a=0; a<10; a++)  {tempOption[a] = equiped_option[e_slot,a];}
 
 if (tempEqipStats[inv_item_equip_slot] == "zbraň")
    {
     oPlayer.draw_equ[id_Mec,0] = 0;
     oPlayer.draw_equ[id_Mec,1] = 0;
     oPlayerCombat.draw         = 0;
     oPlayer.bci[0, 7]          = 0;                             
     }
 
 equiped_image[e_slot,0] = sFreeSlot; 
 equiped_image[e_slot,1] = 0;
 equiped[e_slot]         = false;
 
 // Equip new item
 equipmentHoldEquip(e_slot, 0, 0, 0, 0, true);
 
 // Restore old item from the memory
 for(a = 0; a < inv_atributes_total; a++)
    {
     oInventory.slot[h_c, a] = tempEqipStats[a];
    }
 for (a = 0; a < celkem_vlastnosti; a++)
    {                          
     slot_vlastnosti[h_c, a] = tempSlotVlastnosti[a];
     slot_vlastnosti_static[h_c, a] = tempSlotVlastnostiStatic[a];
    }            
 for(a=0; a<10; a++)  {oInventory.slot_option[h_c, a] = tempOption[a];}
}
     
     
