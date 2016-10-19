/// scrShopAddItem(slot, item, count)

var s, n, count;
s     = 0;
item  = oRedPearlLvl2;
count = 1;

if (argument_count > 0) {s     = argument[0];}
if (argument_count > 1) {item  = argument[1];}
if (argument_count > 2) {count = argument[2];}

loot[s, ext_name] = item;
loot[s, ext_number] = count;

