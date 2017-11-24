/// @desc Draw HUD

var tmp_selX, tmp_selY, tmp_selW, tmp_selH, tmp_selXO, tmp_selYO;
tmp_selX = mouse_x;
tmp_selY = mouse_y;
tmp_selW = 34;
tmp_selH = 26;
tmp_selXO = 17;
tmp_selYO = 13;

if (keyboard_check_pressed(ord("K"))) {v_playerProperty[e_inventoryProperties.valXp] += 10;}
if (keyboard_check_pressed(ord("L"))) {if (oInventory.v_inventorySprite == texUI) {oInventory.v_inventorySprite = texUI2;} else {oInventory.v_inventorySprite = texUI;} v_hudSprite = oInventory.v_inventorySprite;}

draw_sprite_part(v_hudSprite, 0, v_hudPortraitX, v_hudPortraitY, 85, 64, oCamera.v_nullPosX, oCamera.v_nullPosY);

var tmp_x, tmp_y;
tmp_x = oCamera.v_nullPosX + 84;
tmp_y = oCamera.v_nullPosY;


for (var i = 0; i < mcInventoryProperties; i++)
{
	v_playerPropertyTotal[i] = v_playerProperty[i] + v_playerPropertyStatic[i];	
	
	for (var j = 0; j < mcEquipmentSlots; j++)
	{
		v_playerPropertyTotal[i] += oInventory.v_equipmentSlotProperty[j, i] + oInventory.v_equipmentSlotPropertyStatic[j, i];
	}
}

draw_text(mouse_x, mouse_y + 32, v_playerPropertyTotal[e_inventoryProperties.valHp]);

v_goldD = lin(v_goldD, v_gold, 1);

if (abs(v_realHP - v_playerPropertyTotal[e_inventoryProperties.valHp]) <= 1) {v_realHP = v_playerPropertyTotal[e_inventoryProperties.valHp];}
if (abs(v_realMP - v_playerPropertyTotal[e_inventoryProperties.valMp]) <= 1) {v_realMP = v_playerPropertyTotal[e_inventoryProperties.valMp];}
if (abs(v_realSP - v_playerPropertyTotal[e_inventoryProperties.valSp]) <= 1) {v_realSP = v_playerPropertyTotal[e_inventoryProperties.valSp];}

v_realXP = clamp(lerp(v_realXP, v_playerPropertyTotal[e_inventoryProperties.valXp], 0.1), 0, v_playerPropertyTotal[e_inventoryProperties.valMaxXp]);
v_realHP = clamp(lerp(v_realHP, v_playerPropertyTotal[e_inventoryProperties.valHp], 0.1), 0, v_playerPropertyTotal[e_inventoryProperties.valMaxHp]);
v_realMP = clamp(lerp(v_realMP, v_playerPropertyTotal[e_inventoryProperties.valMp], 0.1), 0, v_playerPropertyTotal[e_inventoryProperties.valMaxMp]);
v_realSP = clamp(lerp(v_realSP, v_playerPropertyTotal[e_inventoryProperties.valSp], 0.1), 0, v_playerPropertyTotal[e_inventoryProperties.valMaxSp]);


if (v_playerProperty[e_inventoryProperties.valHp] > v_playerPropertyTotal[e_inventoryProperties.valMaxHp]) {v_playerProperty[e_inventoryProperties.valHp] = v_playerPropertyTotal[e_inventoryProperties.valMaxHp];}
if (v_playerPropertyTotal[e_inventoryProperties.valHp] < v_playerPropertyTotal[e_inventoryProperties.valMaxHp]) {if (v_delayHP == -1) {v_delayHP = 1;}}

if (v_playerProperty[e_inventoryProperties.valMp] > v_playerPropertyTotal[e_inventoryProperties.valMaxMp]) {v_playerProperty[e_inventoryProperties.valMp] = v_playerPropertyTotal[e_inventoryProperties.valMaxMp];}
if (v_playerPropertyTotal[e_inventoryProperties.valMp] < v_playerPropertyTotal[e_inventoryProperties.valMaxMp]) {if (v_delayHP == -1) {v_delayMP = 1;}}

if (v_playerProperty[e_inventoryProperties.valSp] > v_playerPropertyTotal[e_inventoryProperties.valMaxSp]) {v_playerProperty[e_inventoryProperties.valSp] = v_playerPropertyTotal[e_inventoryProperties.valMaxSp];}
if (v_playerPropertyTotal[e_inventoryProperties.valSp] < v_playerPropertyTotal[e_inventoryProperties.valMaxSp]) {if (v_delayHP == -1) {v_delaySP = 1;}}


if (v_delayHP > 0) {v_delayHP--;}
if (v_delayMP > 0) {v_delayMP--;}
if (v_delaySP > 0) {v_delaySP--;}

if (v_delayHP == 0)
{
	if (v_tickHP == -1) {v_playerProperty[e_inventoryProperties.valHp] += v_playerPropertyTotal[e_inventoryProperties.valHpRegenValue];  if (v_playerPropertyTotal[e_inventoryProperties.valHp] < v_playerPropertyTotal[e_inventoryProperties.valMaxHp]) {v_tickHP = v_playerPropertyTotal[e_inventoryProperties.valHpRegenTick];} else {v_tickHP = -1; v_delayHP = -1;}}
	else {v_tickHP--;}	
}

if (v_delayMP == 0)
{
	if (v_tickMP == -1) {v_playerProperty[e_inventoryProperties.valMp] += v_playerPropertyTotal[e_inventoryProperties.valHpRegenValue];  if (v_playerPropertyTotal[e_inventoryProperties.valMp] < v_playerPropertyTotal[e_inventoryProperties.valMaxMp]) {v_tickMP = v_playerPropertyTotal[e_inventoryProperties.valMpRegenTick];} else {v_tickMP = -1; v_delayMP = -1;}}
	else {v_tickMP--;}	
}

if (v_delaySP == 0)
{
	if (v_tickSP == -1) {v_playerProperty[e_inventoryProperties.valSp] += v_playerPropertyTotal[e_inventoryProperties.valSpRegenValue];  if (v_playerPropertyTotal[e_inventoryProperties.valSp] < v_playerPropertyTotal[e_inventoryProperties.valMaxSp]) {v_tickSP = v_playerPropertyTotal[e_inventoryProperties.valSpRegenTick];} else {v_tickSP = -1; v_delaySP = -1;}}
	else {v_tickSP--;}	
}



// Draw bars
for (var j = 0; j < 3; j++)
{
	for (var i = 0; i < v_baseBarSlots; i++)
	{	
		draw_sprite_part(v_hudSprite, 0, v_hudBarBaseX, v_hudBarBaseY, 8, 16, tmp_x, tmp_y + 4);
		var tmp_val1, tmp_val2;
		if (j == 0) {tmp_val1 = v_realHP; tmp_val2 = v_playerPropertyTotal[e_inventoryProperties.valMaxHp];}
		if (j == 1) {tmp_val1 = v_realMP; tmp_val2 = v_playerPropertyTotal[e_inventoryProperties.valMaxMp];}
		if (j == 2) {tmp_val1 = v_realSP; tmp_val2 = v_playerPropertyTotal[e_inventoryProperties.valMaxSp];}
		
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
				if (oHUD.v_playerPropertyTotal[e_inventoryProperties.valSp] / oHUD.v_playerPropertyTotal[e_inventoryProperties.valMaxSp] < v_fatigueSpStart)
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
	
	if (v_realHP < v_playerPropertyTotal[e_inventoryProperties.valMaxHp]) {tmp_drawHT = true;}
	if (v_realMP < v_playerPropertyTotal[e_inventoryProperties.valMaxMp]) {tmp_drawMT = true;}
	if (v_realSP < v_playerPropertyTotal[e_inventoryProperties.valMaxSp]) {tmp_drawST = true;}
	
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
	
	if (j == 0) {tmp_aAlpha = v_alphaH; tmp_aAlpha2 = v_alphaH2; tmp_aVal = string(round(v_realHP)); tmp_aVal2 = string(v_playerPropertyTotal[e_inventoryProperties.valMaxHp]);}
	if (j == 1) {tmp_aAlpha = v_alphaM; tmp_aAlpha2 = v_alphaM2; tmp_aVal = string(round(v_realMP)); tmp_aVal2 = string(v_playerPropertyTotal[e_inventoryProperties.valMaxMp]);}
	if (j == 2) {tmp_aAlpha = v_alphaS; tmp_aAlpha2 = v_alphaS2; tmp_aVal = string(round(v_realSP)); tmp_aVal2 = string(v_playerPropertyTotal[e_inventoryProperties.valMaxSp]);}
	
		for (var i = 0; i < 20; i++)
		{
			if (tmp_aAlpha / 1 > (i + 1) / 20)
			{
				draw_sprite_part(v_hudSprite, 0, v_hudBaseBarEndX + 10, v_hudBaseBarEndY + (20 * j), 4, 16, tmp_x + i * 4 + 8, tmp_y + 2);
				
				if (j == 0) {if (v_delayHP > 0) {if (v_delayHP / v_playerPropertyTotal[e_inventoryProperties.valHpRegenDelay] > (i + 1) / 20) {clr(-1, min(draw_get_alpha(), 0.6)); draw_sprite_part(v_hudSprite, 0, 594, 186, 4, 16, tmp_x + i * 4 + 8, tmp_y + 5); clr();}} if (v_tickHP > 0) {if ((v_playerPropertyTotal[e_inventoryProperties.valHpRegenTick] - v_tickHP) > (v_playerPropertyTotal[e_inventoryProperties.valHpRegenTick] / 20) * i) {clr(-1, min(draw_get_alpha(), 0.3)); draw_sprite_part(v_hudSprite, 0, 594, 226, 4, 16, tmp_x + i * 4 + 8, tmp_y + 5); clr();}}}
				if (j == 1) {if (v_delayMP > 0) {if (v_delayMP / v_playerPropertyTotal[e_inventoryProperties.valMpRegenDelay] > (i + 1) / 20) {clr(-1, min(draw_get_alpha(), 0.6)); draw_sprite_part(v_hudSprite, 0, 594, 186, 4, 16, tmp_x + i * 4 + 8, tmp_y + 5); clr();}} if (v_tickMP > 0) {if ((v_playerPropertyTotal[e_inventoryProperties.valHpRegenTick] - v_tickMP) > (v_playerPropertyTotal[e_inventoryProperties.valHpRegenTick] / 20) * i) {clr(-1, min(draw_get_alpha(), 0.3)); draw_sprite_part(v_hudSprite, 0, 594, 226, 4, 16, tmp_x + i * 4 + 8, tmp_y + 5); clr();}}}
				if (j == 2) {if (v_delaySP > 0) {if (v_delaySP / v_playerPropertyTotal[e_inventoryProperties.valSpRegenDelay] > (i + 1) / 20) {clr(-1, min(draw_get_alpha(), 0.6)); draw_sprite_part(v_hudSprite, 0, 594, 186, 4, 16, tmp_x + i * 4 + 8, tmp_y + 5); clr();}} if (v_tickSP > 0) {if ((v_playerPropertyTotal[e_inventoryProperties.valHpRegenTick] - v_tickSP) > (v_playerPropertyTotal[e_inventoryProperties.valHpRegenTick] / 20) * i) {clr(-1, min(draw_get_alpha(), 0.3)); draw_sprite_part(v_hudSprite, 0, 594, 226, 4, 16, tmp_x + i * 4 + 8, tmp_y + 5); clr();}}}
				
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
v_xpbarSlots = 30;

var tmp_totalW;
tmp_totalW = (oCamera.v_viewSizeX - v_xpbarSlots * 24) / 2;
tmp_x = oCamera.v_nullPosX + tmp_totalW;
tmp_y = oCamera.v_nullPosY + oCamera.v_viewSizeY - 22;
tmp_xy = tmp_x + 10;

tmp_doDraw = true;
for (var i = 0; i < v_xpbarSlots; i++)
{
	var tmp_offset;
	tmp_offset = 0;
	if (i == v_xpbarSlots - 1) {tmp_offset = 48;}
	else if (i != 0) {tmp_offset = 24;}
	tmp_w = 24;
	if (i == v_xpbarSlots - 1) {tmp_w = 26;}
	
	draw_sprite_part(v_hudSprite, 0, v_hudBarXpX + tmp_offset, v_hudBarXpY, tmp_w, 20, tmp_x, tmp_y);
	
	tmp_xpForOneSlot = (v_playerProperty[e_inventoryProperties.valMaxXp] / v_xpbarSlots);
	
	tmp_ratio = clamp((v_realXP - (tmp_xpForOneSlot * i + 1)) / tmp_xpForOneSlot, 0, 1);
	
	tmp_xx = tmp_x;
	if (i == 0) {tmp_xx = tmp_x + 10;}	
	if (i == round(v_xpbarSlots / 2)) {v_midX = tmp_x;}

	tmp_x += 24;
	tmp_xy += 24;
}

tmp_x = oCamera.v_nullPosX + tmp_totalW + 10;
for (var i = 0; i < v_xpbarSlots; i++)
{
	tmp_xpForOneSlot = (v_playerProperty[e_inventoryProperties.valMaxXp] / v_xpbarSlots);
	tmp_ratio = clamp((v_realXP - (tmp_xpForOneSlot * i + 1)) / tmp_xpForOneSlot, 0, 1);
	
	tmp_xx = tmp_x;
	if (i == v_xpbarSlots - 1) {tmp_ratio = min(tmp_ratio, 0.3);}
	draw_sprite_part(v_hudSprite, 0, 372, 40, (24 * tmp_ratio), 16, tmp_xx, tmp_y + 3);
	
	tmp_x += 24;
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
tmp_totalW = (oCamera.v_viewSizeX - (v_hotbarSlots * 40 + 2 * 14 + v_hotbarSlots * 5)) / 2;
tmp_x = oCamera.v_nullPosX + tmp_totalW;
tmp_y = oCamera.v_nullPosY + oCamera.v_viewSizeY - 64;

draw_sprite_part(v_hudSprite, 0, v_hudBarStartX, v_hudBarSlotY, 14, 40, tmp_x - 14, tmp_y);

var tmp_canDrawS, tmp_canDrawZ;
tmp_canDrawS = true;
tmp_canDrawZ = true;

for (var i = 0; i < v_hotbarSlots; i++)
{	
	tmp_canDrawZ = true;
	draw_sprite_part(v_hudSprite, 0, v_hudBarSlotX, v_hudBarSlotY, 40, 40, tmp_x, tmp_y);
	if (i != v_hotbarSlots - 1) {draw_sprite_part(v_hudSprite, 0, v_hudBarConnectX, v_hudBarConnectY, 5, 40, tmp_x + 40, tmp_y);}
	
	if (point_in_rectangle(mouse_x, mouse_y, tmp_x, tmp_y, tmp_x + 40, tmp_y + 40))
	{
		tmp_selX = tmp_x;
		tmp_selY = tmp_y;
		tmp_selXO = 0;
		tmp_selYO = 0;
		tmp_selW = 40;
		tmp_selH = 40;
		oStatusMenu.v_hotslot = i;
		
		if (oStatusMenu.v_spellSelection != -1)
		{
			draw_sprite_stretched(sSpells, oHUD.v_playerSpell[oStatusMenu.g_spellList[| oStatusMenu.v_spellSelection], 1], tmp_selX - tmp_selXO + 2, tmp_selY - tmp_selYO + 2, tmp_selW - 4, tmp_selH - 4); 		
			tmp_canDrawS = false;
			tmp_canDrawZ = false;
		}
		
		// Reset slot
		if (mouse_check_button_pressed(mb_right))
		{
			v_hotbar[i, 0] = -1;
		}
		
		// Drag slot
		if (mouse_check_button_pressed(mb_left))
		{
			if (v_hotbar[i, 0] == 0)
			{
				oStatusMenu.v_spellSelection = oStatusMenu.g_spellList[| v_hotbar[i, 1]];
				v_hotbar[i, 0] = -1;
			}
		}
	}
	
	// Render binded spell
	if (v_hotbar[i, 0] == 0 && tmp_canDrawZ)
	{
		draw_sprite_stretched(sSpells, oHUD.v_playerSpell[v_hotbar[i, 1], 1], tmp_x + 2, tmp_y + 2, 36, 36); 				
	}
	
	draw_sprite_part(v_hudSprite, 0, 353, 423, 40, 40, tmp_x, tmp_y);	
	tmp_x += 45;
}

draw_sprite_part(v_hudSprite, 0, v_hudBarEndX, v_hudBarSlotY, 14, 40, tmp_x - 6, tmp_y);

if (tmp_canDrawS)
{
	oStatusMenu.v_hotslot = -1;	
}
if (tmp_canDrawS && oStatusMenu.v_spellSelection != -1)
{
	draw_sprite_stretched(sSpells, oHUD.v_playerSpell[oStatusMenu.g_spellList[| oStatusMenu.v_spellSelection], 1], tmp_selX - tmp_selXO, tmp_selY - tmp_selYO, tmp_selW, tmp_selH); 	
}


// Draw minimap
tmp_x = oCamera.v_nullPosX + oCamera.v_viewSizeX - 136;
tmp_y = oCamera.v_nullPosY + 4;

draw_sprite_part(v_hudSprite, 0, v_hudMapX, v_hudMapY, 136, 129, tmp_x, tmp_y);

// Draw minimap buttons
draw_sprite_part(v_hudSprite, 0, v_hudBallX, v_hudBallY, 15, 15, tmp_x + 101, tmp_y + 19);
draw_sprite_part(v_hudSprite, 0, v_hudBallX, v_hudBallY, 15, 15, tmp_x + 15, tmp_y + 89);
draw_sprite_part(v_hudSprite, 0, v_hudBallX, v_hudBallY, 15, 15, tmp_x + 31, tmp_y + 105);
