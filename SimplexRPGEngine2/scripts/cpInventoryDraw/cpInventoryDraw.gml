/// @function cpInventoryDraw()
/// @desc Renders inventory to the screen

x = oCamera.v_nullPosX;
y = oCamera.v_nullPosY;

// **** DEBUG

if (mouse_check_button_pressed(mb_middle) || key_check_pressed(ord("M"))) {cpContainerAdd(oItem1, 2, id);}
if (mouse_wheel_down()) {v_slotsPerRow++;}
if (mouse_wheel_up()) {v_slotOffsetY++;}
if (keyboard_check_pressed(ord("F"))) {t = !t}
v_slotOffsetX = clamp(v_slotOffsetX, 0, 48);
//v_slotOffsetY = clamp(v_slotOffsetY, 0, 12);

t = (v_filterButtons[0, 0] || v_filterButtons[1, 0]) && !v_changingForm;

var tmp_preview;
tmp_preview = false;

if (v_drawPreview || v_previewAlpha > 0.05) {tmp_preview = true;}

if (t) { hj = lerp(hj, 256 + tmp_preview * 196, 0.1);  yj = lerp(yj, max(5 * (v_slotSize + v_slotOffsetY) - v_slotRows * (v_slotSize + v_slotOffsetY) + (v_slotSize / 2) * 3, 0), 0.1);}
else {v_slotOffsetX = lerp(v_slotOffsetX, 6, 0.1); v_slotOffsetY = lerp(v_slotOffsetY, 6, 0.1); hj = lerp(hj, 0, 0.1); yj = lerp(yj, 0, 0.1); if (hj < 5) {hj = lin(hj, 0, 1);} if (hj < 1) {hj = 0; v_changingForm = false; v_formExtMode = v_formExtModeStack;}}

if (u) {v_slotSize = lerp(v_slotSize, 48, 0.1);}
else {v_slotSize = lerp(v_slotSize, 32, 0.1);}

if (!v_drawForm) {v_formAlpha = lerp(v_formAlpha, 0, 0.1); v_actualY = lerp(v_actualY, 0, 0.1);}
else {v_formAlpha = lerp(v_formAlpha, 1, 0.5); v_actualY = lerp(v_actualY, 69, 0.1);}


// **** /DEBUG

v_drawStartX = x + v_actualY - 68;
v_drawStartY = y + 68;
v_slotRows = ceil(min(v_slots, v_slotsPerPage) / v_slotsPerRow) + v_expandSlotsY;

var tmp_drawX, tmp_drawY, tmp_slotsRenderedNow;
tmp_drawX = v_drawStartX;
tmp_drawY = v_drawStartY;
tmp_slotsRenderedNow = 0;

// Draw base layout
// - need to compute its size

var tmp_layoutWidth, tmp_layoutHeight;
tmp_layoutWidth = min(v_slots, v_slotsPerRow) * (v_slotSize + v_slotOffsetX) + hj;
tmp_layoutHeight = max(v_slotRows * (v_slotSize + v_slotOffsetY), 0) + yj;

draw_text(oPlayer.x, oPlayer.y + 100, v_slotRows);
draw_text(oPlayer.x, oPlayer.y + 120, tmp_layoutHeight / 32);

var tmp_layoutSlotsX, tmp_layoutSlotsY;
tmp_layoutSlotsX = (tmp_layoutWidth div (v_slotSize)) + 1;
tmp_layoutSlotsY = (tmp_layoutHeight div (v_slotSize)) + 1;

v_layoutSlotsX = tmp_layoutSlotsX;
v_layoutSlotsY = tmp_layoutSlotsY;

var tmp_layoutRestX, tmp_layoutRestY;
tmp_layoutRestX = tmp_layoutWidth - (tmp_layoutSlotsX - 1) * v_slotSize;
tmp_layoutRestY = tmp_layoutHeight - (tmp_layoutSlotsY - 1) * v_slotSize;

v_layoutRestX = tmp_layoutRestX;
v_layoutRestY = tmp_layoutRestY;

v_layoutEndX = tmp_drawX + tmp_layoutWidth + v_slotSize - v_frameBorder + 1;

if (v_formAlpha > 0.05)
{
	clr(c_black, v_formAlpha);

	if (point_in_rectangle(mouse_x, mouse_y, tmp_drawX + v_frameBorder, tmp_drawY + v_frameBorder, tmp_drawX + tmp_layoutWidth + v_slotSize - v_frameBorder + 1, tmp_drawY + tmp_layoutHeight - (v_frameBorder - 1)))
	{
		oHUD.v_mouseClickedUI = true;
	}

	draw_sprite_tiled_area(v_inventoryTexSprite, 0, 0, 0, tmp_drawX + v_frameBorder, tmp_drawY + v_frameBorder, tmp_drawX + tmp_layoutWidth + v_slotSize - v_frameBorder + 1, tmp_drawY + tmp_layoutHeight - (v_frameBorder - 1));

	for (var i = 0; i < tmp_layoutSlotsY; i++)
	{
		for (var j = 0; j < tmp_layoutSlotsX + 1; j++)
		{
			// Draw form layout
			//	- Top row
			//  - Middle rows
			//	- Bottom row
			if (i == 0)
			{
				if (j == 0) {draw_sprite_part_ext(v_inventorySprite, 0, oHUD.v_hudFrameTopX, oHUD.v_hudFrameTopY, 32, 32, tmp_drawX, tmp_drawY, 1, 1, c_white, v_formAlpha);}
				else if (j == tmp_layoutSlotsX - 1) {draw_sprite_part_ext(v_inventorySprite, 0, oHUD.v_hudFrameTopX + 32, oHUD.v_hudFrameTopY, tmp_layoutWidth - (tmp_layoutSlotsX - 1) * v_slotSize, 32, tmp_drawX, tmp_drawY, 1, 1, c_white, v_formAlpha);}
				else if (j == tmp_layoutSlotsX) {draw_sprite_part_ext(v_inventorySprite, 0, oHUD.v_hudFrameTopX + 64, oHUD.v_hudFrameTopY, 32, 32, tmp_drawX, tmp_drawY, 1, 1, c_white, v_formAlpha);}
				else {draw_sprite_part_ext(v_inventorySprite, 0, oHUD.v_hudFrameTopX + 32, oHUD.v_hudFrameTopY, 32, 32, tmp_drawX, tmp_drawY, 1, 1, c_white, v_formAlpha);}
			}
			else if (i == tmp_layoutSlotsY - 1)
			{
				if (j == 0) {draw_sprite_part_ext(v_inventorySprite, 0, oHUD.v_hudFrameBottomX, oHUD.v_hudFrameBottomY, 32, 32, tmp_drawX, tmp_drawY, 1, 1, c_white, v_formAlpha);}
				else if (j == tmp_layoutSlotsX) {draw_sprite_part_ext(v_inventorySprite, 0, oHUD.v_hudFrameBottomX + 64, oHUD.v_hudFrameBottomY, 32, 32, tmp_drawX, tmp_drawY, 1, 1, c_white, v_formAlpha);}
				else if (j == tmp_layoutSlotsX - 1) {draw_sprite_part_ext(v_inventorySprite, 0, oHUD.v_hudFrameBottomX + 32, oHUD.v_hudFrameBottomY, tmp_layoutRestX, 32, tmp_drawX, tmp_drawY, 1, 1, c_white, v_formAlpha);}
				else {draw_sprite_part_ext(v_inventorySprite, 0, oHUD.v_hudFrameBottomX + 32, oHUD.v_hudFrameBottomY, 32, 32, tmp_drawX, tmp_drawY, 1, 1, c_white, v_formAlpha); }		
			}	
			else if (i == tmp_layoutSlotsY - 2)
			{
				if (j == 0) {draw_sprite_part_ext(v_inventorySprite, 0, oHUD.v_hudFrameMidX, oHUD.v_hudFrameMidY, 32, tmp_layoutRestY, tmp_drawX, tmp_drawY, 1, 1, c_white, v_formAlpha);}
				else if (j == tmp_layoutSlotsX) {draw_sprite_part_ext(v_inventorySprite, 0, oHUD.v_hudFrameMidX + 64, oHUD.v_hudFrameMidY, 32, tmp_layoutRestY, tmp_drawX, tmp_drawY, 1, 1, c_white, v_formAlpha);}		
			}		
			else
			{
				if (j == 0) {draw_sprite_part_ext(v_inventorySprite, 0, oHUD.v_hudFrameMidX, oHUD.v_hudFrameMidY, 32, 32, tmp_drawX, tmp_drawY, 1, 1, c_white, v_formAlpha);}
				else if (j == tmp_layoutSlotsX) {draw_sprite_part_ext(v_inventorySprite, 0, oHUD.v_hudFrameMidX + 64, oHUD.v_hudFrameMidY, 32, 32, tmp_drawX, tmp_drawY, 1, 1, c_white, v_formAlpha);}		
			}	
					
			if (j != tmp_layoutSlotsX - 1) {tmp_drawX += v_slotSize;} else {tmp_drawX += tmp_layoutWidth - (tmp_layoutSlotsX - 1) * v_slotSize;}
		}	
	
		if (i != tmp_layoutSlotsY - 2) {tmp_drawY += v_slotSize;} else {tmp_drawY += tmp_layoutRestY;}
		tmp_drawX = v_drawStartX;
	}

	v_formEndX = tmp_drawX;
	v_formEndY = tmp_drawY;

	var tmp_currentRow, tmp_hovered, tmp_maxX;
	tmp_currentRow = 0;
	tmp_lastHover = -1;
	tmp_hovered = false;

	tmp_drawX = v_drawStartX + (v_slotSize / 2);
	tmp_drawY = v_drawStartY + (v_slotSize);
	tmp_slotsRenderedNow = 0;

	for (var i = 0; i < min(v_slots, v_slotsPerPage); i++)
	{	
		// Draw slots
		//	- need to keep track of current row
		//  - we need to check for hover before draving
		var tmp_hover, tmp_offsetHelp, tmp_realSlotArea;
		tmp_hover = false;
		tmp_offsetHelp = oHUD.v_hudSlotX;
		tmp_realSlotArea = v_slotSize + 4;
	
		// Check for hover
		if (point_in_rectangle(mouse_x, mouse_y, tmp_drawX, tmp_drawY, tmp_drawX + tmp_realSlotArea, tmp_drawY + tmp_realSlotArea))
		{
			if (v_menuItem == -1)
			{
				tmp_hover = true;
				tmp_offsetHelp = oHUD.v_hudSlotUseX;
				tmp_lastHover = i;
				if (v_slot[i, e_inventoryAtributes.valID] != e_items.valNONE) {tmp_hovered = true; v_lastHover = tmp_lastHover;}
			}
			
			if (mouse_check_button_pressed(mb_right) && v_slot[i, e_inventoryAtributes.valID] != e_items.valNONE && !v_slot[i, e_inventoryAtributes.valBeingUsed])
			{
				v_menuItem = i;
				v_menuItemStartX = tmp_drawX;
				v_menuItemStartY = tmp_drawY;
			}
		}
		
		if (v_menuItem == i)
		{
			v_menuItemStartX = tmp_drawX;
			v_menuItemStartY = tmp_drawY;
			tmp_lastHover = i;
			v_lastHover = tmp_lastHover;
			tmp_hover = true;
			tmp_offsetHelp = oHUD.v_hudSlotUseX;
			tmp_hovered = true;
		}
	
		cpInventoryHelperHandleInput(id, i, tmp_hover);
				
		if (tmp_currentRow == 0)
		{
			if (tmp_slotsRenderedNow == 0)
			{
				draw_sprite_part(v_inventorySprite, 0, tmp_offsetHelp, oHUD.v_hudSlotY, 38, 38, tmp_drawX, tmp_drawY);
			}
			else if (tmp_slotsRenderedNow == v_slotsPerRow - 1)
			{
				draw_sprite_part(v_inventorySprite, 0, tmp_offsetHelp + 76, oHUD.v_hudSlotY, 38, 38, tmp_drawX, tmp_drawY);		
			}
			else
			{
				draw_sprite_part(v_inventorySprite, 0, tmp_offsetHelp + 38, oHUD.v_hudSlotY, 38, 38, tmp_drawX, tmp_drawY);
			}
		}
		else if (tmp_currentRow == (v_slotRows - v_expandSlotsY - 1))
		{
			if (tmp_slotsRenderedNow == 0)
			{
				draw_sprite_part(v_inventorySprite, 0, tmp_offsetHelp, oHUD.v_hudSlotY + 76, 38, 38, tmp_drawX, tmp_drawY);
			}
			else if (tmp_slotsRenderedNow == v_slotsPerRow - 1)
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
			else if (tmp_slotsRenderedNow == v_slotsPerRow - 1)
			{
				draw_sprite_part(v_inventorySprite, 0, tmp_offsetHelp + 76, oHUD.v_hudSlotY + 38, 38, 38, tmp_drawX, tmp_drawY);		
			}
			else
			{
				draw_sprite_part(v_inventorySprite, 0, tmp_offsetHelp + 38, oHUD.v_hudSlotY + 38, 38, 38, tmp_drawX, tmp_drawY);
			}
		}
	
		// Draw item
		if (v_slot[i, e_inventoryAtributes.valID] != 0 && v_slotBeingDragged != i)
		{
	
			// Apply shader if needed
			if (v_slot[i, e_inventoryAtributes.valLerpColor] != 0)
			{
				shader_set(shdLerp);
				var tmp_uID = shader_get_uniform(shdLerp, "f_Colour1");
				shader_set_uniform_f(tmp_uID, color_get_red(v_slot[i, e_inventoryAtributes.valLerpColor]) / 255, color_get_green(v_slot[i, e_inventoryAtributes.valLerpColor]) / 255, color_get_blue(v_slot[i, e_inventoryAtributes.valLerpColor]) / 255, v_actualLerp);
			}
			draw_sprite_ext(v_slot[i, e_inventoryAtributes.valSprite], v_slot[i, e_inventoryAtributes.valImageIndex] + 2, tmp_drawX + (v_slotSize / 2) + (tmp_realSlotArea - v_slotSize) / 2, tmp_drawY + (v_slotSize / 2) + (tmp_realSlotArea - v_slotSize) / 2, 1, 1, 0, c_white, v_formAlpha);	
			shader_reset();
			
			// Draw star / trash icon
			if (v_slot[i, e_inventoryAtributes.valLabel] == 1)
			{
				draw_sprite_part_ext(v_inventorySprite, 0, 605, 455, 20, 20, tmp_drawX + 24, tmp_drawY + 5, 0.5, 0.5, c_white, draw_get_alpha());
			}

			if (v_slot[i, e_inventoryAtributes.valLabel] == 2)
			{
				draw_sprite_part_ext(v_inventorySprite, 0, 628, 455, 20, 20, tmp_drawX + 24, tmp_drawY + 5, 0.5, 0.5, c_white, draw_get_alpha());
			}	

			var tmp_drawColor, tmp_drawOffsetX;
			tmp_drawColor = c_white;
			tmp_drawOffsetX = 0; 
		
			if (v_slot[i, e_inventoryAtributes.valStackable])
			{
				if (v_slot[i, e_inventoryAtributes.valCurrentStackSize] == v_slot[i, e_inventoryAtributes.valMaxStackSize]) 
				{
					tmp_drawColor = c_yellow;
				}
			
				if (v_slot[i, e_inventoryAtributes.valCurrentStackSize] >= 1000)
				{
					tmp_drawOffsetX = 12;
				}			
				else if (v_slot[i, e_inventoryAtributes.valCurrentStackSize] >= 100)
				{
					tmp_drawOffsetX = 8;
				}
				else if (v_slot[i, e_inventoryAtributes.valCurrentStackSize] >= 10)
				{
					tmp_drawOffsetX = 4;
				}
			
				fnt(fntPixelSmall);
				clr(tmp_drawColor, v_formAlpha);
				draw_text(tmp_drawX + (v_slotSize / 2) - tmp_drawOffsetX + 6, tmp_drawY + v_slotSize - 10, string(v_slot[i, e_inventoryAtributes.valCurrentStackSize]));
				clr(c_black, v_formAlpha);
			}
			
			if (v_slot[i, e_inventoryAtributes.valBeingUsed])
			{
				clr(c_black, v_formAlpha / 3);
				draw_rectangle(tmp_drawX + 2, tmp_drawY + 2, tmp_drawX + 38, tmp_drawY + 38, false);
				clr(c_black, v_formAlpha);
			}
		}
	
		tmp_slotsRenderedNow++;
		if (tmp_slotsRenderedNow >= v_slotsPerRow)
		{
			v_formBaseMaxX = tmp_drawX;
		
			tmp_maxX = tmp_drawX - v_drawStartX;
			tmp_drawX = v_drawStartX + (v_slotSize / 2);
			tmp_drawY += (v_slotSize + v_slotOffsetY);
			tmp_slotsRenderedNow = 0;
			tmp_currentRow++;
		}
		else
		{
			tmp_drawX += (v_slotSize + v_slotOffsetX);
		}
	}

	// Draw title
	alg("center")
	fnt(fntPixelBig);
	clr(-1, v_formAlpha);
	draw_text((tmp_maxX / 2) + v_drawStartX + v_slotSize, v_drawStartY + 16, __("Inventory"));
	fnt();
	alg();
	
	// Check for item release
	if (v_slotBeingDragged != -1)
	{
		if (mouse_check_button_released(mb_left) && !v_customDropItem)
		{
			// If we hover over any item switch them
			if (tmp_lastHover != -1)
			{
				var tmp_switchDone, tmp_itemsSwitched;
				tmp_switchDone = true;
				tmp_itemsSwitched = 0;
				oHUD.v_mouseClickedUI = true;
			
				// We try to join item slots if they have the same id and are stackable
				if (v_slot[tmp_lastHover, e_inventoryAtributes.valID] == v_slot[v_slotBeingDragged, e_inventoryAtributes.valID] && v_slot[tmp_lastHover, e_inventoryAtributes.valStackable] && v_slot[v_slotBeingDragged, e_inventoryAtributes.valStackable])
				{			
					repeat(v_slot[v_slotBeingDragged, e_inventoryAtributes.valCurrentStackSize])
					{
						if (v_slot[tmp_lastHover, e_inventoryAtributes.valCurrentStackSize] < v_slot[tmp_lastHover, e_inventoryAtributes.valMaxStackSize])
						{
							v_slot[tmp_lastHover, e_inventoryAtributes.valCurrentStackSize]++;
							v_slot[v_slotBeingDragged, e_inventoryAtributes.valCurrentStackSize]--;
							tmp_itemsSwitched++;
						
							if (v_slot[v_slotBeingDragged, e_inventoryAtributes.valCurrentStackSize] <= 0)
							{
								cpInventoryHelperClearSlot(v_slotBeingDragged);
								oHUD.v_mouseFree = true;
								break;
							}
						}
						else
						{
							tmp_switchDone = false;
						}
					}
				}
				else
				{
					tmp_switchDone = false;
				}
			
				if (!tmp_switchDone && tmp_itemsSwitched == 0)
				{
					cpInventoryHelperSwitch(id, id, v_slotBeingDragged, tmp_lastHover);
				}	
			}
		
			// Check for drop in chest
			if (v_containerID != -1)
			{
				var tmp_switchDone, tmp_itemsSwitched;
				tmp_switchDone = true;
				tmp_itemsSwitched = 0;
			
				// We try to join item slots if they have the same id and are stackable
				if (v_containerID.v_slot[v_containerID.tmp_lastHover, e_inventoryAtributes.valID] == v_slot[v_slotBeingDragged, e_inventoryAtributes.valID] && v_containerID.v_slot[v_containerID.tmp_lastHover, e_inventoryAtributes.valStackable] && v_slot[v_slotBeingDragged, e_inventoryAtributes.valStackable])
				{			
					repeat(v_slot[v_slotBeingDragged, e_inventoryAtributes.valCurrentStackSize])
					{
						if (v_containerID.v_slot[v_containerID.tmp_lastHover, e_inventoryAtributes.valCurrentStackSize] < v_containerID.v_slot[v_containerID.tmp_lastHover, e_inventoryAtributes.valMaxStackSize])
						{
							v_containerID.v_slot[v_containerID.tmp_lastHover, e_inventoryAtributes.valCurrentStackSize]++;
							v_slot[v_slotBeingDragged, e_inventoryAtributes.valCurrentStackSize]--;
							tmp_itemsSwitched++;
						
							if (v_slot[v_slotBeingDragged, e_inventoryAtributes.valCurrentStackSize] <= 0)
							{
								cpInventoryHelperClearSlot(v_slotBeingDragged);
								oHUD.v_mouseFree = true;
								break;
							}
						}
						else
						{
							tmp_switchDone = false;
						}
					}
				}
				else
				{
					tmp_switchDone = false;
				}
			
				if (!tmp_switchDone && tmp_itemsSwitched == 0)
				{
					cpInventoryHelperSwitch(id, v_containerID, v_slotBeingDragged, v_containerID.tmp_lastHover);
				}	
			}
		
			if (v_hoverContainerForm == "equipment")
			{
				if (v_slot[v_slotBeingDragged, e_inventoryAtributes.valEquipSlot] == v_equipmentSlots[v_equipmentLastHover, 2])
				{
					cpEquipmentEquip();			
				}
			}
			v_slotBeingDragged = -1;
			oHUD.v_mouseFree = true;
		}
	}

	// Draw item in mouse
	if (v_itemMouse != -1)
	{
		draw_sprite_ext(v_slot[v_itemMouse, e_inventoryAtributes.valSprite], v_slot[v_itemMouse, e_inventoryAtributes.valImageIndex] + 2, mouse_x, mouse_y, 1, 1, 0, c_white, v_formAlpha);

		if (v_splitRemainning > 1)
		{
			clr(c_white);
			draw_text(mouse_x, mouse_y + 8, string(v_splitRemainning));
		}
	}

	// Draw dragged item
	if (v_slotBeingDragged != -1)
	{
		oDrawHelperAbove.v_id = id;
		oDrawHelperAbove.v_mode = 2;
	}
	
	draw_text(mouse_x + 32, mouse_y, string(oHUD.v_mouseFree));

	// [EXTRA] Draw pagination
	var tmp_buttonOffsetX;
	tmp_buttonOffsetX = 0;
	tmp_drawX = v_drawStartX + v_slotSize / 2;
	tmp_drawY = tmp_layoutHeight - v_slotOffsetY - v_frameBorder - 1 - (v_slotSize / 2) * 3 + v_drawStartY + 16;

	for (var i = 0; i < 3; i++)
	{
		var tmp_helpY;
		tmp_helpY =  oHUD.v_hudButtonY;
	
		if (v_filterButtons[i, 0])
		{
			tmp_helpY = oHUD.v_hudButtonPressedY;
		}
	
		draw_sprite_part_ext(v_inventorySprite, 0, oHUD.v_hudButtonX + (25) * i, tmp_helpY, 25, 24, tmp_drawX + (24 + tmp_buttonOffsetX) * i, tmp_drawY, 1, 1, c_white, v_formAlpha);

		if (point_in_rectangle(mouse_x, mouse_y, tmp_drawX + (24 + tmp_buttonOffsetX) * i, tmp_drawY, tmp_drawX + (23 + tmp_buttonOffsetX) * (i + 1), tmp_drawY + 24))
		{
			if (mouse_check_button_pressed(mb_left) && v_menuItem == -1)
			{
				v_filterButtons[i, 0] = !v_filterButtons[i, 0];
				oHUD.v_mouseClickedUI = true;
				
				if (i == 0) {v_formExtModeStack = "equipment";}
				if (i == 1) {v_formExtModeStack = "crafting";}		
				
				v_changingForm = true;	
				
				for (var j = 0; j < 3; j++)
				{
					if (j != i) {v_filterButtons[j, 0] = false;}
				}
			}
		}
	}

	// Compute inventory total weight
	var tmp_weight;
	tmp_weight = cpInventoryHelperGetTotalAtr();

	if (tmp_weight > 0)
	{
		fnt(fntPixelSmall);
		draw_text(tmp_drawX + 3 * 24 + 4, tmp_drawY, "Weight: " + string(tmp_weight));
	}

	// Compute hover alpha
	// v_hoverAlphaFF (flicker fix) is used to eliminate flickering when changing focus
	if (tmp_hovered) {v_hoverAlpha = lerp(v_hoverAlpha, 1, 0.1); v_hoverAlphaFF = 3;}
	else {if (v_hoverAlphaFF > 0) {v_hoverAlphaFF--;} else {v_hoverAlpha = lerp(v_hoverAlpha, 0, 0.1);}}

	// Draw infobox
	cpInventoryHelperDrawInfobox();
	v_containerID = -1;

	// Draw second active form
	if (hj > 196 && t)
	{
		v_formExtAlpha = lerp(v_formExtAlpha, 1, 0.1);
	}

	if (!t)
	{
		v_formExtAlpha = lerp(v_formExtAlpha, 0, 0.4);
	}

	if (v_formExtAlpha > 0.05)
	{		
		if (v_formExtMode == "equipment")
		{
			clr(-1, min(v_formExtAlpha, v_formAlpha));
			draw_sprite(texEquipmentForm, 0, v_formBaseMaxX + (v_slotSize / 2) * 3, v_drawStartY + v_slotSize);
		
			cpEquipmentDraw();
		
			alg("center")
			fnt(fntPixelBig);
			clr(-1, min(v_formAlpha, v_formExtAlpha));
			draw_text(v_formBaseMaxX + (v_slotOffsetX * v_slotsPerRow) / 2 + (v_slotSize * 3) + v_formExtAlpha * (v_slotSize / 2), v_drawStartY + 16, __("Equipment"));
			fnt();
			alg();
		}
		
		if (v_formExtMode == "crafting")
		{
			v_lastX = tmp_drawX;
			v_lastY = tmp_drawY;
			cpCraftingDraw();
		}
	}

	clr();

	if (v_lerpMode == 0) {v_actualLerp = lin(v_actualLerp, 0.5, 0.005); if (v_actualLerp >= 0.5) {v_lerpMode = 1;}}
	if (v_lerpMode == 1) {v_actualLerp = lin(v_actualLerp, 0, 0.005); if (v_actualLerp <= 0) {v_lerpMode = 0;}}
}

	// Draw context menu form
	if (v_menuItem != -1)
	{
		ds_list_clear(g_menuList);
		
		// Build main rectangle
		fnt(fntPixelSmall);
		
		var tmp_localMax, tmp_height, tmp_realOptions, tmp_i, tmp_optionsCount;
		tmp_localMax = 128;
		tmp_height = 0;
		tmp_i = 0;
		//tmp_realOptions[0] = "";
		tmp_optionsCount = 0;
		
		for (var i = 0; i < 16; i++)
		{
			if (v_itemOptions[v_menuItem, i] != "") {tmp_realOptions[tmp_i] = v_itemOptions[v_menuItem, i]; tmp_i++; tmp_optionsCount++;}
		}		
		
		for (var i = 0; i < tmp_optionsCount + 2; i++)
		{
			if (i < tmp_optionsCount)
			{
				fnt();
				if (string_width(tmp_realOptions[i]) > tmp_localMax) 
				{
					tmp_localMax = string_width(tmp_realOptions[i]) + 16;
				}
			}
			
			tmp_height += 20;
		}
		
		tmp_height = max(60, tmp_height + 20);
		
		var tmp_width, tmp_height, tmp_secondMenu, tmp_secondMenuX, tmp_secondMenuY, tmp_secondMenuW, tmp_secondMenuH;

		
		ds_list_add(g_menuList, v_menuItemStartX + 20, v_menuItemStartY + 20, v_menuItemStartX + tmp_localMax + 20, v_menuItemStartY + tmp_height + 20); // Main menu rec
		ds_list_add(g_menuList, v_menuItemStartX, v_menuItemStartY, v_menuItemStartX + 40, v_menuItemStartY + 40); // Item rec
		if (v_secondMenu != -1) {ds_list_add(g_menuList, v_secondMenuX, v_secondMenuY, v_secondMenuX + v_secondMenuW, v_secondMenuY + v_secondMenuH);}
		
		var tmp_mouseRec;
		tmp_mouseRec = -1;
		
		for (var i = 0; i < ds_list_size(g_menuList); i += 4)
		{
			if (point_in_rectangle(mouse_x, mouse_y, g_menuList[| i], g_menuList[| i + 1], g_menuList[| i + 2] + 20, g_menuList[| i + 3]))
			{
				tmp_mouseRec = i;
				oHUD.v_mouseClickedUI = true;
			}
		}
		
		if (tmp_mouseRec == -1)
		{
			v_menuItem = -1;
			v_secondMenuLast = -1;
		}
		else
		{
			//draw_rectangle(g_menuList[| 0], g_menuList[| 1], g_menuList[| 2], g_menuList[| 3], false);
			tmp_width = (tmp_localMax div 20 * 20) + 20;
			tmp_height = (tmp_height);
			
			draw_sprite_tiled_area(v_inventoryTexSprite, 0, 0, 0, g_menuList[| 0], g_menuList[| 1] + 2, g_menuList[| 0] + tmp_width - 4, g_menuList[| 1] + tmp_height);
			
			var tmp_pass, var_ys;
			tmp_pass = false;
			var_ys = 0;
			
			for (var i = 0; i < tmp_optionsCount + 2; i++)
			{	
				fnt();

				if (i < tmp_optionsCount) {tmp_text = tmp_realOptions[i];}
				else if (i == tmp_optionsCount) {tmp_text = "Mark";}
				else if (i == tmp_optionsCount + 1) {tmp_text = "Drop";}
				
				draw_text(g_menuList[| 0] + 8, g_menuList[| 1] + i * 20 + 8, tmp_text);
				
				if (point_in_rectangle(mouse_x, mouse_y, g_menuList[| 0], g_menuList[| 1] + i * 20 + 8, g_menuList[| 0] + tmp_width div 20 * 20, g_menuList[| 1] + i * 20 + 8 + 19) || (v_secondMenuLast == i && tmp_mouseRec == 8))
				{
					clr(c_black, min(v_formAlpha, 0.3));
					var tmp_xo;
					tmp_xo = 8;
					if (i == 0) {tmp_xo = 3;}
					
					draw_rectangle(g_menuList[| 0] + 2, g_menuList[| 1] + i * 20 + tmp_xo, g_menuList[| 0] + tmp_width - 4, g_menuList[| 1] + i * 20 + 8 + 20, false);
					clr(-1, v_formAlpha);
					
					if (i == tmp_optionsCount || tmp_mouseRec == 8)
					{
						v_secondMenu = i;
						v_secondMenuX = g_menuList[| 0] + tmp_width;
						v_secondMenuY = g_menuList[| 1] + (i) * 20 + 8;
						v_secondMenuW = 120;
						v_secondMenuH = 80;
						v_secondMenuLast = i;
						tmp_pass = true;
					}
					

					if (mouse_check_button_pressed(mb_left))
					{
						if (i < tmp_optionsCount)
						{
							cpItemsOptionsDB(v_slot[v_menuItem, e_inventoryAtributes.valID], i);
						}
						
						if (i == tmp_optionsCount + 1)
						{
							cpInventoryDropSlot(v_menuItem);
							v_menuItem = -1;
						}
					}
					
				}
			}
			
			if (tmp_mouseRec == 8)
			{
				v_secondMenuX = g_menuList[| 0] + tmp_width;
				v_secondMenuY = g_menuList[| 1] + v_secondMenu * 20 + 8;
				v_secondMenuW = 120;
				v_secondMenuH = 80;
				tmp_pass = true;
			}
			
			if (!tmp_pass) {v_secondMenu = -1; v_secondMenuLast = -1;}
		
						
			for (var j = 0; j < tmp_height div 20; j++)
			{
				var tmp_top;
				tmp_top = 40;

				if (j == 0) {tmp_top = 40;}
				else if (j == tmp_height div 20 - 1) {tmp_top = 84;}
				else {tmp_top = 60;}			
					
				for (var i = 0; i < tmp_width div 20; i++)
				{
					var tmp_left;
					tmp_left = 16;
				
					if (i == 0) {tmp_left = 16;}
					else if (i == tmp_width div 20 - 1) {tmp_left = 94;}
					else {tmp_left = 60;}
				
					draw_sprite_part(v_inventorySprite, 0, tmp_left, tmp_top, 20, 20, g_menuList[| 0] + i * 20, g_menuList[| 1] + j * 20);
				}
			}
			
			if (v_secondMenu != -1)
			{
				draw_sprite_tiled_area(v_inventoryTexSprite, 0, 0, 0, v_secondMenuX + 2, v_secondMenuY + 2, v_secondMenuX + v_secondMenuW - 4, v_secondMenuY + v_secondMenuH);

				for (var i = 0; i < 3; i++)
				{	
					fnt();
				
					draw_text(v_secondMenuX + 8, v_secondMenuY + i * 20 + 8, v_secondMenuText[i]);
				
					if (point_in_rectangle(mouse_x, mouse_y, v_secondMenuX, v_secondMenuY + i * 20 + 8, v_secondMenuX + v_secondMenuW div 20 * 20, v_secondMenuY + i * 20 + 8 + 19))
					{
						clr(c_black, min(v_formAlpha, 0.3));
						var tmp_xo;
						tmp_xo = 8;
						if (i == 0) {tmp_xo = 3;}
					
						draw_rectangle(v_secondMenuX + 2, v_secondMenuY + i * 20 + tmp_xo, v_secondMenuX + v_secondMenuW - 4, v_secondMenuY + i * 20 + 8 + 20, false);
						clr(-1, v_formAlpha);
						
						if (mouse_check_button_pressed(mb_left))
						{
							if (i == 0) {v_slot[v_menuItem, e_inventoryAtributes.valLabel] = 1;}
							if (i == 1) {v_slot[v_menuItem, e_inventoryAtributes.valLabel] = 2;}
							if (i == 2) {v_slot[v_menuItem, e_inventoryAtributes.valLabel] = 0;}							
						}
					}
				}
				
				for (var j = 0; j < v_secondMenuH div 20; j++)
				{
					var tmp_top;
					tmp_top = 40;

					if (j == 0) {tmp_top = 40;}
					else if (j == v_secondMenuH div 20 - 1) {tmp_top = 84;}
					else {tmp_top = 60;}			
					
					for (var i = 0; i < v_secondMenuW div 20; i++)
					{
						var tmp_left;
						tmp_left = 16;
				
						if (i == 0) {tmp_left = 16;}
						else if (i == v_secondMenuW div 20 - 1) {tmp_left = 94;}
						else {tmp_left = 60;}
				
						draw_sprite_part(v_inventorySprite, 0, tmp_left, tmp_top, 20, 20, v_secondMenuX + i * 20, v_secondMenuY + j * 20);
					}
				}
			}	
		}
	}


if (key_check_pressed(ord("G")))  {v_filterButtons[1] = ! v_filterButtons[1];}
if (key_check_pressed(ord("I")))  {v_drawForm = !v_drawForm;}
tmp_secondMenu = false;