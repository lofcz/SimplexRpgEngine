/// @function libUtilityCheckCollisionRect(sourceRect, destRect)
/// @desc Checks if two rectangles overlap
/// @arg {rectangleArray} sourceRect Source rectangle
/// @arg {rectangleArray} destRext Destination rectangle

var tmp_rect1, tmp_rect2;
tmp_rect1 = [x, y, x, y];
tmp_rect2 = [x, y, x, y];

if (argument_count > 0) {tmp_rect1 = argument[0];}
if (argument_count > 1) {tmp_rect2 = argument[1];}

if (rectangle_in_rectangle(tmp_rect1[0], tmp_rect1[1], tmp_rect1[2], tmp_rect1[3], tmp_rect2[0], tmp_rect2[1], tmp_rect2[2], tmp_rect2[3]))
{
	return true;
}

return false;