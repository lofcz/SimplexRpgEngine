/// @function libDrawMenu(x, y, itemsArray, alpha, returnOnly, dataEventIndex)
/// @desc Renders menu with selectible index
/// @arg {int} x Draw x
/// @arg {int} y Draw y
/// @arg {array} itemsArray [0, [name, alpha, offset]]
/// @arg {int} alpha Draw alpha
/// @arg {bool} returnOnly Dont render in this call
/// @arg {int} dataEventIndex Index of user event which will render additional data

var tmp_x, tmp_y, tmp_i, tmp_a, tmp_sx, tmp_sy, tmp_ro, tmp_e;
tmp_x = x;
tmp_y = y;
tmp_i = [];
tmp_a = draw_get_alpha();
tmp_sx = tmp_x;
tmp_sy = tmp_y;
tmp_ro = false;
tmp_e = -1;

if (argument_count > 0) {tmp_x = argument[0];}
if (argument_count > 1) {tmp_y = argument[1];}
if (argument_count > 2) {tmp_i = argument[2];}
if (argument_count > 3) {tmp_a = argument[3];}
if (argument_count > 4) {tmp_ro = argument[4];}
if (argument_count > 5) {tmp_e = argument[5];}

var tmp_done;
tmp_done = true;

for (var i = 0; i < array_height_2d(tmp_i); i++)
{
	if (!tmp_ro)
	{
		clr(-1, min(tmp_i[@ i, 1], tmp_a));
		for (var j = 0; j < 6; j++)
		{
			if (j == 0) {draw_sprite_part(oInventory.v_inventorySprite, 0, 633, 23, 40, 28, tmp_x + j * 40 + tmp_i[@ i, 2], tmp_y - tmp_i[@ i, 3]);}
			else if (j == 5) {draw_sprite_part(oInventory.v_inventorySprite, 0, 716, 23, 40, 28, tmp_x + j * 40 + tmp_i[@ i, 2], tmp_y - tmp_i[@ i, 3]);}
			else {draw_sprite_part(oInventory.v_inventorySprite, 0, 673, 23, 40, 28, tmp_x + j * 40 + tmp_i[@ i, 2], tmp_y - tmp_i[@ i, 3]);}		
		}
	
		fnt();
		alg("center");
		draw_text(tmp_x + (40 * 6) / 2 + tmp_i[@ i, 2], tmp_y + 12 - tmp_i[@ i, 3], tmp_i[i, 0]);
		if (point_in_rectangle(mouse_x, mouse_y, tmp_x, tmp_y - tmp_i[@ i, 3], tmp_x + 6 * 40, tmp_y + 28 - tmp_i[@ i, 3]))
		{
			if (v_selectedIndex != i && v_layoutW < 231)
			{
				tmp_i[@ i, 2] = lerp(tmp_i[@ i, 2], 8, 0.1);
			}
			
			if (mouse_check_button_pressed(mb_left) && tmp_i[@ i, 1] > 0.05)
			{
				if (v_selectedIndex == -1)
				{
					v_layoutMode = !v_layoutMode;
					v_selectedIndex = i;
				}
				else {v_selectedIndex = -1; v_selectionDone = false;}
			}
		} 
		else {if (!v_selectionDone) {tmp_i[@ i, 2] = lerp(tmp_i[@ i, 2], 0, 0.1);}}
		
		if (v_selectedIndex != -1)
		{
			if (i != v_selectedIndex) {tmp_i[@ i, 1] = lerp(tmp_i[@ i, 1], 0, 0.1); if (tmp_i[@ i, 1] > 0.05) {tmp_done = false;}}
		}
		else
		{
			var tmp_doneScrolling;
			tmp_doneScrolling = true;
			
			if (v_layoutW > 300) {tmp_doneScrolling = false;}
		
			tmp_i[@ i, 3] = lerp(tmp_i[@ i, 3], 0, 0.1);
			
			if (tmp_doneScrolling)
			{
				tmp_i[@ i, 1] = lerp(tmp_i[@ i, 1], 1, 0.1);
			}
		}
		alg();
	}
	tmp_y += 30;
}

if (v_selectedIndex != -1 && tmp_done)
{
	tmp_i[@ v_selectedIndex, 3] = lerp(tmp_i[@ v_selectedIndex, 3], v_selectedIndex * 30, 0.1);
	if (tmp_i[@ v_selectedIndex, 3] >= v_selectedIndex * 30 - 2) {v_selectionDone = true; if (v_layoutW > 595) {tmp_i[@ v_selectedIndex, 2] = lerp(tmp_i[@ v_selectedIndex, 2], 300 - 120, 0.1); if (tmp_i[@ v_selectedIndex, 2] > 300 - 125) {if (tmp_e != -1) {v_menuReady = true;}}}} else {v_selectionDone = false;}
}

var tmp_o;
tmp_o[0] = tmp_sx;
tmp_o[1] = tmp_sy;
tmp_o[2] = tmp_x;
tmp_o[3] = tmp_y;

clr();
return tmp_o;
