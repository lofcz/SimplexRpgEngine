
var tmp_list;
tmp_list = ds_list_create();
				
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
			if (v_selectedForm == -1) {v_selectedForm = i; v_selectedLastForm = v_selectedForm;}
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

if (v_subformAlpha <= 0.05 && v_craftItemSelected != -1 && v_selectedForm != -1 && v_craftingForms[v_selectedForm, 3] >= 30 * (v_selectedForm + 0.5) && v_craftWIP) {v_craftAlpha = lerp(v_craftAlpha, 1, 0.1);} else {v_craftAlpha = lerp(v_craftAlpha, 0, 0.1);}
draw_text(mouse_x + 256, mouse_y, v_craftAlpha);
// Item crafting

if (v_selectedLastForm == 0 && v_subformAlpha > 0.05)
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
		var tmp_recieptID;
		tmp_recieptID = -1;
		
		if (!v_searchActive) 
		{
			if (ds_list_size(g_itemsList) > i)
			{
				tmp_recieptID = g_itemsList[| i];
			}
		}
		else
		{
			for (var j = 0; j < ds_list_size(g_itemsList); j++)
			{
				if (string_count(v_searchText, v_recieptItem[g_itemsList[| j], 0]) && !ds_list_contains(tmp_list, g_itemsList[| j]))
				{
					// Selected right index to draw
					tmp_recieptID = g_itemsList[| j];
					ds_list_add(tmp_list, tmp_recieptID);
					break;
				}
			}
		}
		
		// Draw current reciept (for real)		
		if (tmp_recieptID != -1)
		{
			draw_text(tmp_drawX, tmp_drawY, v_recieptItem[tmp_recieptID, 0]);
		}
		
		// Check for hover and item selection
		if (point_in_rectangle(mouse_x, mouse_y, tmp_drawX, tmp_drawY, tmp_drawX + 38, tmp_drawY + 38))
		{
			if (mouse_check_button_pressed(mb_left))
			{
				v_craftItemSelected = tmp_recieptID;
				v_craftWIP = true;
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
		draw_sprite_part(v_inventorySprite, 0, 98, 106, 12, 12, tmp_sx + 115 - 12 - string_width(__("Search")) / 2, tmp_sy - 20);
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
	
	var tmp_lx, tmp_ly, tmp_ls, tmp_dx, tmp_dy, tmp_drawTooltip, tmp_tx, tmp_ty, tmp_flag;
	tmp_lx = tmp_sx;
	tmp_ly = tmp_sy;
	tmp_ls = 0;
	tmp_drawTooltip = -1;
	tmp_tx = 0;
	tmp_ty = 0;
	tmp_flag = false;
	tmp_customDrop = false;
	
	for (var i = 0; i < v_recieptItem[v_craftItemSelected, 2]; i++)
	{
		tmp_dx = 30;
		tmp_dy = 288;
		
		if (point_in_rectangle(mouse_x, mouse_y, tmp_lx, tmp_ly, tmp_lx + 40, tmp_ly + 40))
		{
			tmp_dy = 329;			
		}
	
		draw_sprite_part(v_inventorySprite, 0, tmp_dx, tmp_dy, 40, 40, tmp_lx, tmp_ly);
		
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
		}
		
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
	
	v_customDropItem = tmp_customDrop;
	
	if (tmp_flag) {v_tooltipAlpha = lerp(v_tooltipAlpha, 1, 0.1);} else {v_tooltipAlpha = 0;}
	
	for (var i = 0; i < v_recieptItem[v_craftItemSelected, 3]; i++)
	{
		draw_sprite_part(v_inventorySprite, 0, 30, 370, 40, 40, tmp_sx + (46 * 4), tmp_sy + (i * 46));
	}
	
	if (tmp_drawTooltip != -1)
	{
		// Check if we hold needed item
		
		v_actualIndex = v_recieptItemSlot[v_craftItemSelected, (6 * tmp_drawTooltip) + 3];
		//v_entireText = v_actualIndex + v_recieptItemSlot[v_craftItemSelected, (5 * tmp_drawTooltip) + 4];
		v_midText = libUtilityParseTextColored("#" + v_recieptItemSlot[v_craftItemSelected, (6 * tmp_drawTooltip) + 4]);
		v_entireText = libUtilityParseTextColored(v_actualIndex) + v_midText;
		
		tmp_textClean = libUtilityParseTextColored(v_entireText, fntPixel);
		
		if (v_recieptItemSlot[v_craftItemSelected, (6 * tmp_drawTooltip)] != -1)
		{
			tmp_infoText =  _sc("Requires: ") + libUtilityItemToString(v_recieptItemSlot[v_craftItemSelected, (6 * tmp_drawTooltip)]) + " x" + string(v_recieptItemSlot[v_craftItemSelected, (6 * tmp_drawTooltip) + 2]) + "#";
		}
		else
		{
			tmp_infoText = "";
		}

		 fnt(fntPixelTiny);
		 tmp_xo2 = string_width(v_entireText); 
		 tmp_yo2 = string_height(v_actualIndex);
		 tmp_x = tmp_tx + 44 * v_tooltipAlpha;
		 tmp_y = tmp_ty;

		clr(-1, min(tmp_alpha, v_tooltipAlpha / 2, v_craftAlpha));
		draw_roundrect_ext(tmp_x - 8, tmp_y, tmp_x + 8 + tmp_xo2, tmp_y + 4 + tmp_yo2, 0, 0, false);
		clr(-1, min(tmp_alpha, v_tooltipAlpha / 3, v_craftAlpha));
		draw_roundrect_ext(tmp_x - 8, tmp_y + 4 + tmp_yo2, tmp_x + 8 + tmp_xo2, tmp_y + 4 + tmp_yo2 + string_height(v_midText + tmp_infoText) + 32, 0, 0, false);

		clr(-1, min(tmp_alpha, v_tooltipAlpha, v_craftAlpha));
		draw_text_colored(tmp_x, tmp_y + 3, v_actualIndex, -1, fntPixel);
		ghj = string_height(libUtilityParseTextColored(v_actualIndex, fntPixel));

		alg();
		draw_text_colored(tmp_x, tmp_y + 3 + ghj, tmp_infoText + v_midText, -1, fntPixelTiny);
		clr();
	}	
}

ds_list_destroy(tmp_list);