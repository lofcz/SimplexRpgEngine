/// @function cpItemIni(itemID, stackable, maxStackSize, name, description, price, weight, durability, maxDurability, identified)
/// @desc Initializes basic item atributes
/// @arg {e_items} itemID ID of item
/// @arg {bool} stackable Is item stackable?
/// @arg {int} maxStackSize Max stack size of item
/// @arg {string} name Items name
/// @arg {string} description Items description
/// @arg {int} price Items price
/// @arg {int} weight Items weight
/// @arg {int} durability Insert -1 to turn this off
/// @arg {int} maxDurability Insert -1 to turn this off
/// @arg {bool} identified Is item identified?

event_inherited();

v_itemAtributes[e_inventoryAtributes.valID] = e_items.valNONE;
v_itemAtributes[e_inventoryAtributes.valStackable] = false
v_itemAtributes[e_inventoryAtributes.valMaxStackSize] = 1;
v_itemAtributes[e_inventoryAtributes.valInfoTextHead] = "";
v_itemAtributes[e_inventoryAtributes.valInfoTextBody] = "";
v_itemAtributes[e_inventoryAtributes.valPriceBase] = 0;
v_itemAtributes[e_inventoryAtributes.valWeight] = 0;
v_itemAtributes[e_inventoryAtributes.valDurability] = -1;
v_itemAtributes[e_inventoryAtributes.valMaxDurability] = -1;
v_itemAtributes[e_inventoryAtributes.valIdentified] = true;

if (argument_count > 0) {v_itemAtributes[e_inventoryAtributes.valID] = argument[0];}
if (argument_count > 1) {v_itemAtributes[e_inventoryAtributes.valStackable] = argument[1];}
if (argument_count > 2) {v_itemAtributes[e_inventoryAtributes.valMaxStackSize] = argument[2];}
if (argument_count > 3) {v_itemAtributes[e_inventoryAtributes.valInfoTextHead] = argument[3];}
if (argument_count > 4) {v_itemAtributes[e_inventoryAtributes.valInfoTextBody] = argument[4];}
if (argument_count > 5) {v_itemAtributes[e_inventoryAtributes.valPriceBase] = argument[5];}
if (argument_count > 6) {v_itemAtributes[e_inventoryAtributes.valWeight] = argument[6];}
if (argument_count > 7) {v_itemAtributes[e_inventoryAtributes.valDurability] = argument[7];}
if (argument_count > 8) {v_itemAtributes[e_inventoryAtributes.valMaxDurability] = argument[8];}
if (argument_count > 9) {v_itemAtributes[e_inventoryAtributes.valIdentified] = argument[9];}

v_itemAtributes[e_inventoryAtributes.valSprite] = sItems;
v_itemAtributes[e_inventoryAtributes.valImageIndex] = v_itemAtributes[e_inventoryAtributes.valID] - 4;
v_itemAtributes[e_inventoryAtributes.valItemNumber] = 1;
v_itemAtributes[e_inventoryAtributes.valEquipSlot] = -1;

v_tempSprite = sprite_index;

sprite_index = v_itemAtributes[e_inventoryAtributes.valSprite];
image_index = v_itemAtributes[e_inventoryAtributes.valID] - 2;
