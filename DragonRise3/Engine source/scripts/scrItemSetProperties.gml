/// scrItemSetProperties(stackable, infoHeadText, infoBodyText, materialType, equipSlot)

itm_stackable           = false;
itm_sprite_number       = image_index;
itm_info_head           = "item name";
itm_info_text           = "item text";
itm_sprite              = sprite_index;
itm_equip_slot          = "";
itm_materialType        = materialEnum.materialNone;

if (argument_count > 0) {itm_stackable           = argument[0];}
if (argument_count > 1) {itm_info_head           = argument[1];}
if (argument_count > 2) {itm_info_text           = argument[2];}
if (argument_count > 3) {itm_materialType        = argument[3];}
if (argument_count > 4) {itm_equip_slot          = argument[4];}

