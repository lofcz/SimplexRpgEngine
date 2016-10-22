/// scrShopSetPrice(slot, price)

var slot, price;
slot  = 0;
price = 5;

if (argument_count > 0) {slot  = argument[0];}
if (argument_count > 1) {price = argument[1];}

if (instance_exists(item[slot]))
    {
     item[slot].vlastnost[vlastnost_cena]           = price;
    }
