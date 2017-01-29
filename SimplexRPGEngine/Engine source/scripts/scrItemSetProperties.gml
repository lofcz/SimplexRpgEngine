/// scrItemSetProperties(stackable, infoHeadText, infoBodyText, materialType, equipSlot, price, rarity, wordwrapText, infoFooterText, infoFooterColor, durability, maxDurability, repairCost, isIdentified, isCursed)

var w;
w = true;

if (argument_count > 7) {w = argument[0];}

itm_stackable              = false;
itm_sprite_number          = image_index;
itm_info_head              = "item name";
itm_info_text              = "item text";
itm_info_footer            = "";
itm_sprite                 = sprite_index;
itm_equip_slot             = "";
itm_materialType           = materialEnum.materialNone;
itm_info_color             = rarity_normal; 
itm_effect                 = rarity_normal;
itm_info_footer_color      = c_dkgray;
vlastnost[vlastnost_cena]  = 0;
vlastnost[vlastnost_durability]     = -1;
vlastnost[vlastnost_max_durability] = -1;
vlastnost[vlastnost_repairCost]     = 1;

if (argument_count > 0) {itm_stackable              = argument[0];}
if (argument_count > 1) {itm_info_head              = argument[1];}
if (argument_count > 2) {itm_info_text              = argument[2];}
if (argument_count > 3) {itm_materialType           = argument[3];}
if (argument_count > 4) {itm_equip_slot             = argument[4];}
if (argument_count > 5) {vlastnost[vlastnost_cena]  = argument[5];}
if (argument_count > 6) {itm_info_color = argument[6]; itm_effect = argument[6];}
if (argument_count > 7) {w                          = argument[7];}
if (argument_count > 8) {itm_info_footer            = argument[8];}
if (argument_count > 9) {itm_info_footer_color      = argument[9];}
if (argument_count > 10) {vlastnost[vlastnost_durability]      = argument[10];}
if (argument_count > 11) {vlastnost[vlastnost_max_durability]  = argument[11];}
if (argument_count > 12) {vlastnost[vlastnost_repairCost]      = argument[12];}
if (argument_count > 13) {vlastnost[vlastnost_identified]      = argument[13];}
if (argument_count > 14) {vlastnost[vlastnost_cursed]          = argument[14];}

if (w) {itm_info_text   = scrWordwrap(string(itm_info_text), 196, fntPixelSmall);}
if (w) {itm_info_footer = scrWordwrap(string(itm_info_footer), 196, fntPixelTiny);}

vlastnost[vlastnost_originalniCena] = vlastnost[vlastnost_cena];
