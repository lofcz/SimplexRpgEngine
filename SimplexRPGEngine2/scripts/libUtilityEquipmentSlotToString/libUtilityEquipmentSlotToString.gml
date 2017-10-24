/// @function libUtilityEquipmentSlotToString(equipmentSlot)

var tmp_string;
tmp_string = argument0;

if (tmp_string == e_equipmentSlots.valBelt) {return "Belt";}
if (tmp_string == e_equipmentSlots.valBooster) {return "Booster";}
if (tmp_string == e_equipmentSlots.valCard) {return "Card";}
if (tmp_string == e_equipmentSlots.valChest) {return "Armor";}
if (tmp_string == e_equipmentSlots.valFoots) {return "Boots";}
if (tmp_string == e_equipmentSlots.valHands) {return "Gloves";}
if (tmp_string == e_equipmentSlots.valHead) {return "Helmet";}
if (tmp_string == e_equipmentSlots.valLegs) {return "Legs";}
if (tmp_string == e_equipmentSlots.valMedail) {return "Medail";}
if (tmp_string == e_equipmentSlots.valNecklace) {return "Necklace";}
if (tmp_string == e_equipmentSlots.valRing1 || tmp_string == e_equipmentSlots.valRing2) {return "Ring";}
if (tmp_string == e_equipmentSlots.valShoulders) {return "Shoulders";}
if (tmp_string == e_equipmentSlots.valSoul) {return "Soul";}
if (tmp_string == e_equipmentSlots.valTrophy) {return "Trophy";}
if (tmp_string == e_equipmentSlots.valWeaponLeft) {return "Offhand";}
if (tmp_string == e_equipmentSlots.valWeaponRight) {return "Weapon";}

return "";