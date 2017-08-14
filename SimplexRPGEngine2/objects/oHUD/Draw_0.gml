/// @desc Draw HUD

if (keyboard_check_pressed(ord("K"))) {v_playerProperty[e_inventoryProperties.valXp] += 10;}

draw_sprite_part(v_hudSprite, 0, v_hudPortraitX, v_hudPortraitY, 85, 64, oCamera.v_nullPosX, oCamera.v_nullPosY);

var tmp_x, tmp_y;
tmp_x = oCamera.v_nullPosX + 84;
tmp_y = oCamera.v_nullPosY;


v_realXP = lerp(v_realXP, v_playerProperty[e_inventoryProperties.valXp], 0.1);
v_realHP = lerp(v_realHP, v_playerProperty[e_inventoryProperties.valHp], 0.1);

// Draw bars
for (var j = 0; j < 3; j++)
{
	for (var i = 0; i < v_baseBarSlots; i++)
	{	
		draw_sprite_part(v_hudSprite, 0, v_hudBarBaseX, v_hudBarBaseY, 8, 16, tmp_x, tmp_y + 4);
		
		if (v_realHP / v_playerProperty[e_inventoryProperties.valMaxXp] > (i + 1) / v_baseBarSlots)
		{
			draw_sprite_part(v_hudSprite, 0, v_hudBaseBarFillX, v_hudBaseBarFillY + 20 * j, 8, 16, tmp_x, tmp_y + 6);		
		}
		else if (v_realHP / v_playerProperty[e_inventoryProperties.valMaxXp] > ((i) / v_baseBarSlots))
		{
			tmp_xpForOneSlot = (v_playerProperty[e_inventoryProperties.valMaxXp] / v_baseBarSlots);
			tmp_ratio = clamp((v_realHP - (tmp_xpForOneSlot * (i))) / tmp_xpForOneSlot, 0, 1);		
		draw_sprite_part(v_hudSprite, 0, v_hudBaseBarFillX, v_hudBaseBarFillY + 20 * j, (8 * tmp_ratio), 16, tmp_x, tmp_y + 6);		
	
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
	
	if (i != 0 && i != v_xpbarSlots - 1)
	{
		if (v_realXP / v_playerProperty[e_inventoryProperties.valMaxXp] > i + 1 / v_xpbarSlots)
		{
			draw_sprite_part(v_hudSprite, 0, 371, 40, 24, 16, tmp_x, tmp_y + 3);
		}
		else if (v_realXP / v_playerProperty[e_inventoryProperties.valMaxXp] > ((i) / v_xpbarSlots))
		{
			tmp_xpForOneSlot = (v_playerProperty[e_inventoryProperties.valMaxXp] / v_xpbarSlots);
			tmp_ratio = clamp((v_realXP - (tmp_xpForOneSlot * (i))) / tmp_xpForOneSlot, 0, 1);		
			draw_sprite_part(v_hudSprite, 0, 371, 40, (24 * tmp_ratio), 16, tmp_x, tmp_y + 3);
		}
	}
	else if (i == 0)
	{
		tmp_xpForOneSlot = (v_playerProperty[e_inventoryProperties.valMaxXp] / v_xpbarSlots);
		tmp_ratio = clamp(v_realXP / tmp_xpForOneSlot, 0, 1);		
		draw_sprite_part(v_hudSprite, 0, 371, 40, (24 * tmp_ratio), 16, tmp_x + 9, tmp_y + 3);
	}
	else
	{
		tmp_xpForOneSlot = (v_playerProperty[e_inventoryProperties.valMaxXp] / v_xpbarSlots);
		tmp_ratio = clamp((v_realXP - (tmp_xpForOneSlot * (i))) / tmp_xpForOneSlot, 0, 0.7);		
		draw_sprite_part(v_hudSprite, 0, 371, 40, (24 * tmp_ratio), 16, tmp_x, tmp_y + 3);	
	}
	
	if (i == round(v_xpbarSlots / 2)) {v_midX = tmp_x;}

	tmp_x += 23;
}

var tmp_string;
tmp_string = string(round(v_realXP)) + " / " + string(round(v_playerProperty[e_inventoryProperties.valMaxXp]));

fnt(fntPixelSmall);
alg("center");
clr(c_dkgray);
draw_text(v_midX - 10, tmp_y + 9, tmp_string);
clr(c_black);
draw_text(v_midX - 11, tmp_y + 9, tmp_string);
alg();

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