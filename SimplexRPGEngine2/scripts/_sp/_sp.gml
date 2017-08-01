/// @function _sp(icon, imageIndex)
/// @desc Inserts icon into string. Use with draw_text_color only
/// @arg {sprite} icon Sprite to use
/// @arg {int} inageIndex Subimage to draw


var tmp_sprite, tmp_index;
tmp_sprite = sItems;
tmp_index = 0;

if (argument_count > 0) {tmp_sprite = argument[0];}
if (argument_count > 1) {tmp_index = argument[1];}

return " [icon=" + string(tmp_sprite) + "," + string(tmp_index) +"] ";