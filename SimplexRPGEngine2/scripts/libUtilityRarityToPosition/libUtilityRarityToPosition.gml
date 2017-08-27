/// @function cpUtilityRarityToPosition(rarity)
/// @desc Returns x,y of target rarity in current UI sprite
/// @arg {e_rarities} rarity Rarity to check

var tmp_rarity, tmp_array;
tmp_rarity = e_rarities.valCommon;

if (argument_count > 0) {tmp_rarity = argument[0];}

if (tmp_rarity == e_rarities.valCommon) {tmp_array[0] = -1; tmp_array[1] = -1;}
if (tmp_rarity == e_rarities.valTrash) {tmp_array[0] = -1; tmp_array[1] = -1;}
if (tmp_rarity == e_rarities.valUncommon) {tmp_array[0] = 274; tmp_array[1] = 518;}
if (tmp_rarity == e_rarities.valRare) {tmp_array[0] = 312; tmp_array[1] = 518;}
if (tmp_rarity == e_rarities.valVeryRare) {tmp_array[0] = 350; tmp_array[1] = 518;}
if (tmp_rarity == e_rarities.valLegendary) {tmp_array[0] = 429; tmp_array[1] = 518;}

return tmp_array;