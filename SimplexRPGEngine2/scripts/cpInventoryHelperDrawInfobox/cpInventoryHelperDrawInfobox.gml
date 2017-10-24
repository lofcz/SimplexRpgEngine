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
	tmp_drawY = oInventory.v_formEndY - 12;
	tmp_alpha = min(v_formAlpha, tmp_hoverAlpha);
	tmp_layoutSlotsX = tmp_infoboxW;

	clr(-1, tmp_alpha);
	//draw_sprite_tiled_area(oInventory.v_inventoryTexSprite, 0, 0, 0, tmp_drawX + oInventory.v_frameBorder, tmp_drawY + oInventory.v_frameBorder, oInventory.v_layoutEndX, tmp_drawY - 2 + tmp_infoboxH * oInventory.v_slotSize);
	clr();
	
	libUtilityDrawForm(tmp_drawX + 1, tmp_drawY + oInventory.v_frameBorder, abs((tmp_drawX + oInventory.v_frameBorder) - oInventory.v_layoutEndX) - 28, abs((tmp_drawY + oInventory.v_frameBorder) - tmp_drawY - 2 + tmp_infoboxH * oInventory.v_slotSize), tmp_alpha);
	
	
	for (var i = 0; i < tmp_infoboxH + 1; i++)
	{
		
		for (var j = 0; j < tmp_infoboxW + 1; j++)
		{
			if (j != tmp_layoutSlotsX - 1) {tmp_drawX += oInventory.v_slotSize;} else {tmp_drawX += oInventory.v_layoutRestX;}
		}
	
		if (i != tmp_infoboxH - 1) {tmp_drawY += oInventory.v_slotSize;}
		tmp_drawX = oInventory.v_drawStartX;
	}

	// Draw info about item
	tmp_drawX = (oInventory.v_layoutEndX - oInventory.v_drawStartX) / 2 + oInventory.v_drawStartX;
	tmp_drawY = oInventory.v_formEndY + 4;
	
	fnt(fntPixelSmall);
	alg("center");
	
	var tmp_text;
	tmp_text = tmp_slotID[tmp_hoverID, e_inventoryAtributes.valInfoTextHead];
	
	if (!tmp_slotID[tmp_hoverID, e_inventoryAtributes.valIdentified]) {tmp_text = "??????";}
	
	clr(c_black, tmp_hoverAlpha);
	draw_text(tmp_drawX, tmp_drawY, tmp_text);
	alg();
	
	tmp_drawX = oInventory.v_drawStartX + 8;
	tmp_drawY += 8;

	clr(c_black, tmp_hoverAlpha);
	tmp_text = tmp_slotID[tmp_hoverID, e_inventoryAtributes.valInfoTextBody];
	
	if (!tmp_slotID[tmp_hoverID, e_inventoryAtributes.valIdentified]) {tmp_text = _sc(__("This item is covered with misty aura, you need to identify it first."), c_red);}
	
	var tmp_stringH, tmp_fX;
	tmp_fX = 0;
	
	if (tmp_slotID[tmp_hoverID, e_inventoryAtributes.valGemSlots] > 1) {tmp_fX += 16;}
	
	ui = draw_text_colored(tmp_drawX, tmp_drawY, tmp_text, abs((tmp_drawX + oInventory.v_frameBorder) - oInventory.v_layoutEndX) - 30 - tmp_fX, fntPixelTiny, c_black);
	
	tmp_stringH = string_height(scrWordwrap(libUtilityParseTextColored(tmp_text, fntPixelSmall), oInventory.v_layoutEndX - oInventory.v_drawStartX - (46 + tmp_fX), fntPixelSmall, true));
	
	if (tmp_slotID[tmp_hoverID, e_inventoryAtributes.valPriceBase] > 0)
	{
		clr(c_black, tmp_hoverAlpha);
		alg(fa_right, fa_top);		
		tmp_text = string(tmp_slotID[tmp_hoverID, e_inventoryAtributes.valPriceBase]);
		
		if (!tmp_slotID[tmp_hoverID, e_inventoryAtributes.valIdentified]) {tmp_text = "?";}
	
		draw_text(oInventory.v_layoutEndX - 5, tmp_drawY - 2 + tmp_infoboxH * oInventory.v_slotSize - 14, tmp_text + "   ");
		draw_sprite_ext(sCoinDrop, 4, oInventory.v_layoutEndX - 13, tmp_drawY + tmp_infoboxH * oInventory.v_slotSize + 5, 0.8, 0.8, 0, c_white, tmp_hoverAlpha);
		alg();
	}


	clr(c_black, tmp_hoverAlpha);
	alg(fa_right, fa_top);
	
	var tmp_strR;
	tmp_strR = number_format(tmp_slotID[tmp_hoverID, e_inventoryAtributes.valWeight], 1, ".", ",");
	if (tmp_slotID[tmp_hoverID, e_inventoryAtributes.valWeight] % 1 == 0) {tmp_strR = string(tmp_slotID[tmp_hoverID, e_inventoryAtributes.valWeight]);}
	
	draw_text(oInventory.v_layoutEndX - 5, tmp_drawY - 2 + tmp_infoboxH * oInventory.v_slotSize - 26, tmp_strR + "   ");
	draw_sprite_ext(sInventoryIcons, 0, oInventory.v_layoutEndX - 13, tmp_drawY + 5 + tmp_infoboxH * oInventory.v_slotSize - 26, 0.35, 0.35, 0, c_white, tmp_hoverAlpha);
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
				if (tmp_val > 0) {tmp_string1 += _sc(string(tmp_val), c_white); if (tmp_staticVal > 0) {tmp_string1 += _sc(" + ", c_black) + _sc(string(tmp_staticVal), c_lime);}}
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
		if (tmp_slotID[tmp_hoverID, e_inventoryAtributes.valIdentified])
		{
			draw_text_colored(tmp_drawX - 3, ui + 12, tmp_string, -1, fntPixelExtraTiny, c_black);
		}
	}
	
	// Draw item category
	var tmp_itemC;
	tmp_itemC = "[";
	
	if (tmp_slotID[tmp_hoverID, e_inventoryAtributes.valEquipSlot] != e_equipmentSlots.valNONE) {tmp_itemC += libUtilityEquipmentSlotToString(tmp_slotID[tmp_hoverID, e_inventoryAtributes.valEquipSlot]);}
	
	// Add durability
	if (tmp_slotID[tmp_hoverID, e_inventoryAtributes.valDurability] != 0)
	{
		tmp_itemC += ", " + string(tmp_slotID[tmp_hoverID, e_inventoryAtributes.valDurability]) + " / " + string(tmp_slotID[tmp_hoverID, e_inventoryAtributes.valMaxDurability]);
		
	}
	
	
	tmp_itemC += "]";
	fnt(fntPixelExtraTiny);
	clr(-1, tmp_hoverAlpha);
	draw_text(tmp_drawX, tmp_drawY + 8 + tmp_infoboxH * oInventory.v_slotSize - 26, tmp_itemC);
	
	// Draw gems
	if (tmp_slotID[tmp_hoverID, e_inventoryAtributes.valGemSlots] > 0)
	{
		for (var i = 0; i < tmp_slotID[tmp_hoverID, e_inventoryAtributes.valGemSlots]; i++)
		{
			draw_sprite_part(oHUD.v_hudSprite, 0, 66, 157, 14, 14, oInventory.v_layoutEndX - 20, tmp_drawY - 12 + i * 16);
		}
	}
	clr();
}