/// scrShopSetDiscount(slot, discount%)

var s, d, newPrice;
s = 0;
d = 20;

if (argument_count > 0) {s = argument[0];}
if (argument_count > 1) {d = argument[1];}

newPrice = (((item[s]).vlastnost[vlastnost_cena] / 100) * (100 - d));
(item[s]).vlastnost[vlastnost_cena] = newPrice;
