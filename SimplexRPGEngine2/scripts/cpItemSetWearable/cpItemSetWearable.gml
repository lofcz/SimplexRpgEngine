/// @function cpItemSetWearable(equipSlot, walkAnimation, runAnimation, attackAnimation)
/// @desc Marks this item as equipable
/// @arg {e_equipmentSlots} equipSlot Slot in which can be item equiped
/// @arg {sprite} walkAnimation Animation for walking
/// @arg {sprite} runAnimation Animation for running
/// @arg {sprite} attackAnimation Animation for attack

v_itemAtributes[e_inventoryAtributes.valEquipSlot] = e_equipmentSlots.valWeaponRight;

if (argument_count > 0) {v_itemAtributes[e_inventoryAtributes.valEquipSlot] = argument[0];}
if (argument_count > 1) {v_itemAnimation[e_animations.valWalk] = argument[1];}
if (argument_count > 2) {v_itemAnimation[e_animations.valRun] = argument[2];}
if (argument_count > 3) {v_itemAnimation[e_animations.valSlash] = argument[3];}
