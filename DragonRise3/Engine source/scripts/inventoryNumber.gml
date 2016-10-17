/// inventoryNumber(id)

var idd, ret;
idd = 1;
ret = 0;

if (argument_count > 0) {idd = argument[0];}

for (a = 0; a < oInventory.slots; a++)
    {
     if (oInventory.slot[a, inv_id] == idd)
        {
         ret += oInventory.slot[a, inv_number];
        }    
    }    
    
return (ret);
