/// @fucntion libUtilityDrawRect(rectangle, outline, color)
/// @desc Draws target rectangle
/// @arg {rectangleArray} rectangle Rectangle to draw
/// @arg {bool} outline Wheather to outline or fill rectangle
/// @arg {color} color Rectangle color

var tmp_rect, tmp_fill, tmp_color;
tmp_rect = [x, y, x, y];
tmp_fill = false;
tmp_color = c_fuchsia;

if (argument_count > 0) {tmp_rect = argument[0];}
if (argument_count > 1) {tmp_fill = argument[1];}
if (argument_count > 2) {tmp_color = argument[2];}

clr(tmp_color, 0.5);
draw_rectangle(tmp_rect[0], tmp_rect[1], tmp_rect[2], tmp_rect[3], tmp_fill);
clr();
draw_rectangle(tmp_rect[0], tmp_rect[1], tmp_rect[2], tmp_rect[3], true);

