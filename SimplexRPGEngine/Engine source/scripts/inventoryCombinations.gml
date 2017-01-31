#define inventoryCombinations
/// inventoryCombinations(id, slot.id, slot)

var idd, s, S;
idd = 0;
s   = 0;
S   = 0;

if (argument_count > 0) {idd = argument[0];}
if (argument_count > 1) {s   = argument[1];}
if (argument_count > 2) {S   = argument[2];}

if (slot[S, inv_sprite] != sFreeSlot)
{
switch (idd)
           {
            case(itemEnum.itemWhetstone):
                    {
                     if (slot[S, inv_item_equip_slot] == "zbraň") {return true;}    
                     break;                 
                    }
            case(itemEnum.itemRename):
                    {
                     if (!slot[S, inv_stackable]) {return true;}    
                     break;                 
                    } 
            case(itemEnum.itemIdentification):
                    {
                     if (!slot_vlastnosti[S, vlastnost_identified]) {return true;}    
                     break;                 
                    }                   
            case(itemEnum.itemArcaneUpgrade1):
                    {
                     if (slot[S, inv_item_equip_slot] != "" && slot_vlastnosti[S, vlastnost_reinforcementLevel] < 3 && (slot[S, inv_item_effect] == rarity_normal || slot[S, inv_item_effect] == rarity_junk)) {return true;}    
                     break;                 
                    }   
            case(itemEnum.itemArcaneUpgrade2):
                    {
                     if (slot[S, inv_item_equip_slot] != "" && slot_vlastnosti[S, vlastnost_reinforcementLevel] < 5 && (slot[S, inv_item_effect] == rarity_normal || slot[S, inv_item_effect] == rarity_junk || slot[S, inv_item_effect] == rarity_fine || slot[S, inv_item_effect] == rarity_rare)) {return true;}    
                     break;                 
                    }   
            case(itemEnum.itemArcaneUpgrade3):
                    {
                     if (slot[S, inv_item_equip_slot] != "" && slot_vlastnosti[S, vlastnost_reinforcementLevel] < 8 && (slot[S, inv_item_effect] == rarity_normal || slot[S, inv_item_effect] == rarity_junk || slot[S, inv_item_effect] == rarity_fine || slot[S, inv_item_effect] == rarity_rare) || slot[S, inv_item_effect] == rarity_mythic) {return true;}    
                     break;                 
                    }  
            case(itemEnum.itemArcaneUpgrade4):
                    {
                     if (slot[S, inv_item_equip_slot] != "" && slot_vlastnosti[S, vlastnost_reinforcementLevel] < 10) {return true;}    
                     break;                 
                    } 
            case(itemEnum.itemArcaneUpgrade5):
                    {
                     if (slot[S, inv_item_equip_slot] != "" && slot_vlastnosti[S, vlastnost_reinforcementLevel] == 10) {return true;}    
                     break;                 
                    }      
            case(itemEnum.itemEnchanter):
                    {
                     if (slot[S, inv_item_equip_slot] != "" && (slot[S, inv_item_effect] == rarity_normal || slot[S, inv_item_effect] == rarity_junk)) {return true;}    
                     break;                 
                    }  
            case(itemEnum.itemEmendation1):
                    {
                     if (slot[S, inv_item_equip_slot] != "" && (slot[S, inv_item_effect] == rarity_normal || slot[S, inv_item_effect] == rarity_junk)) {return true;}    
                     break;                 
                    } 
            case(itemEnum.itemPowerWord1):
                    {
                     if (slot[S, inv_item_equip_slot] != "") {return true;}    
                     break;                 
                    }                                                                                                                                                    
            case(itemEnum.itemRelicLeftPart):
                    {
                     if (s == itemEnum.itemRelicRightPart) {return true;}    
                     break;                 
                    }    
            case(itemEnum.itemRelicRightPart):
                    {
                     if (s == itemEnum.itemRelicLeftPart) {return true;}    
                     break;                 
                    }        
           } 
}          
return false;

#define inventoryCombine
/// inventoryCombine(id1, id2, slot1, slot2)

var id1, id2, slot1, slot2;
id1   = 0;
id2   = 0;
slot1 = 0;
slot2 = 1;

if (argument_count > 0) {id1   = argument[0];}
if (argument_count > 1) {id2   = argument[1];}
if (argument_count > 2) {slot1 = argument[2];}
if (argument_count > 3) {slot2 = argument[3];}

if (slot[slot2, inv_sprite] != sFreeSlot)
{
switch(id1)
           {
            case(itemEnum.itemWhetstone):
                    { 
                     if (slot[slot2, inv_item_equip_slot] == "zbraň")
                        {                       
                         slot_vlastnosti[slot2, vlastnost_durability] = min(slot_vlastnosti[slot2,vlastnost_durability] + 20, slot_vlastnosti[slot2,vlastnost_max_durability]); 
                         inventoryDelete(itemEnum.itemWhetstone, 1); 
                         stateAddEntry("Nabrousil jsi " + string_lower(slot[slot2, inv_item_info_head]) + ".");
                         audio_play_sound(sndWhetstone1, 0, false);
                        }  
                     break;
                    }
            case(itemEnum.itemRename):
                    { 
                     if (!slot[slot2, inv_stackable])
                        {    
                         inventoryDelete(itemEnum.itemRename, 1); 
                         var i = scrGetString();
                         i.data[0] = slot2;
                         i.data[1] = slot_vlastnosti[slot2, vlastnost_reinforcementLevel];
                         i.mode    = "rename";
                        }  
                     break;
                    }   
            case(itemEnum.itemIdentification):
                    { 
                      if (!slot_vlastnosti[slot2, vlastnost_identified])
                        {    
                         inventoryDelete(itemEnum.itemIdentification, 1); 
                         slot_vlastnosti[slot2, vlastnost_identified] = true;
                         stateAddEntry("Identifikoval jsi " + slot[slot2, inv_item_info_head]);
                         sfx(sndIdentify);
                        }  
                     break;
                    }                       
                                 
            case(itemEnum.itemArcaneUpgrade1):
                    { 
                     if (slot[slot2, inv_item_equip_slot] != "" && slot_vlastnosti[slot2, vlastnost_reinforcementLevel] < 3 && (slot[slot2, inv_item_effect] == rarity_junk || slot[slot2, inv_item_effect] == rarity_normal))
                        {   
                         slot_vlastnosti[slot2, vlastnost_reinforcementLevel]++;                                              
                         inventoryDelete(itemEnum.itemArcaneUpgrade1, 1); 
                         scrItemUpdateReinforcementName(slot2);
                         scrItemUpdateReinforcementStats(slot2);
                         stateAddEntry("Vylepšil jsi " + string_lower(slot[slot2, inv_item_info_head]) + ".");
                         audio_play_sound(sndArcane1, 0, false);
                        }  
                     break;
                    }  
            case(itemEnum.itemArcaneUpgrade2):
                    { 
                     if (slot[slot2, inv_item_equip_slot] != "" && slot_vlastnosti[slot2, vlastnost_reinforcementLevel] < 5 && (slot[slot2, inv_item_effect] == rarity_junk || slot[slot2, inv_item_effect] == rarity_normal || slot[slot2, inv_item_effect] == rarity_fine || slot[slot2, inv_item_effect] == rarity_rare))
                        {   
                         slot_vlastnosti[slot2, vlastnost_reinforcementLevel]++;                                              
                         inventoryDelete(itemEnum.itemArcaneUpgrade2, 1); 
                         scrItemUpdateReinforcementName(slot2);
                         scrItemUpdateReinforcementStats(slot2);
                         stateAddEntry("Vylepšil jsi " + string_lower(slot[slot2, inv_item_info_head]) + ".", c_lime);
                         audio_play_sound(sndArcane2, 0, false);
                        }  
                     break;
                    }
            case(itemEnum.itemArcaneUpgrade3):
                    { 
                     if (slot[slot2, inv_item_equip_slot] != "" && slot_vlastnosti[slot2, vlastnost_reinforcementLevel] < 8 && (slot[slot2, inv_item_effect] == rarity_junk || slot[slot2, inv_item_effect] == rarity_normal || slot[slot2, inv_item_effect] == rarity_fine || slot[slot2, inv_item_effect] == rarity_rare || slot[slot2, inv_item_effect] == rarity_mythic))
                        {   
                         slot_vlastnosti[slot2, vlastnost_reinforcementLevel]++;                                              
                         inventoryDelete(itemEnum.itemArcaneUpgrade3, 1); 
                         scrItemUpdateReinforcementName(slot2);
                         scrItemUpdateReinforcementStats(slot2);
                         stateAddEntry("Vylepšil jsi " + string_lower(slot[slot2, inv_item_info_head]) + ".", rarity_fine);
                         audio_play_sound(sndArcane3, 0, false);
                        }  
                     break;
                    } 
            case(itemEnum.itemArcaneUpgrade4):
                    { 
                     if (slot[slot2, inv_item_equip_slot] != "" && slot_vlastnosti[slot2, vlastnost_reinforcementLevel] < 10)
                        {   
                         slot_vlastnosti[slot2, vlastnost_reinforcementLevel]++;                                              
                         inventoryDelete(itemEnum.itemArcaneUpgrade4, 1); 
                         scrItemUpdateReinforcementName(slot2);
                         scrItemUpdateReinforcementStats(slot2);
                         stateAddEntry("Vylepšil jsi " + string_lower(slot[slot2, inv_item_info_head]) + ".", rarity_legendary);
                         audio_play_sound(sndArcane4, 0, false);
                        }  
                     break;
                    }  
            case(itemEnum.itemArcaneUpgrade5):
                    { 
                     if (slot[slot2, inv_item_equip_slot] != "" && slot_vlastnosti[slot2, vlastnost_reinforcementLevel] == 10)
                        {   
                         slot_vlastnosti[slot2, vlastnost_reinforcementLevel]++;                                              
                         inventoryDelete(itemEnum.itemArcaneUpgrade5, 1); 
                         scrItemUpdateReinforcementName(slot2);
                         scrItemUpdateReinforcementStats(slot2);
                         stateAddEntry("Vylepšil jsi " + string_lower(slot[slot2, inv_item_info_head]) + " na nejvyšší stupeň!", rarity_legendary);
                         audio_play_sound(sndArcane5, 0, false);
                        }  
                     break;
                    }  
            case(itemEnum.itemEnchanter):
                    { 
                     if (slot[slot2, inv_item_equip_slot] != "" && (slot[slot2, inv_item_effect] == rarity_junk || slot[slot2, inv_item_effect] == rarity_normal) && slot_vlastnosti[slot2, vlastnost_upgradeSloty] < 3)
                        {   
                         slot_vlastnosti[slot2, vlastnost_upgradeSloty]++;  
                         slot_vlastnosti[slot2, vlastnost_maxUpgrade]++;                                            
                         inventoryDelete(itemEnum.itemEnchanter, 1); 
                         stateAddEntry("Přidal jsi nový perlový slot do " + string_lower(slot[slot2, inv_item_info_head]) + ".");
                         audio_play_sound(sndEnchanter, 0, false);
                        }  
                     break;
                    }  
            case(itemEnum.itemEmendation1):
                    { 
                     if (slot[slot2, inv_item_equip_slot] != "" && (slot[slot2, inv_item_effect] == rarity_junk || slot[slot2, inv_item_effect] == rarity_normal))
                        {   
                         if (slot[slot2, inv_item_effect]      == rarity_junk)   {scrItemUpdateRarity(rarity_normal, true, slot2);}
                         else if (slot[slot2, inv_item_effect] == rarity_normal) {scrItemUpdateRarity(rarity_rare, true, slot2);}
                                            
                         inventoryDelete(itemEnum.itemEmendation1, 1); 
                         stateAddEntry("Zvýšil jsi vzácnost " + string_lower(slot[slot2, inv_item_info_head]) + ".");
                         audio_play_sound(sndEmendation1, 0, false);
                        }  
                     break;
                    }
            case(itemEnum.itemPowerWord1):
                    { 
                     if (slot[slot2, inv_item_equip_slot] != "")
                        {       
                         if (slot[slot2, inv_item_equip_slot] == "zbraň") {slot_vlastnosti_static[slot2, vlastnost_poskozeni] += 3;}
                         else {slot_vlastnosti_static[slot2, vlastnost_max_zivot] += 15;}                                       
                         inventoryDelete(itemEnum.itemPowerWord1, 1); 
                         stateAddEntry("Požehnal jsi " + string_lower(slot[slot2, inv_item_info_head]) + " slovem moci.");
                         audio_play_sound(sndEmendation1, 0, false);
                        }  
                     break;
                    }                                                                                                                                                          
            case(itemEnum.itemRelicRightPart):
                    {
                     if (id2 == itemEnum.itemRelicLeftPart)
                        {                         
                         inventoryDelete(itemEnum.itemRelicLeftPart, 1);  
                         inventoryDelete(itemEnum.itemRelicRightPart, 1); 
                         inventoryAdd(oRelic, 1);
                        }
                     break;
                    }      
            case(itemEnum.itemRelicLeftPart):
                    {
                     if (id2 == itemEnum.itemRelicRightPart)
                        {                         
                         inventoryDelete(itemEnum.itemRelicLeftPart, 1);  
                         inventoryDelete(itemEnum.itemRelicRightPart, 1); 
                         inventoryAdd(oRelic, 1);
                        }
                     break;
                    }      
           }
}