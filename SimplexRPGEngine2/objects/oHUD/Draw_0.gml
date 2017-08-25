/// @desc Draw HUD

if (keyboard_check_pressed(ord("K"))) {v_playerProperty[e_inventoryProperties.valXp] += 10;}

draw_sprite_part(v_hudSprite, 0, v_hudPortraitX, v_hudPortraitY, 85, 64, oCamera.v_nullPosX, oCamera.v_nullPosY);

var tmp_x, tmp_y;
tmp_x = oCamera.v_nullPosX + 84;
tmp_y = oCamera.v_nullPosY;

draw_text(mouse_x, mouse_y + 32, v_playerProperty[e_inventoryProperties.valHp]);

v_goldD = lin(v_goldD, v_gold, 1);

if (abs(v_realXP - v_playerProperty[e_inventoryProperties.valXp]) <= 1) {v_realXP = v_playerProperty[e_inventoryProperties.valXp];}
if (abs(v_realHP - v_playerProperty[e_inventoryProperties.valHp]) <= 1) {v_realHP = v_playerProperty[e_inventoryProperties.valHp];}
if (abs(v_realMP - v_playerProperty[e_inventoryProperties.valMp]) <= 1) {v_realMP = v_playerProperty[e_inventoryProperties.valMp];}
if (abs(v_realSP - v_playerProperty[e_inventoryProperties.valSp]) <= 1) {v_realSP = v_playerProperty[e_inventoryProperties.valSp];}

v_realXP = clamp(lerp(v_realXP, v_playerProperty[e_inventoryProperties.valXp], 0.1), 0, v_playerProperty[e_inventoryProperties.valMaxXp]);
v_realHP = clamp(lerp(v_realHP, v_playerProperty[e_inventoryProperties.valHp], 0.1), 0, v_playerProperty[e_inventoryProperties.valMaxHp]);
v_realMP = clamp(lerp(v_realMP, v_playerProperty[e_inventoryProperties.valMp], 0.1), 0, v_playerProperty[e_inventoryProperties.valMaxMp]);
v_realSP = clamp(lerp(v_realSP, v_playerProperty[e_inventoryProperties.valSp], 0.1), 0, v_playerProperty[e_inventoryProperties.valMaxSp]);

if (v_delayHP > 0) {v_delayHP--;}
if (v_delayMP > 0) {v_delayMP--;}
if (v_delaySP > 0) {v_delaySP--;}

if (v_delayHP == 0)
{
	if (v_tickHP == -1) {v_playerProperty[e_inventoryProperties.valHp] += v_playerProperty[e_inventoryProperties.valHpRegenValue];  if (v_playerProperty[e_inventoryProperties.valHp] < v_playerProperty[e_inventoryProperties.valMaxHp]) {v_tickHP = v_playerProperty[e_inventoryProperties.valHpRegenTick];} else {v_tickHP = -1; v_delayHP = -1;}}
	else {v_tickHP--;}	
}

if (v_delayMP == 0)
{
	if (v_tickMP == -1) {v_playerProperty[e_inventoryProperties.valMp] += v_playerProperty[e_inventoryProperties.valHpRegenValue];  if (v_playerProperty[e_inventoryProperties.valMp] < v_playerProperty[e_inventoryProperties.valMaxMp]) {v_tickMP = v_playerProperty[e_inventoryProperties.valMpRegenTick];} else {v_tickMP = -1; v_delayMP = -1;}}
	else {v_tickMP--;}	
}

if (v_delaySP == 0)
{
	if (v_tickSP == -1) {v_playerProperty[e_inventoryProperties.valSp] += v_playerProperty[e_inventoryProperties.valSpRegenValue];  if (v_playerProperty[e_inventoryProperties.valSp] < v_playerProperty[e_inventoryProperties.valMaxSp]) {v_tickSP = v_playerProperty[e_inventoryProperties.valSpRegenTick];} else {v_tickSP = -1; v_delaySP = -1;}}
	else {v_tickSP--;}	
}



// Draw bars
for (var j = 0; j < 3; j++)
{
	for (var i = 0; i < v_baseBarSlots; i++)
	{	
		draw_sprite_part(v_hudSprite, 0, v_hudBarBaseX, v_hudBarBaseY, 8, 16, tmp_x, tmp_y + 4);
		var tmp_val1, tmp_val2;
		if (j == 0) {tmp_val1 = v_realHP; tmp_val2 = v_playerProperty[e_inventoryProperties.valMaxHp];}
		if (j == 1) {tmp_val1 = v_realMP; tmp_val2 = v_playerProperty[e_inventoryProperties.valMaxMp];}
		if (j == 2) {tmp_val1 = v_realSP; tmp_val2 = v_playerProperty[e_inventoryProperties.valMaxSp];}
		
		if (tmp_val1 / tmp_val2 > (i + 1) / v_baseBarSlots)
		{
			if (j == 2)
			{
				shader_set(shdColor);		
				shader_set_uniform_f(shader_get_uniform(shdColor, "f_ChannelMask"), 1, v_l, v_l, 1);
				draw_sprite_part(v_hudSprite, 0, v_hudBaseBarFillX, v_hudBaseBarFillY + 20 * j, 8, 16, tmp_x, tmp_y + 6);		
				shader_reset();
			}
			else
			{
				draw_sprite_part(v_hudSprite, 0, v_hudBaseBarFillX, v_hudBaseBarFillY + 20 * j, 8, 16, tmp_x, tmp_y + 6);					
			}
		}
		else if (tmp_val1 / tmp_val2 > ((i) / v_baseBarSlots))
		{
			tmp_xpForOneSlot = (tmp_val2 / v_baseBarSlots);
			tmp_ratio = clamp((tmp_val1 - (tmp_xpForOneSlot * (i))) / tmp_xpForOneSlot, 0, 1);
			
			if (j == 2)
			{
				if (oHUD.v_playerProperty[e_inventoryProperties.valSp] / oHUD.v_playerProperty[e_inventoryProperties.valMaxSp] < 0.3)
				{
					v_l = lerp(v_l, 0.5, 0.1);
				}
				else {v_l = lerp(v_l, 1, 0.1);}
				
				shader_set(shdColor);		
				shader_set_uniform_f(shader_get_uniform(shdColor, "f_ChannelMask"), 1, v_l, v_l, 1);
				draw_sprite_part(v_hudSprite, 0, v_hudBaseBarFillX, v_hudBaseBarFillY + 20 * j, (8 * tmp_ratio), 16, tmp_x, tmp_y + 6);		
				shader_reset();
			}
			else
			{
				draw_sprite_part(v_hudSprite, 0, v_hudBaseBarFillX, v_hudBaseBarFillY + 20 * j, (8 * tmp_ratio), 16, tmp_x, tmp_y + 6);					
			}
		}
		tmp_x += 7;
	}

	draw_sprite_part(v_hudSprite, 0, v_hudBaseBarEndX, v_hudBaseBarEndY + 20 * j, 8, 18, tmp_x, tmp_y + 2);
	
	var tmp_drawHT, tmp_drawMT, tmp_drawST;
	tmp_drawHT = false;
	tmp_drawMT = false;
	tmp_drawST = false;
	
	if (v_realHP < v_playerProperty[e_inventoryProperties.valMaxHp]) {tmp_drawHT = true;}
	if (v_realMP < v_playerProperty[e_inventoryProperties.valMaxMp]) {tmp_drawMT = true;}
	if (v_realSP < v_playerProperty[e_inventoryProperties.valMaxSp]) {tmp_drawST = true;}
	
	if (tmp_drawHT)
	{
		v_alphaH = min(lerp(v_alphaH, 1.1, 0.05), 1);
		if (v_alphaH >= 1) {v_alphaH2 = lerp(v_alphaH2, 1, 0.05);}
	}
	else {if (v_alphaH2 > 0.02) {v_alphaH2 = lerp(v_alphaH2, 0, 0.05);} else {v_alphaH = max(lerp(v_alphaH, -0.1, 0.05), 0);}}

	if (tmp_drawMT)
	{
		v_alphaM = min(lerp(v_alphaM, 1.1, 0.05), 1);
		if (v_alphaM >= 1) {v_alphaM2 = lerp(v_alphaM2, 1, 0.05);}
	}
	else {if (v_alphaM2 > 0.02) {v_alphaM2 = lerp(v_alphaM2, 0, 0.05);} else {v_alphaM = max(lerp(v_alphaM, -0.1, 0.05), 0);}}	

	if (tmp_drawST)
	{
		v_alphaS = min(lerp(v_alphaS, 1.1, 0.05), 1);
		if (v_alphaS >= 1) {v_alphaS2 = lerp(v_alphaS2, 1, 0.05);}
	}
	else {if (v_alphaS2 > 0.02) {v_alphaS2 = lerp(v_alphaS2, 0, 0.05);} else {v_alphaS = max(lerp(v_alphaS, -0.1, 0.05), 0);}}
	
	var tmp_localMaxX;
	tmp_localMaxX = tmp_x + 8;
	
	if (j == 0) {tmp_aAlpha = v_alphaH; tmp_aAlpha2 = v_alphaH2; tmp_aVal = string(round(v_realHP)); tmp_aVal2 = string(v_playerProperty[e_inventoryProperties.valMaxHp]);}
	if (j == 1) {tmp_aAlpha = v_alphaM; tmp_aAlpha2 = v_alphaM2; tmp_aVal = string(round(v_realMP)); tmp_aVal2 = string(v_playerProperty[e_inventoryProperties.valMaxMp]);}
	if (j == 2) {tmp_aAlpha = v_alphaS; tmp_aAlpha2 = v_alphaS2; tmp_aVal = string(round(v_realSP)); tmp_aVal2 = string(v_playerProperty[e_inventoryProperties.valMaxSp]);}
	
		for (var i = 0; i < 20; i++)
		{
			if (tmp_aAlpha / 1 > (i + 1) / 20)
			{
				draw_sprite_part(v_hudSprite, 0, v_hudBaseBarEndX + 10, v_hudBaseBarEndY + (20 * j), 4, 16, tmp_x + i * 4 + 8, tmp_y + 2);
				
				if (j == 0) {if (v_delayHP > 0) {if (v_delayHP / v_playerProperty[e_inventoryProperties.valHpRegenDelay] > (i + 1) / 20) {clr(-1, min(draw_get_alpha(), 0.6)); draw_sprite_part(v_hudSprite, 0, 594, 186, 4, 16, tmp_x + i * 4 + 8, tmp_y + 5); clr();}} if (v_tickHP > 0) {if ((v_playerProperty[e_inventoryProperties.valHpRegenTick] - v_tickHP) > (v_playerProperty[e_inventoryProperties.valHpRegenTick] / 20) * i) {clr(-1, min(draw_get_alpha(), 0.3)); draw_sprite_part(v_hudSprite, 0, 594, 226, 4, 16, tmp_x + i * 4 + 8, tmp_y + 5); clr();}}}
				if (j == 1) {if (v_delayMP > 0) {if (v_delayMP / v_playerProperty[e_inventoryProperties.valMpRegenDelay] > (i + 1) / 20) {clr(-1, min(draw_get_alpha(), 0.6)); draw_sprite_part(v_hudSprite, 0, 594, 186, 4, 16, tmp_x + i * 4 + 8, tmp_y + 5); clr();}} if (v_tickMP > 0) {if ((v_playerProperty[e_inventoryProperties.valHpRegenTick] - v_tickMP) > (v_playerProperty[e_inventoryProperties.valHpRegenTick] / 20) * i) {clr(-1, min(draw_get_alpha(), 0.3)); draw_sprite_part(v_hudSprite, 0, 594, 226, 4, 16, tmp_x + i * 4 + 8, tmp_y + 5); clr();}}}
				if (j == 2) {if (v_delaySP > 0) {if (v_delaySP / v_playerProperty[e_inventoryProperties.valSpRegenDelay] > (i + 1) / 20) {clr(-1, min(draw_get_alpha(), 0.6)); draw_sprite_part(v_hudSprite, 0, 594, 186, 4, 16, tmp_x + i * 4 + 8, tmp_y + 5); clr();}} if (v_tickSP > 0) {if ((v_playerProperty[e_inventoryProperties.valHpRegenTick] - v_tickSP) > (v_playerProperty[e_inventoryProperties.valHpRegenTick] / 20) * i) {clr(-1, min(draw_get_alpha(), 0.3)); draw_sprite_part(v_hudSprite, 0, 594, 226, 4, 16, tmp_x + i * 4 + 8, tmp_y + 5); clr();}}}
				
				tmp_localMaxX = tmp_x + i * 4 + 8;
			}
		} 
	
		if (tmp_aAlpha >= 1)
		{
			clr(c_white, tmp_aAlpha2);
			fnt(fntPixelTiny);
			alg("center");
			draw_text(tmp_localMaxX - 10 * 4 + 4, tmp_y + 12, tmp_aVal + " / " + tmp_aVal2);
			alg();
			fnt();
			clr();
		}
	
	draw_sprite_part(v_hudSprite, 0, v_hudBaseBarEndX + 18, v_hudBaseBarEndY + (20 * j), 17, 19, tmp_localMaxX, tmp_y + 2);
	

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