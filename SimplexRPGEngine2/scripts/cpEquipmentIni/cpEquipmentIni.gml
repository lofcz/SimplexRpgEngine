/// @function cpEquipmentIni()
/// @desc Initializes equipment

#macro mcEquipmentSlots 17

enum e_equipmentSlots
{
	valHead, 
	valNecklace, 
	valChest,
	valShoulders, 
	valWeaponRight, 
	valWeaponLeft, 
	valRing1, 
	valRing2, 
	valLegs, 
	valFoots, 
	valBelt, 
	valHands, 
	valCard, 
	valMedail, 
	valTrophy, 
	valSoul, 
	valBooster
}

v_equipmentSlots[e_equipmentSlots.valHead, 0] = 64;
v_equipmentSlots[e_equipmentSlots.valHead, 1] = 0;

v_equipmentSlots[e_equipmentSlots.valNecklace, 0] = 108;
v_equipmentSlots[e_equipmentSlots.valNecklace, 1] = 33;

v_equipmentSlots[e_equipmentSlots.valShoulders, 0] = 21;
v_equipmentSlots[e_equipmentSlots.valShoulders, 1] = 33;

v_equipmentSlots[e_equipmentSlots.valWeaponRight, 0] = 114;
v_equipmentSlots[e_equipmentSlots.valWeaponRight, 1] = 80;

v_equipmentSlots[e_equipmentSlots.valWeaponLeft, 0] = 10;
v_equipmentSlots[e_equipmentSlots.valWeaponLeft, 1] = 80;

v_equipmentSlots[e_equipmentSlots.valRing1, 0] = 4;
v_equipmentSlots[e_equipmentSlots.valRing1, 1] = 121;

v_equipmentSlots[e_equipmentSlots.valRing2, 0] = 28;
v_equipmentSlots[e_equipmentSlots.valRing2, 1] = 121;

v_equipmentSlots[e_equipmentSlots.valChest, 0] = 64;
v_equipmentSlots[e_equipmentSlots.valChest, 1] = 40;

v_equipmentSlots[e_equipmentSlots.valLegs, 0] = 64;
v_equipmentSlots[e_equipmentSlots.valLegs, 1] = 119;

v_equipmentSlots[e_equipmentSlots.valFoots, 0] = 64;
v_equipmentSlots[e_equipmentSlots.valFoots, 1] = 159;

v_equipmentSlots[e_equipmentSlots.valBelt, 0] = 64;
v_equipmentSlots[e_equipmentSlots.valBelt, 1] = 80;

v_equipmentSlots[e_equipmentSlots.valHands, 0] = 114;
v_equipmentSlots[e_equipmentSlots.valHands, 1] = 122;

v_equipmentSlots[e_equipmentSlots.valCard, 0] = 159;
v_equipmentSlots[e_equipmentSlots.valCard, 1] = 15;

v_equipmentSlots[e_equipmentSlots.valMedail, 0] = 159;
v_equipmentSlots[e_equipmentSlots.valMedail, 1] = 51;

v_equipmentSlots[e_equipmentSlots.valTrophy, 0] = 159;
v_equipmentSlots[e_equipmentSlots.valTrophy, 1] = 87;

v_equipmentSlots[e_equipmentSlots.valSoul, 0] = 159;
v_equipmentSlots[e_equipmentSlots.valSoul, 1] = 122;

v_equipmentSlots[e_equipmentSlots.valBooster, 0] = 159;
v_equipmentSlots[e_equipmentSlots.valBooster, 1] = 159;
