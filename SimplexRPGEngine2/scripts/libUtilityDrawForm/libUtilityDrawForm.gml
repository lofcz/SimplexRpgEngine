/// @function libUtilityDrawForm(x, y, width, height, alpha)
/// @desc Renders basic form on screen
/// @arg {int} x Draw x
/// @arg {int} y Draw a
/// @arg {int} width Draw width
/// @arg {int} height Draw height
/// @arg {int} alpha Draw alpha

var tmp_x, tmp_y, tmp_w, tmp_h, tmp_a, tmp_array;
tmp_x = x;
tmp_y = y;
tmp_w = 200;
tmp_h = 100;
tmp_a = 1;

if (argument_count > 0) {tmp_x = argument[0];}
if (argument_count > 1) {tmp_y = argument[1];}
if (argument_count > 2) {tmp_w = argument[2];}
if (argument_count > 3) {tmp_h = argument[3];}
if (argument_count > 4) {tmp_a = argument[4];}

var tmp_sy, tmp_sx;
tmp_sx = tmp_w div 32 + 1;
tmp_sy = tmp_h div 32 + 1;

var tmp_xs, tmp_ys;
tmp_xs = tmp_x;
tmp_ys = tmp_y;

var tmp_layoutRestX, tmp_layoutRestY;
tmp_layoutRestX = tmp_w - (tmp_sx - 1) * 32;
tmp_layoutRestY = tmp_h - (tmp_sy - 1) * 32;

clr(-1, tmp_a);
draw_sprite_tiled_area(oInventory.v_inventoryTexSprite, 0, 0, 0, tmp_x + 3, tmp_y + 3, tmp_x + tmp_w + 32 - 3 + 1, tmp_y + tmp_h + 32 + 1 - 18);

for (var i = 0; i <= tmp_sy; i++)
{
	var tmp_top;
	tmp_top = 40;
		
	if (i == 0) {tmp_top = 40;}
	else if (i == tmp_sy) {tmp_top = 84;}
	else {tmp_top = 50;}	
				
	for (var j = 0; j <= tmp_sx; j++)
	{
		var tmp_left;
		tmp_left = 16;
				
		if (j == 0) {tmp_left = 16;}
		else if (j == tmp_sx) {tmp_left = 94;}
		else {tmp_left = 57;}	
					
		var tmp_dw, tmp_dh;
		tmp_dw = 32;
		tmp_dh = 32;
			
		var tmp_color;
		tmp_color = c_white;
		if (j == tmp_sx - 1) {tmp_dw = tmp_layoutRestX + 11;}
		if (i == tmp_sy - 1) {tmp_dh = tmp_layoutRestY;}
			
		draw_sprite_part_ext(oInventory.v_inventorySprite, 0, tmp_left, tmp_top, tmp_dw, tmp_dh, tmp_x, tmp_y, 1, 1, tmp_color, tmp_a);
								
		if (j != tmp_sx - 1) {tmp_x += 32;} else {tmp_x += tmp_w - (tmp_sx - 1) * 32 + 11;}
	}	
	
	if (i != tmp_sy - 1) {tmp_y += 32;} else {tmp_y += tmp_h - (tmp_sy - 1) * 32;}
	tmp_x = tmp_xs;
}

tmp_array[0] = tmp_xs;
tmp_array[1] = tmp_ys;
tmp_array[2] = tmp_x;
tmp_array[3] = tmp_y;

return tmp_array;
