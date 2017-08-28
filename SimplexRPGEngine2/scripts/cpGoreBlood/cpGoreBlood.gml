/// @function cpGoreBlood(x, y, fragments, color, dirMin, dirMax)
/// @desc Spawns virtual-processed blood
/// @arg {int} x x-pos
/// @arg {int} y y-pos
/// @arg {int} fragments Number of main fragments to spawn
/// @arg {color} color Blood color
/// @arg {int} dirMin Minimal direction of blood
/// @arg {int} dirMax Maximal direction of blood

var tmp_x, tmp_y, tmp_fragments, tmp_color, tmp_dirMin, tmp_dirMax, tmp_inst;
tmp_x = x;
tmp_y = y;
tmp_fragments = 3;
tmp_color = c_red;
tmp_dirMin = 0;
tmp_dirMax = 360;

if (argument_count > 0) {tmp_x    = argument[0];}
if (argument_count > 1) {tmp_y    = argument[1];}
if (argument_count > 2) {tmp_fragments = argument[2];}
if (argument_count > 3) {tmp_color = argument[3];}
if (argument_count > 4) {tmp_dirMin = argument[4];}
if (argument_count > 5) {tmp_dirMax = argument[5];}

var tmp_red, tmp_blue, tmp_green;
tmp_red   = (color_get_red(tmp_color) / 255);
tmp_blue  = (color_get_blue(tmp_color) / 255);
tmp_green = (color_get_green(tmp_color) / 255);

with (instance_create_layer(tmp_x + random_range(-5, 5), tmp_y + random_range(-5, 5), "Effects", oTempObject))
{
	v_redChannel = tmp_red; 
	v_blueChannel = tmp_blue; 
	v_greenChannel = tmp_green;
	v_fragments = tmp_fragments;
	v_dirMin = tmp_dirMin;
	v_dirMax = tmp_dirMax;
	
	instance_change(oGore, true);
}