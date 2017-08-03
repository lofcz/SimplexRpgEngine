/// @desc [Simplex description line]

if (v_id != -1)
{
if (v_mode == 0)
{
draw_sprite_ext(v_id.v_slot[v_id.v_slotBeingDragged, e_inventoryAtributes.valSprite], v_id.v_slot[v_id.v_slotBeingDragged, e_inventoryAtributes.valImageIndex] + 2, mouse_x, mouse_y, 1, 1, 0, c_white, v_id.v_formAlpha);
}
if (v_mode == 1)
{
			draw_sprite_ext(v_id.v_slot[v_id.v_itemMouse, e_inventoryAtributes.valSprite], v_id.v_slot[v_id.v_itemMouse, e_inventoryAtributes.valImageIndex] + 2, mouse_x, mouse_y, 1, 1, 0, c_white, v_id.v_formAlpha);

			if (v_id.v_splitRemainning > 1)
			{
				clr(c_white);
				draw_text(mouse_x, mouse_y + 8, string(v_id.v_splitRemainning));
			}
}
v_id = -1;
clr();
}