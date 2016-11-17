/// equipmentNormalizeValue(index, value)

var i, v, l;
i = 0;
v = 1;

if (argument_count > 0) {i = argument[0];}
if (argument_count > 1) {v = argument[1];}

l = ((oInventory.equiped_vlastnost[i, vlastnost_durability] / oInventory.equiped_vlastnost[i, vlastnost_max_durability]) * 100);

if (l >= 50) {return v;}
if (l >= 25) {return ((v / 4) * 3);}
if (oInventory.equiped_vlastnost[i, vlastnost_durability] > 1)  {return (v / 2);}
return (v / 5);
