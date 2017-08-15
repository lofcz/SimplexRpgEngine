/// @function _sc(text, color)
/// @desc Inserts color text into string. Use with draw_text_color only
/// @arg {string} text Text to draw
/// @arg {color} color String color

var tmp_color, tmp_text;
tmp_color = c_yellow;
tmp_text = "";

if (argument_count > 0) {tmp_text = argument[0];}
if (argument_count > 1) {tmp_color = argument[1];}

return "[color=" + string(tmp_color) + "] " + tmp_text + "[/color]";