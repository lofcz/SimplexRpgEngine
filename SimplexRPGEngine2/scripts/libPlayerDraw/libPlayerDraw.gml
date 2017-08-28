/// @function libPlayerDraw()
/// @desc Renders player to the canvas

sprite_index = v_bci[v_currentAnimation, 0];

var tmp_bci, tmp_i;
tmp_i = 0;


for (var i = 0; i < 14; i++)
{
	tmp_bci[i] = v_bci[v_currentAnimation, i];
}

for (var i = 0; i < 14; i++)
{
	if (tmp_bci[i] != sCatchError && tmp_bci[i] != 0) 
	{
		if (oInventory.v_equipmentSlot[i, e_inventoryAtributes.valLerpColor] != 0)
		{
			shader_set(shdLerp);
			var tmp_uID = shader_get_uniform(shdLerp, "f_Colour1");
			shader_set_uniform_f(tmp_uID, color_get_red(oInventory.v_equipmentSlot[i, e_inventoryAtributes.valLerpColor]) / 255, color_get_green(oInventory.v_equipmentSlot[i, e_inventoryAtributes.valLerpColor]) / 255, color_get_blue(oInventory.v_equipmentSlot[i, e_inventoryAtributes.valLerpColor]) / 255, v_actualLerp);
		}		
		draw_sprite(tmp_bci[i], image_index, x, y);
		shader_reset();
	}
}

if (v_lerpMode == 0) {v_actualLerp = lin(v_actualLerp, 0.5, 0.005); if (v_actualLerp >= 0.5) {v_lerpMode = 1;}}
if (v_lerpMode == 1) {v_actualLerp = lin(v_actualLerp, 0, 0.005); if (v_actualLerp <= 0) {v_lerpMode = 0;}}
