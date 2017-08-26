/// @desc [Simplex description line]

event_inherited();



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
	v_itemPropertyStatic[i] = 0;
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
v_itemAtributes[e_inventoryAtributes.valInfoTextHead] = "Wooden sword";
v_itemAtributes[e_inventoryAtributes.valInfoTextBody] = "Simple weapon for script kiddies like" + _sc("you") + _sc("you", c_green) + _sc("you", c_red) + _sc("you", c_lime) + _sc("you") + _sc("you");
v_itemAtributes[e_inventoryAtributes.valPriceBase] = 20;
v_itemAtributes[e_inventoryAtributes.valWeight] = 2;
v_itemAtributes[e_inventoryAtributes.valEquipSlot] = e_equipmentSlots.valWeaponRight;

v_itemProperty[e_inventoryProperties.valDamage] = 4;
v_itemProperty[e_inventoryProperties.valEndurance] = 2;

v_itemPropertyStatic[e_inventoryProperties.valDamage] = 2;
v_itemPropertyStatic[e_inventoryProperties.valMaxHp] = 30;

v_itemAnimation[e_animations.valWalk] = sBodyCanvasWeapon5;
v_itemAnimation[e_animations.valSlash] = sBodyCanvasAttackWeapon3;

v_itemReq[e_inventoryProperties.valLevel] = 2;

if (choose(0, 1) == 0)
{
	v_itemOption[0] = "This is";
	
	if (choose(0, 1))
	{
		v_itemOption[1] = "TEST";
		
		if (choose(0, 1))
		{
			v_itemOption[2] = "Of a stupid string";
		}
	}
}
//v_itemOption[0] = "";
//v_itemOption[1] = "This is";
//v_itemOption[2] = "Test";


if (!variable_instance_exists(id, "v_staticItem"))
{
	v_itemAtributes[e_inventoryAtributes.valInfoTextHead] = choose("Mighty", "Sexy", "Douchebag") + " wooden sword";
	v_itemAtributes[e_inventoryAtributes.valLerpColor] = choose(c_lime, c_red, c_white, c_yellow);
}

sprite_index = v_itemAtributes[e_inventoryAtributes.valSprite];
image_index = v_itemAtributes[e_inventoryAtributes.valID] - 2;
image_speed = 0;
v_lerpMode = 0;
v_actualLerp = 0;