#define inventoryCombinations
/// inventoryCombinations(id, slot.id, slot)

var idd, s, S;
idd = 0;
s   = 0;
S   = 0;

if (argument_count > 0) {idd = argument[0];}
if (argument_count > 1) {s   = argument[1];}
if (argument_count > 2) {S   = argument[2];}

switch (idd)
           {
            case(itemEnum.itemWhetstone):
                    {
                     if (slot[S, inv_item_equip_slot] == "zbraň") {return true;}    
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

switch(id1)
           {
            case(itemEnum.itemWhetstone):
                    { 
                     if (slot[slot2, inv_item_equip_slot] == "zbraň")
                        {                       
                         slot_vlastnosti[slot2, vlastnost_durability] = min(slot_vlastnosti[slot2,vlastnost_durability] + 20, slot_vlastnosti[slot2,vlastnost_max_durability]); 
                         inventoryDelete(itemEnum.itemWhetstone, 1); 
                         stateAddEntry("Nabrousil jsi " + string_lower(slot[slot2, inv_item_info_head]) + ".");
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