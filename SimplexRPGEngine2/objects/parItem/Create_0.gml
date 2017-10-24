/// @desc [Simplex description line]

event_inherited();
v_canCollide = false;
v_canBeDamaged = false;
v_staticDepth = true;
image_speed = 0;

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

// <gemID, [string] gemStatistics, gemIcon, gemName>
for (var i = 0; i < 6; i++)
{
	for (var j = 0; j < 10; j++)
	{
		v_itemPearls[i, j] = 0
	}
}

v_itemAtributes[e_inventoryAtributes.valIdentified] = true;
v_lerpMode = 0;
v_actualLerp = 0;