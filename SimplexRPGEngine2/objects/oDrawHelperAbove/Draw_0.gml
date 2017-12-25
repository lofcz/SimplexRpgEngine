/// @desc [Simplex description line]

with(oChest)
{
	if (v_actionAlpha > 0.05)
	{
		libDrawTextStylized(x + 16, y - 16, _sc("E", c_yellow) + " - " + v_lastString, v_actionAlpha);
		
			if (v_fadeAlpha > 0.05)
	{		
		var tmp_drawX, tmp_drawY, tmp_currentRow, tmp_slotsRenderedNow, tmp_offsetHelp, tmp_actualSlot, tmp_hover, tmp_hovered;
		tmp_drawX = x + 16 - (((oInventory.v_slotSize + 6) * v_slotsPerRow) / 2);
		tmp_drawY = y - ((oInventory.v_slotSize + 6) * v_slotRows) - 32;
		tmp_currentRow = 0;
		tmp_slotsRenderedNow = 0;
		tmp_actualSlot = 0;
		tmp_lastHover = -1;	
		tmp_hovered = false;
		tmp_drawStartX = tmp_drawX;
		tmp_drawStartY = tmp_drawY;
	
		for (var i = 0; i < v_slots; i++)
		{
			clr(-1, min(v_fadeAlpha, v_actionAlpha));
				
			tmp_hover = false;
			tmp_offsetHelp = oHUD.v_hudSlotX;
				
			if (point_in_rectangle(mouse_x, mouse_y, tmp_drawX, tmp_drawY, tmp_drawX + 36, tmp_drawY + 36))
			{
				tmp_hover = true;
				tmp_offsetHelp = oHUD.v_hudSlotUseX;
				tmp_lastHover = tmp_actualSlot;
				if (v_slot[tmp_actualSlot, e_inventoryAtributes.valID] != e_items.valNONE) { v_lastHover = tmp_actualSlot; tmp_hovered = true;}
				if (oInventory.v_slotBeingDragged != -1) {oInventory.v_containerID = id;}
			}	
				
			cpInventoryHelperHandleInput(id, i, tmp_hover, "inventoryPick");
				
			if (tmp_currentRow == 0)
			{
				if (tmp_slotsRenderedNow == 0)
				{
					draw_sprite_part(oInventory.v_inventorySprite, 0, tmp_offsetHelp, oHUD.v_hudSlotY, 38, 38, tmp_drawX, tmp_drawY);
				}
				else if (tmp_slotsRenderedNow == v_slotsPerRow - 1)
				{
					draw_sprite_part(oInventory.v_inventorySprite, 0, tmp_offsetHelp + 76, oHUD.v_hudSlotY, 38, 38, tmp_drawX, tmp_drawY);		
				}
				else
				{
					draw_sprite_part(oInventory.v_inventorySprite, 0, tmp_offsetHelp + 38, oHUD.v_hudSlotY, 38, 38, tmp_drawX, tmp_drawY);
				}
			}
			else if (tmp_currentRow == (v_slotRows - 1))
			{
				if (tmp_slotsRenderedNow == 0)
				{
					draw_sprite_part(oInventory.v_inventorySprite, 0, tmp_offsetHelp, oHUD.v_hudSlotY + 76, 38, 38, tmp_drawX, tmp_drawY);
				}
				else if (tmp_slotsRenderedNow == v_slotsPerRow - 1)
				{
					draw_sprite_part(oInventory.v_inventorySprite, 0, tmp_offsetHelp + 76, oHUD.v_hudSlotY + 76, 38, 38, tmp_drawX, tmp_drawY);		
				}
				else
				{
					draw_sprite_part(oInventory.v_inventorySprite, 0, tmp_offsetHelp + 38, oHUD.v_hudSlotY + 76, 38, 38, tmp_drawX, tmp_drawY);
				}
			}
			else
			{
				if (tmp_slotsRenderedNow == 0)
				{
					draw_sprite_part(oInventory.v_inventorySprite, 0, tmp_offsetHelp, oHUD.v_hudSlotY + 38, 38, 38, tmp_drawX, tmp_drawY);
				}
				else if (tmp_slotsRenderedNow == v_slotsPerRow - 1)
				{
					draw_sprite_part(oInventory.v_inventorySprite, 0, tmp_offsetHelp + 76, oHUD.v_hudSlotY + 38, 38, 38, tmp_drawX, tmp_drawY);		
				}
				else
				{
					draw_sprite_part(oInventory.v_inventorySprite, 0, tmp_offsetHelp + 38, oHUD.v_hudSlotY + 38, 38, 38, tmp_drawX, tmp_drawY);
				}
			}		
				
			// Draw item
			if (v_slot[i, e_inventoryAtributes.valID] != 0 && v_slotBeingDragged != i)
			{		
				v_formAlpha = min(v_fadeAlpha, v_actionAlpha);
				cpInventoryHelperDrawItem(id, tmp_actualSlot, tmp_drawX, tmp_drawY);			
			}
			
			tmp_actualSlot++;		
			tmp_slotsRenderedNow++;
			if (tmp_slotsRenderedNow >= v_slotsPerRow)
			{
				tmp_drawX = x + 16 - (((oInventory.v_slotSize + 6) * v_slotsPerRow) / 2);
				tmp_drawY += oInventory.v_slotSize + 6;
				tmp_slotsRenderedNow = 0;
				tmp_currentRow++;
			}
			else
			{
				tmp_drawX += oInventory.v_slotSize + 6;
			}			
		}
		
		if (point_in_rectangle(mouse_x, mouse_y, tmp_drawStartX, tmp_drawStartY, tmp_drawStartX + (oInventory.v_slotSize + 6) * v_slotsPerRow, tmp_drawY))
		{
			oHUD.v_mouseClickedUI = true;
		}
		
		if (tmp_hovered) {v_hoverAlpha = lerp(v_hoverAlpha, 1, 0.1); v_hoverAlphaFF = 3;}
		else {if (v_hoverAlphaFF > 0) {v_hoverAlphaFF--;} else {v_hoverAlpha = lerp(v_hoverAlpha, 0, 0.1);}}
		
		if (v_hoverAlpha > 0)
		{
			v_formAlpha = min(v_fadeAlpha, v_actionAlpha);
			cpInventoryHelperDrawInfobox(id);
		}
		
		// Check for item release
		if (v_slotBeingDragged != -1)
		{
			if (mouse_check_button_released(mb_left))
			{
				// If we hover over any item switch them
				if (tmp_lastHover != -1)
				{
					var tmp_switchDone, tmp_itemsSwitched;
					tmp_switchDone = true;
					tmp_itemsSwitched = 0;
			
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
									cpInventoryHelperClearSlot(v_slotBeingDragged, id);
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
				
				if (oInventory.tmp_lastHover != -1)
				{
					var tmp_switchDone, tmp_itemsSwitched;
					tmp_switchDone = true;
					tmp_itemsSwitched = 0;
			
					// We try to join item slots if they have the same id and are stackable
					if (oInventory.v_slot[oInventory.tmp_lastHover, e_inventoryAtributes.valID] == v_slot[v_slotBeingDragged, e_inventoryAtributes.valID] && oInventory.v_slot[oInventory.tmp_lastHover, e_inventoryAtributes.valStackable] && v_slot[v_slotBeingDragged, e_inventoryAtributes.valStackable])
					{			
						repeat(v_slot[v_slotBeingDragged, e_inventoryAtributes.valCurrentStackSize])
						{
							if (oInventory.v_slot[oInventory.tmp_lastHover, e_inventoryAtributes.valCurrentStackSize] < oInventory.v_slot[oInventory.tmp_lastHover, e_inventoryAtributes.valMaxStackSize])
							{
								oInventory.v_slot[oInventory.tmp_lastHover, e_inventoryAtributes.valCurrentStackSize]++;
								v_slot[v_slotBeingDragged, e_inventoryAtributes.valCurrentStackSize]--;
								tmp_itemsSwitched++;
						
								if (v_slot[v_slotBeingDragged, e_inventoryAtributes.valCurrentStackSize] <= 0)
								{
									cpInventoryHelperClearSlot(v_slotBeingDragged, id);
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
						cpInventoryHelperSwitch(id, oInventory.id, v_slotBeingDragged, oInventory.tmp_lastHover);
					}	
				}
				
				oHUD.v_mouseFree = true;
				v_slotBeingDragged = -1;
			}
		}
		

		// Draw dragged item
		if (v_slotBeingDragged != -1)
		{
			oDrawHelperAbove.v_id = id;
			oDrawHelperAbove.v_mode = 0;
		}
		
		// Draw item in mouse
		if (v_itemMouse != -1)
		{
			oDrawHelperAbove.v_id = id;
			oDrawHelperAbove.v_mode = 1;
		}		
	}
	}
}

if (v_id != -1)
{
if (v_mode == 0)
{
	cpInventoryHelperDrawItem(v_id.id, v_id.v_slotBeingDragged, mouse_x - 16, mouse_y - 16);
}
if (v_mode == 1)
{
	cpInventoryHelperDrawItem(v_id.id, v_id.v_slotBeingDragged, mouse_x - 16, mouse_y - 16);
	
	if (v_id.v_splitRemainning > 1)
	{
		clr(c_white);
		draw_text(mouse_x, mouse_y + 8, string(v_id.v_splitRemainning));
	}
}
if (v_mode == 2)
{		
	cpInventoryHelperDrawItem(oInventory.id, oInventory.v_slotBeingDragged, mouse_x - 16, mouse_y - 16);
}
v_id = -1;
clr();
}

if (v_drawTalent != -1)
{
	var tmp_x, tmp_y, tmp_a;
	tmp_x = v_drawTalentX - 16 + 16 * v_drawTalentA;
	tmp_y = v_drawTalentY;
	tmp_a = v_drawTalentA;
	
	clr(-1, (tmp_a / 4) * 3);
	draw_rectangle(tmp_x, tmp_y, tmp_x + 256, tmp_y + 128, false);
	
	alg("center");
	fnt(fntPixel);
	
	if (v_drawTalentE == "") {clr(c_white, tmp_a);}
	else {clr(c_red, tmp_a);}
	
	draw_text(tmp_x + 128, tmp_y + 16, oHUD.v_playerTalent[v_drawTalentBranch, v_drawTalent + 1]);
	
	alg();
	fnt(fntPixelTiny);
	
	if (v_drawTalentE == "")
	{
		draw_text_ext(tmp_x + 4, tmp_y + 32, oHUD.v_playerTalent[v_drawTalentBranch, v_drawTalent + 2], 16, 256);
	}
	else
	{
		clr(c_red, - 1);
		draw_text_ext(tmp_x + 4, tmp_y + 32, "You need to learn this first:\n" + v_drawTalentE, 16, 256);
	}
	
	fnt(fntPixelExtraTiny);
	draw_text(tmp_x + 4, tmp_y + 110, "Level: " + string(oHUD.v_playerTalent[v_drawTalentBranch, v_drawTalent + 4]) + " / " + string(oHUD.v_playerTalent[v_drawTalentBranch, v_drawTalent + 5]));
	
	draw_set_halign(fa_right);
	draw_text(tmp_x + 254, tmp_y + 110, "Upgrade cost: " + string(oHUD.v_playerTalent[v_drawTalentBranch, v_drawTalent + 6]));
	draw_set_halign(fa_left);

	clr();
	v_drawTalent = -1;	
	v_drawTalentA = lerp(v_drawTalentA, 1, 0.2);
}
else {v_drawTalentA = 0;}