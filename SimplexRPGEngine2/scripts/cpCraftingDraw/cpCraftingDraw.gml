
var tmp_list, tmp_list2;
tmp_list = ds_list_create();
tmp_list2 = ds_list_create();
				
var tmp_alpha;
tmp_alpha = min(v_formAlpha, v_formExtAlpha);

alg("center")
fnt(fntPixelBig);
clr(-1, tmp_alpha);
draw_text(v_formBaseMaxX + (v_slotOffsetX * v_slotsPerRow) / 2 + (v_slotSize * 4.5) + v_formExtAlpha * (v_slotSize / 2), v_drawStartY + 16, __("Crafting"));
fnt();
alg();

// Draw selection menu
for (var i = 0; i < array_height_2d(v_craftingForms); i++)
{
	for (var j = 0; j < 6; j++)
	{
		var tmp_textureX, tmp_textureY;
			
		if (v_craftingForms[i, 4])
		{
			tmp_textureX = 633;
			tmp_textureY = 24;
				
			if (j == 0) {tmp_textureX = 633;}
			else if (j == 5) {tmp_textureX = 716;}
			else {tmp_textureX = 675;}
		}
		else
		{
			tmp_textureY = 426;
			tmp_textureX = 550;
				
			if (j == 0) {tmp_textureX = 550;}
			else if (j == 5) {tmp_textureX = 633;}
			else {tmp_textureX = 592;}
		}
			
		if (tmp_alpha > 0.02) {draw_sprite_part_ext(v_inventorySprite, 0, tmp_textureX, tmp_textureY, 40, 28, v_formBaseMaxX + v_slotSize + (j * 40) + v_formExtAlpha * (v_slotSize / 2), v_drawStartY + 48 + (30 * i) - v_craftingForms[i, 3], 1, 1, c_white, min(tmp_alpha, v_craftingForms[i, 2]));}
	}
		
	var tmp_fadeAlpha;
	tmp_fadeAlpha = 1;
		
	if (!v_craftingForms[i, 4]) 
	{
		tmp_fadeAlpha = 0.3;
		draw_sprite_part_ext(v_inventorySprite, 0, 552, 457, 13, 17, v_formBaseMaxX + v_slotSize + (3 * 40) + v_formExtAlpha * (v_slotSize / 2), v_drawStartY + 52 + (30 * i) - v_craftingForms[i, 3], 1, 1, c_white, min(tmp_alpha, v_craftingForms[i, 2]));		
	}
		
	alg("center");
	clr(-1, min(tmp_alpha, v_craftingForms[i, 2], tmp_fadeAlpha));
	if (tmp_alpha > 0.02) {draw_text(v_formBaseMaxX + v_slotSize + v_formExtAlpha * (v_slotSize / 2) + 40 * 3 + v_craftingForms[i, 1], v_drawStartY + 60 + (30 * i) - v_craftingForms[i, 3], __(v_craftingForms[i, 0]));}
	clr();
	alg();
		
	if (point_in_rectangle(mouse_x, mouse_y, v_formBaseMaxX + v_slotSize + v_formExtAlpha * (v_slotSize / 2), v_drawStartY + 48 + (30 * i) - v_craftingForms[i, 3], v_formBaseMaxX + v_slotSize + v_formExtAlpha * (v_slotSize / 2) + 6 * 40, v_drawStartY + 48 + (30 * i) + 24 - v_craftingForms[i, 3]) && v_craftingForms[i, 4])
	{
		if (v_selectedForm != i && v_craftingForms[i, 2] >= 0.98 && v_subformAlpha <= 0.05 && v_craftAlpha <= 0.05) {v_craftingForms[i, 1] = min(lerp(v_craftingForms[i, 1], 18, 0.1), 16);} 
		else {v_craftingForms[i, 1] = max(lerp(v_craftingForms[i, 1], -2, 0.1), 0);}
			
		if (mouse_check_button_pressed(mb_left))
		{
			if (v_selectedForm == -1) 
			{
				v_selectedForm = i; 
				v_selectedLastForm = v_selectedForm; 			
				v_currentFormType = v_craftingForms[i, 0];			
			}
			else {if (i == v_selectedForm) {if (v_craftAlpha < 0.05) {v_selectedForm = -1;} else {v_craftWIP = false;}}}
		}
	}
	else {v_craftingForms[i, 1] = max(lerp(v_craftingForms[i, 1], -2, 0.1), 0);}
		
	if (v_selectedForm != -1)
	{
		if (v_selectedForm != i && v_subformAlpha <= 0.05)
		{
			v_craftingForms[i, 2] = max(lerp(v_craftingForms[i, 2], -0.2, 0.1), 0);
			v_craftingForms[i, 3] = lerp(v_craftingForms[i, 3], 0, 0.1);
		}
		else if (v_selectedForm == i && v_subformAlpha <= 0.05 && v_craftAlpha <= 0.05)
		{
			v_craftingForms[i, 3] = min(lerp(v_craftingForms[i, 3], 30 * (i + 0.5) + 2, 0.1), 30 * (i + 0.5));
		}
	}
	else if (v_subformAlpha <= 0.05 && v_craftAlpha < 0.05)
	{
		v_craftingForms[i, 3] = lerp(v_craftingForms[i, 3], 0, 0.1);
		if (v_craftingForms[i, 3] < 1) {v_craftingForms[i, 2] = min(lerp(v_craftingForms[i, 2], 1.2, 0.1), 1);}
		v_craftItemSelected = -1;
	}
}

if (v_craftAlpha < 0.05 && !v_craftWIP) {v_craftItemSelected = -1;}

// Draw selected subform
if (v_selectedForm != -1 && v_craftingForms[v_selectedForm, 3] >= 30 * (v_selectedForm + 0.5) && v_craftItemSelected == -1) {v_subformAlpha = lerp(v_subformAlpha, 1, 0.1);}
else {v_subformAlpha = lerp(v_subformAlpha, 0, 0.1);}

if (v_subformAlpha <= 0.05 && v_craftItemSelected != -1 && v_selectedForm != -1 && v_craftingForms[v_selectedForm, 3] >= 30 * (v_selectedForm + 0.5) && (v_craftWIP || hj > 260)) {v_craftAlpha = lerp(v_craftAlpha, 1, 0.1);} else {v_craftAlpha = lerp(v_craftAlpha, 0, 0.1);}
draw_text(mouse_x + 256, mouse_y, v_craftAlpha);
// Item crafting

if ((v_selectedLastForm == 0 || v_selectedLastForm == 2 || v_selectedLastForm == 3 || v_selectedLastForm == 4) && v_subformAlpha > 0.05)
{
	var tmp_drawX, tmp_drawY, tmp_sx, tmp_sy, tmp_slotsRenderedNow, tmp_currentRow, tmp_offsetHelp;
	tmp_drawX = v_formBaseMaxX + v_slotSize + v_subformAlpha * (v_slotSize / 2) + 8;
	tmp_drawY = v_drawStartY + 108;
	tmp_sx = tmp_drawX;
	tmp_sy = tmp_drawY;
	tmp_slotsRenderedNow = 0;
	tmp_currentRow = 0;
	tmp_offsetHelp = oHUD.v_hudSlotX;
	
	clr(-1, min(v_subformAlpha, tmp_alpha));
	var tmp_hoverID, tmp_hoverX, tmp_hoverY;
	tmp_hoverID = -1;
	tmp_hoverX = 0;
	tmp_hoverY = 0;
	
	for (var i = 0; i < 24; i++)
	{
		if (tmp_currentRow == 0)
		{
			if (tmp_slotsRenderedNow == 0)
			{
				draw_sprite_part(v_inventorySprite, 0, tmp_offsetHelp, oHUD.v_hudSlotY, 38, 38, tmp_drawX, tmp_drawY);
			}
			else if (tmp_slotsRenderedNow == 6 - 1)
			{
				draw_sprite_part(v_inventorySprite, 0, tmp_offsetHelp + 76, oHUD.v_hudSlotY, 38, 38, tmp_drawX, tmp_drawY);		
			}
			else
			{
				draw_sprite_part(v_inventorySprite, 0, tmp_offsetHelp + 38, oHUD.v_hudSlotY, 38, 38, tmp_drawX, tmp_drawY);
			}
		}
		else if (tmp_currentRow == 3)
		{
			if (tmp_slotsRenderedNow == 0)
			{
				draw_sprite_part(v_inventorySprite, 0, tmp_offsetHelp, oHUD.v_hudSlotY + 76, 38, 38, tmp_drawX, tmp_drawY);
			}
			else if (tmp_slotsRenderedNow == 6 - 1)
			{
				draw_sprite_part(v_inventorySprite, 0, tmp_offsetHelp + 76, oHUD.v_hudSlotY + 76, 38, 38, tmp_drawX, tmp_drawY);		
			}
			else
			{
				draw_sprite_part(v_inventorySprite, 0, tmp_offsetHelp + 38, oHUD.v_hudSlotY + 76, 38, 38, tmp_drawX, tmp_drawY);
			}
		}
		else
		{
			if (tmp_slotsRenderedNow == 0)
			{
				draw_sprite_part(v_inventorySprite, 0, tmp_offsetHelp, oHUD.v_hudSlotY + 38, 38, 38, tmp_drawX, tmp_drawY);
			}
			else if (tmp_slotsRenderedNow == 6 - 1)
			{
				draw_sprite_part(v_inventorySprite, 0, tmp_offsetHelp + 76, oHUD.v_hudSlotY + 38, 38, 38, tmp_drawX, tmp_drawY);		
			}
			else
			{
				draw_sprite_part(v_inventorySprite, 0, tmp_offsetHelp + 38, oHUD.v_hudSlotY + 38, 38, 38, tmp_drawX, tmp_drawY);
			}
		}
		
		// Draw current reciept
		// We need to decide which reciept draw in current slot
		// Make use of double filters [tabType->searchString]		
		var tmp_recieptID;
		tmp_recieptID = -1;

		if (!v_searchActive) 
		{
			for (var j = 0; j < ds_list_size(g_itemsList); j++)
			{
				if (v_recieptItem[g_itemsList[| j], 6] == v_currentFormType && !ds_list_contains(tmp_list2, g_itemsList[| j]))
				{
					tmp_recieptID = g_itemsList[| j];
					ds_list_add(tmp_list2, tmp_recieptID);
					break;
				}
			}
		}
		else
		{
			for (var j = 0; j < ds_list_size(g_itemsList); j++)
			{
				if ((string_count(string_lower(v_searchText), string_lower(v_recieptItem[g_itemsList[| j], 0])) || v_searchText == "") && !ds_list_contains(tmp_list, g_itemsList[| j]))
				{
					// Selected right index to draw
					if (v_recieptItem[g_itemsList[| j], 6] == v_currentFormType)
					{
						tmp_recieptID = g_itemsList[| j];
						ds_list_add(tmp_list, tmp_recieptID);
						break;
					}
				}
			}
		}
		
		// Draw current reciept (for real)		
		if (tmp_recieptID != -1)
		{	
			var tmp_index, tmp_inst;
			tmp_inst = instance_create_layer(0, 0, "Items", v_recieptItem[tmp_recieptID, 4]);
			tmp_index = tmp_inst.image_index;
			instance_destroy(tmp_inst);
			
			var tmp_array;
			tmp_array = libUtilityRarityToPosition(v_recieptItem[tmp_recieptID, 1]);
			
			if (tmp_array[0] != -1)
			{
				draw_sprite_part(v_inventorySprite, 0, tmp_array[0], tmp_array[1], 32, 32, tmp_drawX + 4, tmp_drawY + 4);
			}
			
			draw_sprite(sItems, tmp_index, tmp_drawX + 18, tmp_drawY + 20);			

			// Check if reciept have never been seen by player
			if (!v_recieptItem[tmp_recieptID, 5])
			{
				shader_set(shdLerp);
				var tmp_uID = shader_get_uniform(shdLerp, "f_Colour1");
				shader_set_uniform_f(tmp_uID, color_get_red(c_yellow) / 255, color_get_green(c_yellow) / 255, color_get_blue(c_yellow) / 255, v_actualLerp);

				draw_sprite_part(v_inventorySprite, 0, 130, 107, 9, 13, tmp_drawX + 25, tmp_drawY + 4);
				
				shader_reset();
			}			
		}
		
		// Check for hover and item selection
		if (point_in_rectangle(mouse_x, mouse_y, tmp_drawX, tmp_drawY, tmp_drawX + 38, tmp_drawY + 38) && tmp_recieptID != -1)
		{
			tmp_hoverID = tmp_recieptID;
			tmp_hoverX = tmp_drawX;
			tmp_hoverY = tmp_drawY;
			
			if (mouse_check_button_pressed(mb_left))
			{
				v_craftItemSelected = tmp_recieptID;
				v_craftWIP = true;
				v_recieptItem[tmp_recieptID, 5] = true;
			}
		}
		
		
		tmp_slotsRenderedNow++;
		if (tmp_slotsRenderedNow >= 6)
		{		
			tmp_drawX = tmp_sx;
			tmp_drawY += (v_slotSize + 6);
			tmp_slotsRenderedNow = 0;
			tmp_currentRow++;
		}
		else
		{
			tmp_drawX += (v_slotSize + 6);
		}	
	}
	
	if (tmp_hoverID != -1)
	{
		libDrawTextStylized(tmp_hoverX + 40 * v_tipAlpha, tmp_hoverY, _sc(v_recieptItem[tmp_hoverID, 0], v_recieptItem[tmp_hoverID, 1]) + "#" + _ss(v_recieptItem[tmp_hoverID, 8]), min(draw_get_alpha(), v_tipAlpha), false, false);
		v_tipAlpha = lerp(v_tipAlpha, 1, 0.1);
	}
	else
	{
		v_tipAlpha = 0;
	}
	
	// Draw fulltext search
	if (!surface_exists(v_searchSurface)) {v_searchSurface = surface_create(400, 32);}
	if (v_carretTimer > 0) {v_carretTimer--;} else {v_carretTimer = 60; v_carret = !v_carret;}
	
	var tmp_carret;
	tmp_carret = "";
	
	if (v_carret) {tmp_carret = "|";}
	
	clr(-1, min(v_subformAlpha / 2, tmp_alpha));	
	draw_rectangle(tmp_sx, tmp_sy - 26, tmp_sx + 230, tmp_sy - 4, false);
	
	if (point_in_rectangle(mouse_x, mouse_y, tmp_sx, tmp_sy - 26, tmp_sx + 230, tmp_sy - 4))
	{
		if (mouse_check_button_pressed(mb_left))
		{
			v_searchActive = !v_searchActive;
			if (v_searchActive) {keyboard_string = v_searchText;}
		}
	}
	
	clr(c_white, min(v_subformAlpha, tmp_alpha));
	alg("center");
	fnt(fntPixelSmall);
	if (string_width(v_searchText) >= 225) {fnt(fntPixelTiny);}
	
	if (v_searchTipAlpha < 0.05)
	{
		surface_set_target(v_searchSurface);
		draw_clear_alpha(c_white, 0);
		draw_text(200, 16, v_searchText);
		alg();
		if (v_carret && v_searchActive) {draw_text(200 + string_width(v_searchText) / 2, 8, "|");}
		surface_reset_target();
	
		draw_surface_part(v_searchSurface, v_searchSurfaceX - 115, 0, 235, 32, tmp_sx, tmp_sy - 32);
	
		v_searchSurfaceX = lerp(v_searchSurfaceX, v_searchSurfaceTarX, 0.1);
	
		if (v_searchActive)
		{
			oHUD.v_keyboardClickedUI = true;
			if (keyboard_check(vk_anykey)) 
			{
				v_carretTimer = 60;
				v_carret = true;
				
				if (keyboard_lastkey == vk_enter)
				{
					v_searchText = "";
					keyboard_string = "";
					v_searchActive = false;
					v_searchSurfaceTarX = 200;
					v_searchSurfaceX = 200;
				}
				else if (string_length(keyboard_string) < 48 || keyboard_lastkey == vk_backspace)
				{
					v_searchText = keyboard_string; 
					if (string_width(v_searchText) >= 210) {v_searchSurfaceTarX = 200 - 115 + (string_width(keyboard_string) / 2);}
				}
				else {keyboard_string = v_searchText;}
			}
		}
	}
	
	if (!v_searchActive && v_searchText == "") {v_searchTipAlpha = lerp(v_searchTipAlpha, 1, 0.1);}
	else {v_searchTipAlpha = lerp(v_searchTipAlpha, 0, 0.15);}
	
	if (v_searchTipAlpha > 0)
	{
		clr(-1, min(v_subformAlpha, tmp_alpha, v_searchTipAlpha));
		alg("center");
		draw_sprite_part(v_inventorySprite, 0, 100, 126, 12, 12, tmp_sx + 115 - 12 - string_width(__("Search")) / 2, tmp_sy - 20);
		draw_text(tmp_sx + 115  + 6, tmp_sy - 14, __("Search"));
		alg();
	}
}

if (v_craftAlpha > 0.05)
{
	var tmp_drawX, tmp_drawY, tmp_sx, tmp_sy, tmp_slotsRenderedNow, tmp_currentRow, tmp_offsetHelp;
	tmp_drawX = v_formBaseMaxX + v_slotSize + v_craftAlpha * (v_slotSize / 2) + 8;
	tmp_drawY = v_drawStartY + 108;
	tmp_sx = tmp_drawX;
	tmp_sy = tmp_drawY;
	tmp_slotsRenderedNow = 0;
	tmp_currentRow = 0;
	tmp_offsetHelp = oHUD.v_hudSlotX;
	
	clr(-1, min(v_craftAlpha, tmp_alpha));
	//show_message(v_craftItemSelected);
	
	var tmp_lx, tmp_ly, tmp_ls, tmp_dx, tmp_dy, tmp_drawTooltip, tmp_tx, tmp_ty, tmp_flag, tmp_ready;
	tmp_lx = tmp_sx;
	tmp_ly = tmp_sy;
	tmp_ls = 0;
	tmp_drawTooltip = -1;
	tmp_tx = 0;
	tmp_ty = 0;
	tmp_flag = false;
	tmp_customDrop = false;
	tmp_ready = true;
	v_drawPreview = false;
	
	for (var i = 0; i < v_recieptItem[v_craftItemSelected, 2]; i++)
	{
		tmp_dx = 30;
		tmp_dy = 288;
		
		if (point_in_rectangle(mouse_x, mouse_y, tmp_lx, tmp_ly, tmp_lx + 40, tmp_ly + 40))
		{
			tmp_dy = 329;			
		}
	
		draw_sprite_part(v_inventorySprite, 0, tmp_dx, tmp_dy, 40, 40, tmp_lx, tmp_ly);	
		if (v_recieptItemSlot[v_craftItemSelected, (6 * i)] != e_items.valNONE && v_recieptItemSlot[v_craftItemSelected, (6 * i) + 5] == -1) {shader_set(shdGreyscale); draw_sprite_ext(sItems, v_recieptItemSlot[v_craftItemSelected, (6 * i)] - 2, tmp_lx + 20, tmp_ly + 20, 1, 1, 0, c_white, min(v_craftAlpha, tmp_alpha)); shader_reset();}
	
		if (v_slotBeingDragged != -1 && v_recieptItemSlot[v_craftItemSelected, (6 * i) + 5] == -1)
		{
			if (v_slot[v_slotBeingDragged, e_inventoryAtributes.valID] == v_recieptItemSlot[v_craftItemSelected, (6 * i)])
			{
				clr(c_lime, min(0.3, tmp_alpha));
				draw_rectangle(tmp_lx + 2, tmp_ly + 2, tmp_lx + 38, tmp_ly + 38, false);
				clr();
				
				// Check for item drop
				if (point_in_rectangle(mouse_x, mouse_y, tmp_lx, tmp_ly, tmp_lx + 40, tmp_ly + 40))
				{
					tmp_customDrop = true;
					
					if (mouse_check_button_released(mb_left))
					{
						v_recieptItemSlot[v_craftItemSelected, (6 * i) + 5] = v_slotBeingDragged;
						v_slot[v_slotBeingDragged, e_inventoryAtributes.valBeingUsed] = true;
						v_slotBeingDragged = -1;
						oHUD.v_mouseFree = true;
						oDrawHelperAbove.v_id = -1;
					}
				}
			}
		}
		
		// If any item is in slot, draw it
		if (v_recieptItemSlot[v_craftItemSelected, (6 * i) + 5] != -1)
		{	
			var tmp_itemID;
			tmp_itemID = v_recieptItemSlot[v_craftItemSelected, (6 * i) + 5];
			
			draw_sprite(v_slot[tmp_itemID, e_inventoryAtributes.valSprite], v_slot[tmp_itemID, e_inventoryAtributes.valImageIndex] + 2, tmp_lx + 20, tmp_ly + 20);
			
			// Release item on click
			if (point_in_rectangle(mouse_x, mouse_y, tmp_lx, tmp_ly, tmp_lx + 40, tmp_ly + 40))
			{	
				if (mouse_check_button_pressed(mb_left))
				{
					v_recieptItemSlot[v_craftItemSelected, (6 * i) + 5] = -1;
					v_slot[tmp_itemID, e_inventoryAtributes.valBeingUsed] = false;
				}
			}	
			
			v_drawPreview = true;
		}
		else {tmp_ready = false;}
		
		if (point_in_rectangle(mouse_x, mouse_y, tmp_lx, tmp_ly, tmp_lx + 40, tmp_ly + 40))
		{
			tmp_drawTooltip = i;
			tmp_flag = true;
			tmp_tx = tmp_lx;
			tmp_ty = tmp_ly;
		}					
		
		tmp_ls++;
		if (tmp_ls < 3)
		{
			tmp_ly += 46;
		}
		else
		{
			tmp_ly = tmp_sy;
			tmp_lx += 46;
			tmp_ls = 0;
		}
	}
	
	if (v_craftWIP == false) {v_drawPreview = false;}
	
	// Check if we can finish the reciept
	var tmp_text, tmp_color;
	tmp_text = __("All compulsory slots must be filled\nto finish the reciept");
	tmp_color = c_red;
	
	if (tmp_ready) {tmp_text = __("Item is ready to be finished"); tmp_color = c_lime; v_craftFinishAlpha = lerp(v_craftFinishAlpha, 1, 0.1);}
	else {v_craftFinishAlpha = lerp(v_craftFinishAlpha, 0, 0.1);}
	
	fnt();
	draw_text(tmp_sx, tmp_sy - 48, __("Crafting", 1, 1) + ": " + v_recieptItem[v_craftItemSelected, 0]);
	fnt(fntPixelTiny);
	clr(tmp_color, -1);
	draw_text(tmp_sx, tmp_sy - 32, tmp_text);
	clr(c_black, -1);
	fnt();
	
	// Draw preview if needed
	if (v_drawPreview && hj > 446)
	{
		v_previewAlpha = lerp(v_previewAlpha, 1, 0.1); 		
	}
	else {v_previewAlpha = lerp(v_previewAlpha, 0, 0.1);}
	
	if (v_previewAlpha > 0.05)
	{
		clr(-1, min(v_craftAlpha, tmp_alpha, v_previewAlpha));
		
		alg("center")
		fnt(fntPixelBig);
		draw_text(v_formBaseMaxX + (v_slotOffsetX * v_slotsPerRow) / 2 + (v_slotSize * 4.5) + v_previewAlpha * (v_slotSize / 2) + 220, v_drawStartY + 16, __("Preview"));
		fnt();
		alg();
		
		// Draw item statistics
		var tmp_string;
		tmp_refID = -1;
		tmp_string = "";
		
		if (v_craftItemSelected != -1)
		{
			with (instance_create_depth(0, 0, 0, oTempObject))
			{
				v_staticItem = true;
				instance_change(oInventory.v_recieptItem[oInventory.v_craftItemSelected, 4], true);
				oInventory.tmp_refID = id;
			}
		
			var tmp_propertiesArray, tmp_a1;
		
			for (var i = 0; i < mcInventoryProperties; i++)
			{
				tmp_propertiesArray[i] = tmp_refID.v_itemProperty[i];							
			}		
			instance_destroy(tmp_refID);
		
			for (var i = 0; i < v_recieptItem[v_craftItemSelected, 2]; i++)
			{
				if (v_recieptItemSlot[v_craftItemSelected, (6 * i) + 5] != -1)
				{
					for (var j = 0; j < mcInventoryProperties; j++)
					{
						tmp_propertiesArray[j] += v_slotProperty[v_recieptItemSlot[v_craftItemSelected, (6 * i) + 5], j];			
					}					
				}
			}
		
			for (var i = 0; i < mcInventoryProperties; i++)
			{
				tmp_a1 = libUtilityPropertyToString(i);
			
				if (tmp_a1[1] == 0 && tmp_propertiesArray[i] != 0)
				{
					tmp_string += " " + tmp_a1[0] + ": " + _sc(string(tmp_propertiesArray[i])) + "#";
				}							
			}			
		
			clr(c_black, -1);
			draw_text_colored(v_formBaseMaxX + (v_slotOffsetX * v_slotsPerRow) / 2 + (v_slotSize * 4.5) + v_previewAlpha * (v_slotSize / 2) + 120, v_drawStartY + 30, tmp_string);
		}
		
		var tmp_rec, tmp_color;
		tmp_color = c_white;
		
		if (v_craftFinishAlpha > 0.05) {tmp_color = c_yellow;}
		
		tmp_rec = libDrawTextStylized(v_formBaseMaxX + (v_slotOffsetX * v_slotsPerRow) / 2 + (v_slotSize * 4.5) + v_previewAlpha * (v_slotSize / 2) + 150, v_drawStartY + 260, _sc(__("Confirm"), tmp_color), min(v_craftAlpha, tmp_alpha, v_previewAlpha), true, 20, fntPixelSmall);
		
		if (point_in_rectangle(mouse_x, mouse_y, tmp_rec[0], tmp_rec[1], tmp_rec[2], tmp_rec[3]))
		{
			if (mouse_check_button_pressed(mb_left))
			{
				if (tmp_color == c_yellow)
				{
					tmp_freeSlot = cpInventoryHelperFindFreeSlot();
				
					// Found slot lets forge the item
					if (tmp_freeSlot != -1)
					{
						var input_slot;
						input_slot = cpContainerAdd(v_recieptItem[v_craftItemSelected, 4], 1);
					
						for (var j = 0; j < v_recieptItem[v_craftItemSelected, 2]; j++)
						{
							for (var i = 0; i < mcInventoryProperties; i++)
							{
								v_slotProperty[input_slot, i] += v_slotProperty[v_recieptItemSlot[v_craftItemSelected, (6 * j) + 5], i];							
							}
							
							v_slot[v_recieptItemSlot[v_craftItemSelected, (6 * j) + 5], e_inventoryAtributes.valItemNumber] -= v_recieptItemSlot[v_craftItemSelected, (6 * j) + 2];
							
							if (v_slot[v_recieptItemSlot[v_craftItemSelected, (6 * j) + 5], e_inventoryAtributes.valItemNumber] <= 0) {cpInventoryHelperClearSlot(v_recieptItemSlot[v_craftItemSelected, (6 * j) + 5]);}
							
							v_recieptItemSlot[v_craftItemSelected, (6 * j) + 5] = -1;
						}
					}					
				}
			}
		}
		
		tmp_rec = libDrawTextStylized(v_formBaseMaxX + (v_slotOffsetX * v_slotsPerRow) / 2 + (v_slotSize * 4.5) + v_previewAlpha * (v_slotSize / 2) + 295, v_drawStartY + 260, _sc(__("Quit")), min(v_craftAlpha, tmp_alpha, v_previewAlpha), true, 20, fntPixelSmall);
	
		if (point_in_rectangle(mouse_x, mouse_y, tmp_rec[0], tmp_rec[1], tmp_rec[2], tmp_rec[3]))
		{
			if (mouse_check_button_pressed(mb_left))
			{
				for (var j = 0; j < v_recieptItem[v_craftItemSelected, 2]; j++)
				{						
					if (v_recieptItemSlot[v_craftItemSelected, (6 * j) + 5] != -1)
					{
						v_slot[v_recieptItemSlot[v_craftItemSelected, (6 * j) + 5], e_inventoryAtributes.valBeingUsed] = false;
						v_recieptItemSlot[v_craftItemSelected, (6 * j) + 5] = -1;
					}
				}				
			}
		}
	}
	
	clr(-1, min(v_craftAlpha, tmp_alpha));	
	v_customDropItem = tmp_customDrop;
	
	if (tmp_flag) {v_tooltipAlpha = lerp(v_tooltipAlpha, 1, 0.1);} else {v_tooltipAlpha = 0;}
	
	for (var i = 0; i < v_recieptItem[v_craftItemSelected, 3]; i++)
	{
		draw_sprite_part(v_inventorySprite, 0, 30, 370, 40, 40, tmp_sx + (46 * 4), tmp_sy + (i * 46));
	}
	
	if (tmp_drawTooltip != -1)
	{
		// Check if we hold needed item
		var tmp_color, tmp_string, tmp_array;
		tmp_color = c_white;
		tmp_string = "";
		
		if (v_recieptItemSlot[v_craftItemSelected, (6 * tmp_drawTooltip) + 5] != -1) {tmp_color = c_lime;}
		
		v_actualIndex = v_recieptItemSlot[v_craftItemSelected, (6 * tmp_drawTooltip) + 3];
		//v_entireText = v_actualIndex + v_recieptItemSlot[v_craftItemSelected, (5 * tmp_drawTooltip) + 4];
		v_midText = libUtilityParseTextColored("#" + v_recieptItemSlot[v_craftItemSelected, (6 * tmp_drawTooltip) + 4]);
		v_entireText = libUtilityParseTextColored(v_actualIndex) + v_midText;
		
		tmp_textClean = libUtilityParseTextColored(v_entireText, fntPixel);
		
		if (v_recieptItemSlot[v_craftItemSelected, (6 * tmp_drawTooltip)] != -1)
		{
			if (tmp_color == c_white) {tmp_infoText =  _sc(__("Requires")) + ": " + __(libUtilityItemToString(v_recieptItemSlot[v_craftItemSelected, (6 * tmp_drawTooltip)])) + " x" + string(v_recieptItemSlot[v_craftItemSelected, (6 * tmp_drawTooltip) + 2]) + "#";}
			else
			{
				// Build info string
				tmp_string = "Slot bonus:#";
				
				for (var i = 0; i < mcInventoryProperties; i++)
				{
					tmp_array = libUtilityPropertyToString(i);
			
					if (tmp_array[1] == 0 && v_slotProperty[v_recieptItemSlot[v_craftItemSelected, (6 * tmp_drawTooltip) + 5], i] != 0)
					{
						tmp_string += tmp_array[0] + ": " + _sc(string(v_slotProperty[v_recieptItemSlot[v_craftItemSelected, (6 * tmp_drawTooltip) + 5], i])) + "#";
					}			
				}
				
				tmp_infoText = tmp_string;
			}
		}
		else
		{
			tmp_infoText = "";
		}

		 fnt(fntPixel);
		 tmp_xo2 = string_width(v_entireText); 
		 tmp_yo2 = string_height(v_actualIndex);
		 tmp_x = tmp_tx + 44 * v_tooltipAlpha;
		 tmp_y = tmp_ty;

		 fnt(fntPixelTiny);
		clr(-1, min(tmp_alpha, v_tooltipAlpha / 2, v_craftAlpha));
		draw_roundrect_ext(tmp_x - 8, tmp_y, tmp_x + 8 + tmp_xo2, tmp_y + 4 + tmp_yo2, 0, 0, false);
		clr(-1, min(tmp_alpha, v_tooltipAlpha / 3, v_craftAlpha));
		
		t1 = string_replace(tmp_infoText, "#", "\n");
		t2 = string_replace(tmp_infoText, "#", "\n");
		
		draw_roundrect_ext(tmp_x - 8, tmp_y + 4 + tmp_yo2, tmp_x + 8 + tmp_xo2, tmp_y + 4 + tmp_yo2 + string_height(t1) + string_height(t2) + 12, 0, 0, false);

		clr(-1, min(tmp_alpha, v_tooltipAlpha, v_craftAlpha));
		draw_text_colored(tmp_x, tmp_y + 3, _sc(v_actualIndex, tmp_color), -1, fntPixel);
		ghj = string_height(libUtilityParseTextColored(v_actualIndex, fntPixel));

		alg();
		draw_text_colored(tmp_x, tmp_y + 6 + ghj, tmp_infoText + v_midText, -1, fntPixelTiny);
		clr();
	}	
}

ds_list_destroy(tmp_list);
ds_list_destroy(tmp_list2);