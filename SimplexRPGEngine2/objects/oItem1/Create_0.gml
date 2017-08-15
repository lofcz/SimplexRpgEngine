/// @desc [Simplex description line]

for (var i = 0; i < mcInvenotryAtributes; i++)
{
	if (!cpInventoryHelpIsStringAtr(i))
	{
		v_itemAtributes[i] = 0;
	}
	else
	{
		v_itemAtributes[i] = "";
	}
}

for (var i = 0; i < mcInventoryProperties; i++)
{
	v_itemProperty[i] = 0;
	v_itemReq[i] = 0;
}

for (var i = 0; i < mcAnimations; i++)
{
	v_itemAnimation[i] = 0;
}

v_itemAtributes[e_inventoryAtributes.valID] = e_items.valSwordWooden;
v_itemAtributes[e_inventoryAtributes.valSprite] = sItems;
v_itemAtributes[e_inventoryAtributes.valImageIndex] = e_items.valSwordWooden - 4;
v_itemAtributes[e_inventoryAtributes.valItemNumber] = 1;
v_itemAtributes[e_inventoryAtributes.valStackable] = 0;
v_itemAtributes[e_inventoryAtributes.valMaxStackSize] = 1;
v_itemAtributes[e_inventoryAtributes.valInfoTextHead] = choose("Mighty", "Sexy", "Douchebag") + " wooden sword";
v_itemAtributes[e_inventoryAtributes.valInfoTextBody] = "Simple weapon for script kiddies like" + _sc("you") + _sc("you", c_green) + _sc("you", c_red) + _sc("you", c_lime) + _sc("you") + _sc("you");
v_itemAtributes[e_inventoryAtributes.valPriceBase] = 20;
v_itemAtributes[e_inventoryAtributes.valLerpColor] = choose(c_lime, c_red, c_white, c_yellow);
v_itemAtributes[e_inventoryAtributes.valWeight] = 2;
v_itemAtributes[e_inventoryAtributes.valEquipSlot] = e_equipmentSlots.valWeaponRight;

v_itemProperty[e_inventoryProperties.valDamage] = 4;
v_itemProperty[e_inventoryProperties.valEndurance] = 2;

v_itemAnimation[e_animations.valWalk] = sBodyCanvasWeapon1;
v_itemAnimation[e_animations.valSlash] = sBodyCanvasAttackWeapon1;

v_itemReq[e_inventoryProperties.valLevel] = 2;