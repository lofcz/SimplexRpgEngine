#define inventoryCombinations
/// inventoryCombinations(id,slot.id)

idd  = argument0;
s    = argument1;


switch(idd)
           {
            // Dřevěný meč
            case(3):
                    {
                    // Dřevěný meč
                     if (s == 3) {return true;} 
                    
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
            // Dřevěný meč
            case(3):
                    {
                     // Dřevěný meč
                     if (id2 = 3)
                        {                         
                         slot_vlastnosti[slot2,vlastnost_poskozeni] += slot_vlastnosti[slot1,vlastnost_poskozeni];
                         inventoryDrop(slot1,-1,-1);   
                        }
                    
                        
                      break;
                    }
           
           }