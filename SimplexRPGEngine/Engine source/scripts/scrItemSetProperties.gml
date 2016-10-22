/// scrItemSetProperties(stackable, infoHeadText, infoBodyText, materialType, equipSlot, price, rarity, [wordwrapText])

var w;
w = true;

if (argument_count > 7) {w = argument[0];}

itm_stackable              = false;
itm_sprite_number          = image_index;
itm_info_head              = "item name";
itm_info_text              = "item text";
itm_sprite                 = sprite_index;
itm_equip_slot             = "";
itm_materialType           = materialEnum.materialNone;
itm_info_color             = rarity_normal; 
itm_effect                 = rarity_normal;
vlastnost[vlastnost_cena]  = 0;

if (argument_count > 0) {itm_stackable              = argument[0];}
if (argument_count > 1) {itm_info_head              = argument[1];}
if (argument_count > 2) {itm_info_text              = argument[2];}
if (argument_count > 3) {itm_materialType           = argument[3];}
if (argument_count > 4) {itm_equip_slot             = argument[4];}
if (argument_count > 5) {vlastnost[vlastnost_cena]  = argument[5];}
if (argument_count > 6) {itm_info_color = argument[6]; itm_effect = argument[6];}

if (w) {itm_info_text                        = scrWordwrap(itm_info_text, 196, fntPixelSmall);}
else {itm_info_text                          = itm_info_text;}
vlastnost[vlastnost_originalniCena]          = vlastnost[vlastnost_cena];
