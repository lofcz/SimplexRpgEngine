/// @desc [Simplex description line]

event_inherited();

if (v_itemAtributes[e_inventoryAtributes.valLerpColor])
{
	shader_set(shdLerp);
	shader_set_uniform_f(shader_get_uniform(shdLerp, "v_vColour"), color_get_red(v_itemAtributes[e_inventoryAtributes.valLerpColor]) / 255, color_get_green(v_itemAtributes[e_inventoryAtributes.valLerpColor]) / 255, color_get_blue(v_itemAtributes[e_inventoryAtributes.valLerpColor]) / 255, 1);	
}
draw_self();
shader_reset();

if (v_lerpMode == 0) {v_actualLerp = lin(v_actualLerp, 0.5, 0.005); if (v_actualLerp >= 0.5) {v_lerpMode = 1;}}
if (v_lerpMode == 1) {v_actualLerp = lin(v_actualLerp, 0, 0.005); if (v_actualLerp <= 0) {v_lerpMode = 0;}}
