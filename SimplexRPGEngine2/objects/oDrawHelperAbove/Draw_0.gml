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
if (v_mode == 2)
{
		if (v_id.v_slot[v_id.v_slotBeingDragged, e_inventoryAtributes.valLerpColor] != 0)
		{
			shader_set(shdLerp);
			var tmp_uID = shader_get_uniform(shdLerp, "f_Colour1");
			shader_set_uniform_f(tmp_uID, color_get_red(v_id.v_slot[v_id.v_slotBeingDragged, e_inventoryAtributes.valLerpColor]), color_get_green(v_id.v_slot[v_id.v_slotBeingDragged, e_inventoryAtributes.valLerpColor]), color_get_blue(v_id.v_slot[v_id.v_slotBeingDragged, e_inventoryAtributes.valLerpColor]), v_id.v_actualLerp);
		}
		draw_sprite_ext(v_id.v_slot[v_id.v_slotBeingDragged, e_inventoryAtributes.valSprite], v_id.v_slot[v_id.v_slotBeingDragged, e_inventoryAtributes.valImageIndex] + 2, mouse_x, mouse_y, 1, 1, 0, c_white, v_id.v_formAlpha);
		shader_reset();
		
		if (v_id.v_slot[v_id.v_slotBeingDragged, e_inventoryAtributes.valCurrentStackSize] > 1)
		{
			clr(c_white);
			fnt(fntPixelSmall);
			draw_text(mouse_x, mouse_y + 8, string(v_id.v_slot[v_id.v_slotBeingDragged, e_inventoryAtributes.valCurrentStackSize]));
		}
}
v_id = -1;
clr();
}