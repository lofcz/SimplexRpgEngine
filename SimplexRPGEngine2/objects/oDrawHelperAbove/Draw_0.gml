/// @desc [Simplex description line]

if (v_id != -1)
{
if (v_mode == 0)
{
	cpInventoryHelperDrawItem(v_id.id, v_id.v_slotBeingDragged, mouse_x - 16, mouse_y - 16);
}
if (v_mode == 1)
{
	cpInventoryHelperDrawItem(v_id.id, v_id.v_slotBeingDragged, mouse_x - 16, mouse_y - 16);
	
	if (v_id.v_splitRemainning > 1)
	{
		clr(c_white);
		draw_text(mouse_x, mouse_y + 8, string(v_id.v_splitRemainning));
	}
}
if (v_mode == 2)
{		
	cpInventoryHelperDrawItem(oInventory.id, oInventory.v_slotBeingDragged, mouse_x - 16, mouse_y - 16);
}
v_id = -1;
clr();
}