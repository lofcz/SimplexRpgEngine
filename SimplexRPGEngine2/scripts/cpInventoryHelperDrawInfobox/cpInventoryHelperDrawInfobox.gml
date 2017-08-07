/// @function cpInventoryHelperDrawInfobox(containerID)
/// @desc Draws standard infobox
/// @arg {object} containerID ID of owner

var tmp_id;
tmp_id = oInventory;

if (argument_count > 0) {tmp_id = argument[0];}

if (tmp_id.v_hoverAlpha > 0.05)
{
	// Draw base layout
	var tmp_infoboxW, tmp_infoboxH, tmp_alpha, tmp_drawX, tmp_drawY, tmp_layoutWidth, tmp_layoutHeight, tmp_layoutSlotsX;
	tmp_infoboxW = oInventory.v_layoutSlotsX;
	tmp_infoboxH = 4;
	tmp_drawX = oInventory.v_formEndX;
	tmp_drawY = oInventory.v_formEndY;
	tmp_alpha = min(v_formAlpha, v_hoverAlpha);
	tmp_layoutWidth = oInventory.v_drawStartX + tmp_infoboxW * (oInventory.v_slotSize + oInventory.v_slotOffsetX) - oInventory.v_slotOffsetX - oInventory.v_frameBorder + 1;
	tmp_layoutHeight = (oInventory.v_slotRows * (oInventory.v_slotSize + oInventory.v_slotOffsetY)) + oInventory.v_drawStartY + tmp_infoboxH * (oInventory.v_slotSize + oInventory.v_slotOffsetY) - oInventory.v_slotOffsetY - oInventory.v_frameBorder - 6;
	tmp_layoutSlotsX = tmp_infoboxW; //(min(oInventory.v_slots, oInventory.v_slotsPerRow) * (oInventory.v_slotSize + oInventory.v_slotOffsetX) div (oInventory.v_slotSize + oInventory.v_slotOffsetX)) + 1;

	clr(-1, tmp_alpha);
	draw_sprite_tiled_area(oInventory.v_inventoryTexSprite, 0, 0, 0, tmp_drawX + oInventory.v_frameBorder, tmp_drawY + oInventory.v_frameBorder, oInventory.v_layoutEndX, tmp_drawY - 2 + tmp_infoboxH * oInventory.v_slotSize);
	clr();
	
	for (var i = 0; i < tmp_infoboxH + 1; i++)
	{
		for (var j = 0; j < tmp_infoboxW + 1; j++)
		{
			// Draw form layout
			//	- Top row
			//  - Middle rows
			//	- Bottom row
			if (i == 0)
			{
				if (j == 0) {draw_sprite_part_ext(oInventory.v_inventorySprite, 0, oHUD.v_hudFrameTopX, oHUD.v_hudFrameTopY, 32, 32, tmp_drawX, tmp_drawY, 1, 1, c_white, tmp_alpha);}
				else if (j == tmp_layoutSlotsX - 1) {draw_sprite_part_ext(oInventory.v_inventorySprite, 0, oHUD.v_hudFrameTopX + 32, oHUD.v_hudFrameTopY, oInventory.v_layoutRestX, 32, tmp_drawX, tmp_drawY, 1, 1, c_white, tmp_alpha);}
				else if (j == tmp_layoutSlotsX) {draw_sprite_part_ext(oInventory.v_inventorySprite, 0, oHUD.v_hudFrameTopX + 64, oHUD.v_hudFrameTopY, 32, 32, tmp_drawX, tmp_drawY, 1, 1, c_white, tmp_alpha);}
				else {draw_sprite_part_ext(oInventory.v_inventorySprite, 0, oHUD.v_hudFrameTopX + 32, oHUD.v_hudFrameTopY, 32, 32, tmp_drawX, tmp_drawY, 1, 1, c_white, tmp_alpha);}
			}
		
			else if (i == tmp_infoboxH)
			{
				if (j == 0) {draw_sprite_part_ext(oInventory.v_inventorySprite, 0, oHUD.v_hudFrameBottomX, oHUD.v_hudFrameBottomY, 32, 32, tmp_drawX, tmp_drawY, 1, 1, c_white, tmp_alpha);}
				else if (j == tmp_layoutSlotsX) {draw_sprite_part_ext(oInventory.v_inventorySprite, 0, oHUD.v_hudFrameBottomX + 64, oHUD.v_hudFrameBottomY, 32, 32, tmp_drawX, tmp_drawY, 1, 1, c_white, tmp_alpha);}
				else if (j == tmp_layoutSlotsX - 1) {draw_sprite_part_ext(oInventory.v_inventorySprite, 0, oHUD.v_hudFrameBottomX + 32, oHUD.v_hudFrameBottomY, oInventory.v_layoutRestX, 32, tmp_drawX, tmp_drawY, 1, 1, c_white, tmp_alpha);}
				else {draw_sprite_part_ext(oInventory.v_inventorySprite, 0, oHUD.v_hudFrameBottomX + 32, oHUD.v_hudFrameBottomY, 32, 32, tmp_drawX, tmp_drawY, 1, 1, c_white, tmp_alpha); }		
			}			
			else
			{
				if (j == 0) {draw_sprite_part_ext(oInventory.v_inventorySprite, 0, oHUD.v_hudFrameMidX, oHUD.v_hudFrameMidY, 32, 32, tmp_drawX, tmp_drawY, 1, 1, c_white, tmp_alpha);}
				else if (j == tmp_layoutSlotsX) {draw_sprite_part_ext(oInventory.v_inventorySprite, 0, oHUD.v_hudFrameMidX + 64, oHUD.v_hudFrameMidY, 32, 32, tmp_drawX, tmp_drawY, 1, 1, c_white, tmp_alpha);}		
			}	
					
			if (j != tmp_layoutSlotsX - 1) {tmp_drawX += oInventory.v_slotSize;} else {tmp_drawX += oInventory.v_layoutRestX;}
		}	
	
		if (i != tmp_infoboxH - 1) {tmp_drawY += oInventory.v_slotSize;}
		tmp_drawX = oInventory.v_drawStartX;
	}

	// Draw info about item
	tmp_drawX = (oInventory.v_layoutEndX - oInventory.v_drawStartX) / 2 + oInventory.v_drawStartX;
	tmp_drawY = oInventory.v_formEndY + 16;
	
	fnt(fntPixelSmall);
	alg("center");
	draw_text_color(tmp_drawX, tmp_drawY, tmp_id.v_slot[tmp_id.v_lastHover, e_inventoryAtributes.valInfoTextHead], c_black, c_black, c_black, c_black, tmp_id.v_hoverAlpha);
	alg();
	
	tmp_drawX = oInventory.v_drawStartX + 8;
	tmp_drawY += 8;

	clr(c_black, tmp_id.v_hoverAlpha);
	draw_text_colored(tmp_drawX, tmp_drawY, tmp_id.v_slot[tmp_id.v_lastHover, e_inventoryAtributes.valInfoTextBody], oInventory.v_layoutEndX - oInventory.v_drawStartX - 30, fntPixelTiny);

	var tmp_stringH;
	tmp_stringH = string_height(tmp_id.v_slot[tmp_id.v_lastHover, e_inventoryAtributes.valInfoTextBody]);
	
	if (tmp_id.v_slot[tmp_id.v_lastHover, e_inventoryAtributes.valPriceBase] > 0)
	{
		clr(c_black, tmp_id.v_hoverAlpha);
		alg(fa_right, fa_top);
		draw_text(oInventory.v_layoutEndX - 4, tmp_drawY - 2 + tmp_infoboxH * oInventory.v_slotSize - 52, string(tmp_id.v_slot[tmp_id.v_lastHover, e_inventoryAtributes.valPriceBase]) + "G");
		alg();
	}


	clr(c_black, tmp_id.v_hoverAlpha);
	alg(fa_right, fa_top);
	draw_text(oInventory.v_layoutEndX - 4, tmp_drawY - 2 + tmp_infoboxH * oInventory.v_slotSize - 42, string(tmp_id.v_slot[tmp_id.v_lastHover, e_inventoryAtributes.valWeight]) + "W");
	alg();

	
	// Draw properties:
	var tmp_string, tmp_array;
	tmp_string = "";
	
	// First we set up properties string
	for (var i = 0; i < mcInventoryProperties; i++)
	{
		if (tmp_id.v_slotProperty[tmp_id.v_lastHover, i] > 0)
		{
			tmp_array = libUtilityPropertyToString(i);
			
			if (tmp_array[1] == 0)
			{
				tmp_string += " " + tmp_array[0] + ": " + string(tmp_id.v_slotProperty[tmp_id.v_lastHover, i]) + "#"
			}			
		} 
	}
	
	// Then we add slot requirments to the bottom
	for (var i = 0; i < mcInventoryProperties; i++)
	{
		if (tmp_id.v_slotReq[tmp_id.v_lastHover, i] > 0)
		{
			var tmp_color;
			tmp_color = c_red;
			
			if (oHUD.v_playerProperty[i] >= tmp_id.v_slotReq[tmp_id.v_lastHover, i]) {tmp_color = c_lime;}
			
			tmp_array = libUtilityPropertyToString(i);		
			
			if (tmp_color == c_red)
			{	
				tmp_string += _sc(tmp_array[0] + " required: " + string(tmp_id.v_slotReq[tmp_id.v_lastHover, i]) + " (now: " + string(oHUD.v_playerProperty[i]) + ")", tmp_color) + "#";		
			}
			else
			{
				tmp_string += _sc(tmp_array[0] + " required: " + string(tmp_id.v_slotReq[tmp_id.v_lastHover, i]), tmp_color) + "#";		
			}
		} 
	}	
	
	if (tmp_string != "")
	{
		draw_text_colored(tmp_drawX - 3, tmp_drawY + 16 + tmp_stringH, tmp_string, -1, fntPixelExtraTiny);
	}
	
	clr();
}