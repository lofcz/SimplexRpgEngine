/// @fucntion libUtilityDrawRect(rectangle, outline)
/// @desc Draws target rectangle
/// @arg {rectangleArray} rectangle Rectangle to draw
/// @arg {bool} outline Wheather to outline or fill rectangle

var tmp_rect, tmp_fill;
tmp_rect = [x, y, x, y];
tmp_fill = true;

if (argument_count > 0) {tmp_rect = argument[0];}
if (argument_count > 1) {tmp_fill = argument[1];}

draw_rectangle(tmp_rect[0], tmp_rect[1], tmp_rect[2], tmp_rect[3], tmp_fill);

