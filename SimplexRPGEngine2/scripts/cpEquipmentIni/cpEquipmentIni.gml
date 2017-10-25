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
	valBooster,
	valNONE
}

v_equipmentSlots[e_equipmentSlots.valHead, 0] = 64;
v_equipmentSlots[e_equipmentSlots.valHead, 1] = 0;
v_equipmentSlots[e_equipmentSlots.valHead, 2] = e_equipmentSlots.valHead;

v_equipmentSlots[e_equipmentSlots.valNecklace, 0] = 108;
v_equipmentSlots[e_equipmentSlots.valNecklace, 1] = 33;
v_equipmentSlots[e_equipmentSlots.valNecklace, 2] = e_equipmentSlots.valNecklace;

v_equipmentSlots[e_equipmentSlots.valShoulders, 0] = 21;
v_equipmentSlots[e_equipmentSlots.valShoulders, 1] = 33;
v_equipmentSlots[e_equipmentSlots.valShoulders, 2] = e_equipmentSlots.valShoulders;

v_equipmentSlots[e_equipmentSlots.valWeaponRight, 0] = 114;
v_equipmentSlots[e_equipmentSlots.valWeaponRight, 1] = 80;
v_equipmentSlots[e_equipmentSlots.valWeaponRight, 2] = e_equipmentSlots.valWeaponRight;

v_equipmentSlots[e_equipmentSlots.valWeaponLeft, 0] = 10;
v_equipmentSlots[e_equipmentSlots.valWeaponLeft, 1] = 80;
v_equipmentSlots[e_equipmentSlots.valWeaponLeft, 2] = e_equipmentSlots.valWeaponLeft;

v_equipmentSlots[e_equipmentSlots.valRing1, 0] = 4;
v_equipmentSlots[e_equipmentSlots.valRing1, 1] = 121;
v_equipmentSlots[e_equipmentSlots.valRing1, 2] = e_equipmentSlots.valRing1;

v_equipmentSlots[e_equipmentSlots.valRing2, 0] = 28;
v_equipmentSlots[e_equipmentSlots.valRing2, 1] = 121;
v_equipmentSlots[e_equipmentSlots.valRing2, 2] = e_equipmentSlots.valRing2;

v_equipmentSlots[e_equipmentSlots.valChest, 0] = 64;
v_equipmentSlots[e_equipmentSlots.valChest, 1] = 40;
v_equipmentSlots[e_equipmentSlots.valChest, 2] = e_equipmentSlots.valChest;

v_equipmentSlots[e_equipmentSlots.valLegs, 0] = 64;
v_equipmentSlots[e_equipmentSlots.valLegs, 1] = 119;
v_equipmentSlots[e_equipmentSlots.valLegs, 2] = e_equipmentSlots.valLegs;

v_equipmentSlots[e_equipmentSlots.valFoots, 0] = 64;
v_equipmentSlots[e_equipmentSlots.valFoots, 1] = 159;
v_equipmentSlots[e_equipmentSlots.valFoots, 2] = e_equipmentSlots.valFoots;

v_equipmentSlots[e_equipmentSlots.valBelt, 0] = 64;
v_equipmentSlots[e_equipmentSlots.valBelt, 1] = 80;
v_equipmentSlots[e_equipmentSlots.valBelt, 2] = e_equipmentSlots.valBelt;

v_equipmentSlots[e_equipmentSlots.valHands, 0] = 114;
v_equipmentSlots[e_equipmentSlots.valHands, 1] = 122;
v_equipmentSlots[e_equipmentSlots.valHands, 2] = e_equipmentSlots.valHands;

v_equipmentSlots[e_equipmentSlots.valCard, 0] = 159;
v_equipmentSlots[e_equipmentSlots.valCard, 1] = 15;
v_equipmentSlots[e_equipmentSlots.valCard, 2] = e_equipmentSlots.valCard;

v_equipmentSlots[e_equipmentSlots.valMedail, 0] = 159;
v_equipmentSlots[e_equipmentSlots.valMedail, 1] = 51;
v_equipmentSlots[e_equipmentSlots.valMedail, 2] = e_equipmentSlots.valMedail;

v_equipmentSlots[e_equipmentSlots.valTrophy, 0] = 159;
v_equipmentSlots[e_equipmentSlots.valTrophy, 1] = 87;
v_equipmentSlots[e_equipmentSlots.valTrophy, 2] = e_equipmentSlots.valTrophy;

v_equipmentSlots[e_equipmentSlots.valSoul, 0] = 159;
v_equipmentSlots[e_equipmentSlots.valSoul, 1] = 122;
v_equipmentSlots[e_equipmentSlots.valSoul, 2] = e_equipmentSlots.valSoul;

v_equipmentSlots[e_equipmentSlots.valBooster, 0] = 159;
v_equipmentSlots[e_equipmentSlots.valBooster, 1] = 159;
v_equipmentSlots[e_equipmentSlots.valBooster, 2] = e_equipmentSlots.valBooster;

v_equipmentLastHover = 0;

for (var j = 0; j <= 30; j++)
{
	for (var i = 0; i <= mcInvenotryAtributes; i++)
	{
		if (!cpInventoryHelpIsStringAtr(i))
		{
			v_equipmentSlot[j, i] = 0;
		}
		else
		{
			v_equipmentSlot[j, i] = "";
		}
	}
	
	for (var i = 0; i <= mcInventoryProperties; i++)
	{
		v_equipmentSlotProperty[j, i] = 0;
		v_equipmentSlotPropertyStatic[j, i] = 0;
		v_equipmentReq[j, i] = 0;
	}
	
	for (var i = 0; i < mcAnimations; i++)
	{
		v_equipmentSlotAnimations[j, i] = 0;
	}
	
	for (var i = 0; i < 20; i++)
	{
		v_equipmentSlotGems[j, i] = "";	
	}
}
