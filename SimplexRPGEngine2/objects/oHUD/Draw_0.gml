/// @desc Draw HUD

if (keyboard_check_pressed(ord("K"))) {v_playerProperty[e_inventoryProperties.valLevel]++;}

draw_sprite_part(v_hudSprite, 0, v_hudPortraitX, v_hudPortraitY, 85, 64, oCamera.v_nullPosX, oCamera.v_nullPosY);

var tmp_x, tmp_y;
tmp_x = oCamera.v_nullPosX + 84;
tmp_y = oCamera.v_nullPosY;

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