/// @function _si(text)
/// @desc Inserts bold text into string. Use with draw_text_color only
/// @arg {string} text Text to draw

var tmp_text;
tmp_text = "";

if (argument_count > 0) {tmp_text = argument[0];}

return "[italic] " + tmp_text + "[/italic]";