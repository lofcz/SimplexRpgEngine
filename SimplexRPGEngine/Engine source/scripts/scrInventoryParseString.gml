/// scrInventoryParseString()

var a;
a = 0;

if (argument_count > 0) {a = argument[0];}

if (a != inv_item_info_head && a != inv_item_info_text && a != inv_options && a !=inv_item_equip_slot) {return true;}
return false;
