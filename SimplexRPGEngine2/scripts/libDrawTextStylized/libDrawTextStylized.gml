/// @function libDrawTextStylized(x, y, text, alpha)
/// @desc Draws target text using colored formating with shadow
/// @arg {int} x X
/// @arg {int} y Y
/// @arg {string} text Text to draw
/// @arg {int} alpha Draw alpha

var tmp_text, tmp_x, tmp_y, tmp_textClean, tmp_alpha;
tmp_text = "";
tmp_x = x;
tmp_y = y;
tmp_alpha = 1;

if (argument_count > 0) {tmp_x = argument[0];}
if (argument_count > 1) {tmp_y = argument[1];}
if (argument_count > 2) {tmp_text = argument[2];}
if (argument_count > 3) {tmp_alpha = argument[3];}

clr();
fnt(fntPixel);
tmp_textClean = libUtilityParseTextColored(tmp_text, fntPixel);

clr(-1, tmp_alpha / 2);
draw_roundrect_ext(tmp_x - string_width(tmp_textClean) / 2 - 8, tmp_y - string_height(tmp_textClean) / 2, tmp_x + string_width(tmp_textClean) / 2 + 8, tmp_y + string_height(tmp_textClean) / 2 + 4, 20, 20, false);

clr(-1, tmp_alpha);
draw_text_colored(tmp_x - string_width(tmp_textClean) / 2, tmp_y - string_height(tmp_textClean) / 2 + 3, tmp_text, -1, fntPixel);
clr();