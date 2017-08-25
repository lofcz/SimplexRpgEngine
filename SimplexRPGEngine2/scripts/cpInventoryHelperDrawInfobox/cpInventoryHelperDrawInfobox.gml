/// @function cpInventoryHelperDrawInfobox(containerID)
/// @desc Draws standard infobox
/// @arg {object} containerID ID of owner

var tmp_id, tmp_slotID, tmp_hoverAlpha, tmp_hoverID, tmp_propertyArray, tmp_reqArray, tmp_propertyStaticArray;
tmp_id = oInventory;

if (argument_count > 0) {tmp_id = argument[0];}

tmp_slotID = tmp_id.v_slot;
tmp_hoverAlpha = tmp_id.v_hoverAlpha;
tmp_hoverID = tmp_id.v_lastHover;
tmp_propertyArray = tmp_id.v_slotProperty;
tmp_reqArray = tmp_id.v_slotReq;
tmp_propertyStaticArray = tmp_id.v_slotPropertyStatic;

if (argument_count > 1) {tmp_slotID = argument[1];}
if (argument_count > 2) {tmp_hoverAlpha = argument[2];}
if (argument_count > 3) {tmp_hoverID = argument[3];}
if (argument_count > 4) {tmp_propertyArray = argument[4];}
if (argument_count > 5) {tmp_reqArray = argument[5];}
if (argument_count > 6) {tmp_propertyStaticArray = argument[6];}

if (tmp_hoverAlpha > 0.05)
{
	// Draw base layout
	var tmp_infoboxW, tmp_infoboxH, tmp_alpha, tmp_drawX, tmp_drawY, tmp_layoutWidth, tmp_layoutHeight, tmp_layoutSlotsX;
	tmp_infoboxW = oInventory.v_layoutSlotsX;
	tmp_infoboxH = 4;
	tmp_drawX = oInventory.v_formEndX;
	tmp_drawY = oInventory.v_formEndY;
	tmp_alpha = min(v_formAlpha, tmp_hoverAlpha);
	tmp_layoutSlotsX = tmp_infoboxW;

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
	draw_text_color(tmp_drawX, tmp_drawY, tmp_slotID[tmp_hoverID, e_inventoryAtributes.valInfoTextHead], c_black, c_black, c_black, c_black, tmp_hoverAlpha);
	alg();
	
	tmp_drawX = oInventory.v_drawStartX + 8;
	tmp_drawY += 8;

	clr(c_black, tmp_hoverAlpha);
	draw_text_colored(tmp_drawX, tmp_drawY, tmp_slotID[tmp_hoverID, e_inventoryAtributes.valInfoTextBody], oInventory.v_layoutEndX - oInventory.v_drawStartX - 30, fntPixelTiny);

	var tmp_stringH;
	tmp_stringH = string_height(tmp_slotID[tmp_hoverID, e_inventoryAtributes.valInfoTextBody]);
	
	if (tmp_slotID[tmp_hoverID, e_inventoryAtributes.valPriceBase] > 0)
	{
		clr(c_black, tmp_hoverAlpha);
		alg(fa_right, fa_top);
		draw_text(oInventory.v_layoutEndX - 4, tmp_drawY - 2 + tmp_infoboxH * oInventory.v_slotSize - 52, string(tmp_slotID[tmp_hoverID, e_inventoryAtributes.valPriceBase]) + "G");
		alg();
	}


	clr(c_black, tmp_hoverAlpha);
	alg(fa_right, fa_top);
	draw_text(oInventory.v_layoutEndX - 4, tmp_drawY - 2 + tmp_infoboxH * oInventory.v_slotSize - 42, string(tmp_slotID[tmp_hoverID, e_inventoryAtributes.valWeight]) + "W");
	alg();

	
	// Draw properties:
	var tmp_string, tmp_array;
	tmp_string = "";
	
	// First we set up properties string
	for (var i = 0; i < mcInventoryProperties; i++)
	{
		var tmp_staticVal, tmp_val, tmp_string1, tmp_string2;
		tmp_staticVal = tmp_propertyStaticArray[tmp_hoverID, i];
		tmp_val = tmp_propertyArray[tmp_hoverID, i];
		tmp_string1 = "";
		tmp_string2 = "";
		
		if (tmp_val > 0 || tmp_staticVal > 0)
		{
			tmp_array = libUtilityPropertyToString(i);
			
			if (tmp_array[1] == 0)
			{
				if (tmp_val > 0) {tmp_string1 += string(tmp_val); if (tmp_staticVal > 0) {tmp_string1 += " + " + _sc(string(tmp_staticVal), c_lime);}}
				else {tmp_string1 += _sc(string(tmp_staticVal), c_lime);}
				
				tmp_string += " " + tmp_array[0] + ": " + tmp_string1 + "#";
			}			
		} 
	}
	
	// Then we add slot requirments to the bottom
	for (var i = 0; i < mcInventoryProperties; i++)
	{
		if (tmp_reqArray[tmp_hoverID, i] > 0)
		{
			var tmp_color;
			tmp_color = c_red;
			
			if (oHUD.v_playerProperty[i] >= tmp_reqArray[tmp_hoverID, i]) {tmp_color = c_lime;}
			
			tmp_array = libUtilityPropertyToString(i);		
			
			if (tmp_color == c_red)
			{	
				tmp_string += " " + _sc(tmp_array[0] + " required: " + string(tmp_reqArray[tmp_hoverID, i]) + " (now: " + string(oHUD.v_playerProperty[i]) + ")", tmp_color) + "#";		
			}
			else
			{
				tmp_string += " " + _sc(tmp_array[0] + " required: " + string(tmp_reqArray[tmp_hoverID, i]), tmp_color) + "#";		
			}
		} 
	}	
	
	if (tmp_string != "")
	{
		draw_text_colored(tmp_drawX - 3, tmp_drawY + 16 + tmp_stringH, tmp_string, -1, fntPixelExtraTiny);
	}
	
	clr();
}