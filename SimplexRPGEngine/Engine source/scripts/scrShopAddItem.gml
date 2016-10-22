/// scrShopAddItem(slot, item, count)

var s, n, count, i;
s     = 0;
i     = oRedPearlLvl2;
count = 1;

if (argument_count > 0) {s     = argument[0];}
if (argument_count > 1) {i     = argument[1];}
if (argument_count > 2) {count = argument[2];}

// If slot is free, add new item
if (loot[s, ext_name] == -1)
    {
     loot[s, ext_name]   = i;
     loot[s, ext_number] = count;
     scrShopPrepare(s);
    }
else
    {
      // In the other case, increase item number / override item
      if (loot[s, ext_name] == i)
         {
          item[s].itm_number += count;
         }
      else
         {
          with(item[s]) {instance_destroy();}
          
          loot[s, ext_name]   = i;
          loot[s, ext_number] = count;
          scrShopPrepare(s);          
         }
    }



