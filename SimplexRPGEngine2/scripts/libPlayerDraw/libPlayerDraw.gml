/// @function libPlayerDraw()
/// @desc Renders player to the canvas

sprite_index = v_bci[v_currentAnimation, 0];

for (var i = 0; i < 14; i++)
{
	if (v_bci[v_currentAnimation, i] != sCatchError && v_bci[v_currentAnimation, i] != 0) 
	{
		if (oInventory.v_equipmentSlot[i, e_inventoryAtributes.valLerpColor] != 0)
		{
			shader_set(shdLerp);
			var tmp_uID = shader_get_uniform(shdLerp, "f_Colour1");
			shader_set_uniform_f(tmp_uID, color_get_red(oInventory.v_equipmentSlot[i, e_inventoryAtributes.valLerpColor]), color_get_green(oInventory.v_equipmentSlot[i, e_inventoryAtributes.valLerpColor]), color_get_blue(oInventory.v_equipmentSlot[i, e_inventoryAtributes.valLerpColor]), v_actualLerp);
		}		
		draw_sprite(v_bci[v_currentAnimation, i], image_index, x, y);
		shader_reset();
	}
}

if (v_lerpMode == 0) {v_actualLerp = lin(v_actualLerp, 0.01, 0.00005); if (v_actualLerp >= 0.003) {v_lerpMode = 1;}}
if (v_lerpMode == 1) {v_actualLerp = lin(v_actualLerp, 0, 0.00005); if (v_actualLerp <= 0.0003) {v_lerpMode = 0;}}
