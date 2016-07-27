/// scrShopSetDiscount(slot, discount%)

var s, d, newPrice;
s = 0;
d = 20;

newPrice = (((item[s]).vlastnost[vlastnost_cena] / 100) * (100 - d));
(item[s]).vlastnost[vlastnost_cena] = newPrice;
