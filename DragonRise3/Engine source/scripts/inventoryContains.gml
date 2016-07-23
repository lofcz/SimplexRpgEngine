/// inventoryContains(id, slot)

idd = 1;
slt = -1;

if (argument_count > 0) {idd  = argument[0];}
if (argument_count > 1) {slt = argument[1];}


if (slt = -1)
   {
     for (a = 0; a < oInventory.slots; a++)
   {
    if (oInventory.slot[a,inv_id] = idd)
       {
        return 1;
       }
   
   } 
   return 0;

   
   } 
else
    {
    
      if (oInventory.slot[slt,inv_id] = idd)
       {
        return 1;
       }
  return 0;

    

   }
