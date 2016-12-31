/// scrItemCollectibleSetUp(itemID, collectibleID, type)

idd     = itemEnum.itemCollectible1;
idd2    = 0;
tempSpr = sprite_index;
type    = 0;

if (argument_count > 0) {idd  = argument[0];}
if (argument_count > 1) {idd2 = argument[1];}
if (argument_count > 2) {type = argument[2];}

sprite_index = sTestItem;
image_index  = idd - 1;
image_speed  = 0;

itm_info_head = ""
itm_stackable = false;
itm_number    = 1;
itm_effect    = rarity_legendary;
alarm[0]      = 1;
 
