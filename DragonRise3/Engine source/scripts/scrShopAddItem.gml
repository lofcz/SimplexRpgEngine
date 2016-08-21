/// scrShopAddItem(slot, item, count)

var slot, n, count;
slot  = 0;
item  = oRedPearlLvl2;
count = 1;

if (argument_count > 0) {slot  = argument[0];}
if (argument_count > 1) {item  = argument[1];}
if (argument_count > 2) {count = argument[2];}

loot[slot, ext_name] = item;
loot[slot, ext_number] = count;
scrShopPrepare(slot);
