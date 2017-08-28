/// @function _ss(text)
/// @desc Inserts small text into string. Use with draw_text_color only
/// @arg {string} text Text to draw

var tmp_text;
tmp_text = "";

if (argument_count > 0) {tmp_text = argument[0];}

return "[small] " + tmp_text + "[/small]";