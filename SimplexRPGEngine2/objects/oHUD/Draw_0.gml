/// @desc Draw HUD

if (keyboard_check_pressed(ord("K"))) {v_playerProperty[e_inventoryProperties.valLevel]++;}

draw_sprite_part(v_hudSprite, 0, v_hudPortraitX, v_hudPortraitY, 85, 64, oCamera.v_nullPosX, oCamera.v_nullPosY);

var tmp_x, tmp_y;
tmp_x = oCamera.v_nullPosX + 84;
tmp_y = oCamera.v_nullPosY;

// Draw bars
for (var j = 0; j < 3; j++)
{
	for (var i = 0; i < v_baseBarSlots; i++)
	{	
		draw_sprite_part(v_hudSprite, 0, v_hudBarBaseX, v_hudBarBaseY, 8, 16, tmp_x, tmp_y + 4);
		
		if (hp / max_hp > i / v_baseBarSlots)
		{
			draw_sprite_part(v_hudSprite, 0, v_hudBaseBarFillX, v_hudBaseBarFillY + 20 * j, 8, 16, tmp_x, tmp_y + 6);		
		}
		tmp_x += 7;
	}

	draw_sprite_part(v_hudSprite, 0, v_hudBaseBarEndX, v_hudBaseBarEndY + 20 * j, 32, 20, tmp_x, tmp_y + 2);

	tmp_x = oCamera.v_nullPosX + 84;
	tmp_y += 20;
}

// Draw xp-bar
v_xpbarSlots = 33;

var tmp_totalW;
tmp_totalW = (oCamera.v_viewSizeX - v_xpbarSlots * 23) / 2;
tmp_x = oCamera.v_nullPosX + tmp_totalW;
tmp_y = oCamera.v_nullPosY + oCamera.v_viewSizeY - 22;

for (var i = 0; i < v_xpbarSlots; i++)
{
	var tmp_offset;
	tmp_offset = 0;
	if (i == v_xpbarSlots - 1) {tmp_offset = 48;}
	else if (i != 0) {tmp_offset = 24;}
	
	draw_sprite_part(v_hudSprite, 0, v_hudBarXpX + tmp_offset, v_hudBarXpY, 24, 20, tmp_x, tmp_y);
	tmp_x += 23;
}

// Draw hotbar
v_hotbarSlots = 9;

tmp_totalW = (oCamera.v_viewSizeX - (v_hotbarSlots * 40 + 2 * 14 + v_hotbarSlots * 5)) / 2;
tmp_x = oCamera.v_nullPosX + tmp_totalW;
tmp_y = oCamera.v_nullPosY + oCamera.v_viewSizeY - 64;

draw_sprite_part(v_hudSprite, 0, v_hudBarStartX, v_hudBarSlotY, 14, 40, tmp_x - 14, tmp_y);

for (var i = 0; i < v_hotbarSlots; i++)
{	
	draw_sprite_part(v_hudSprite, 0, v_hudBarSlotX, v_hudBarSlotY, 40, 40, tmp_x, tmp_y);
	if (i != v_hotbarSlots - 1) {draw_sprite_part(v_hudSprite, 0, v_hudBarConnectX, v_hudBarConnectY, 5, 40, tmp_x + 40, tmp_y);}
	
	tmp_x += 45;
}

draw_sprite_part(v_hudSprite, 0, v_hudBarEndX, v_hudBarSlotY, 14, 40, tmp_x - 6, tmp_y);

// Draw minimap
tmp_x = oCamera.v_nullPosX + oCamera.v_viewSizeX - 136;
tmp_y = oCamera.v_nullPosY + 4;

draw_sprite_part(v_hudSprite, 0, v_hudMapX, v_hudMapY, 136, 129, tmp_x, tmp_y);

// Draw minimap buttons

draw_sprite_part(v_hudSprite, 0, v_hudBallX, v_hudBallY, 15, 15, tmp_x + 101, tmp_y + 19);
draw_sprite_part(v_hudSprite, 0, v_hudBallX, v_hudBallY, 15, 15, tmp_x + 15, tmp_y + 89);
draw_sprite_part(v_hudSprite, 0, v_hudBallX, v_hudBallY, 15, 15, tmp_x + 31, tmp_y + 105);