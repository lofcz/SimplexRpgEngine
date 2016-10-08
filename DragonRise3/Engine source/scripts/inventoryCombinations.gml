#define inventoryCombinations
/// inventoryCombinations(id,slot.id)

idd  = argument0;
s    = argument1;


switch(idd)
           {
            case(3):
                    {
                     if (s == 3) {return true;}    
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
/// inventoryCombine(id1,id2,slot1,slot2)

id1 = argument0;
id2 = argument1;
slot1 = argument2;
slot2 = argument3;

switch(id1)
           {
            case(3):
                    {
                     if (id2 = 3)
                        {                         
                         slot_vlastnosti[slot2,vlastnost_poskozeni] += slot_vlastnosti[slot1,vlastnost_poskozeni];
                         inventoryDrop(slot1,-1,-1);   
                        }
                     break;
                    }
            case(itemEnum.itemRelicRightPart):
                    {
                     if (id2 = itemEnum.itemRelicLeftPart)
                        {                         
                         inventoryDelete(itemEnum.itemRelicLeftPart, 1);  
                         inventoryDelete(itemEnum.itemRelicRightPart, 1); 
                         inventoryAdd(oRelic, 1);
                        }
                     break;
                    }      
            case(itemEnum.itemRelicLeftPart):
                    {
                     if (id2 = itemEnum.itemRelicRightPart)
                        {                         
                         inventoryDelete(itemEnum.itemRelicLeftPart, 1);  
                         inventoryDelete(itemEnum.itemRelicRightPart, 1); 
                         inventoryAdd(oRelic, 1);
                        }
                     break;
                    }      
           }
