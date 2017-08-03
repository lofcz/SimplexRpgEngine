/// @desc [Simplex description line]

image_speed = 0;
v_areaX1 = x;
v_areaY1 = y + 32;
v_areaX2 = x + 32;
v_areaY2 = y + 64;

v_slots = 9;
v_slotsPerRow = 3;

v_openMode = 0;
v_playAnimation = 1;

v_dir = e_dirs.valS;
v_actionAlpha = 0;

v_lastString = "";

v_slotRows = ceil(v_slots / v_slotsPerRow);
v_fadeAlpha = 0;

v_slotBeingDragged = -1;
v_itemMouse = -1;
v_splitNumber = 0;
v_splitRemainning = 0;
v_lastHover = -1;
v_hoverAlpha = 0;
v_hoverAlphaFF = 0;
tmp_lastHover = -1;

for (var i = 0; i <= v_slots; i++)
{
	for (var j = 0; j <= mcInvenotryAtributes; j++)
	{
		if (!cpInventoryHelpIsStringAtr(j))
		{
			v_slot[i, j] = 0;
		}
		else
		{
			v_slot[i, j] = "";
		}
	}
	
	for (var j = 0; j <= mcInventoryProperties; j++)
	{
		v_slotProperty[i, j] = 0;
		v_slotReq[i, j] = 0;
	}
}

cpContainerAdd(oItem1, 5, id);

v_collisionMain = [x, y + 32, x + 32, y + 48];