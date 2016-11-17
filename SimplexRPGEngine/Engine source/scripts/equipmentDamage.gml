/// equipmentDamage(index, damage)

var i, d, rd, l, l2;
i = equipmentEnum.weapon;
d = 1;

if (argument_count > 0) {i = argument[0];}
if (argument_count > 1) {D = argument[1];}

// Do math
l   = ((oInventory.equiped_vlastnost[i, vlastnost_durability] / oInventory.equiped_vlastnost[i, vlastnost_max_durability]) * 100);
rd  = min(oInventory.equiped_vlastnost[i, vlastnost_durability] - 1, d); // Damage can't overflow item durability
oInventory.equiped_vlastnost[i, vlastnost_durability] -= rd;
l2  = ((oInventory.equiped_vlastnost[i, vlastnost_durability] / oInventory.equiped_vlastnost[i, vlastnost_max_durability]) * 100);

// Splash notifications
if (l >= 50 && l2 < 50) {stateAddEntry(oInventory.equiped_stats[i, inv_item_info_head] + " je lehce poškozený!", c_red);} 
if (l >= 25 && l2 < 25) {stateAddEntry(oInventory.equiped_stats[i, inv_item_info_head] + " je skoro zničený!", c_red);} 
if (oInventory.equiped_vlastnost[i, vlastnost_durability] == 1) {stateAddEntry(oInventory.equiped_stats[i, inv_item_info_head] + " je zničený!", c_red);} 

if (l != l2) {return true;}
return false;
