/// @function cpInventoryDraw()
/// @desc Renders inventory to the screen

x = oCamera.v_nullPosX;
y = oCamera.v_nullPosY;

// **** DEBUG

if (mouse_check_button_pressed(mb_right)) {cpContainerAdd(oItem1, 2, id);}
if (mouse_wheel_down()) {v_slotsPerRow++;}
if (mouse_wheel_up()) {v_slotOffsetY++;}
if (keyboard_check_pressed(ord("F"))) {t = !t}
v_slotOffsetX = clamp(v_slotOffsetX, 0, 48);
//v_slotOffsetY = clamp(v_slotOffsetY, 0, 12);

if (keyboard_check_pressed(ord("G")))  {v_filterButtons[0] = ! v_filterButtons[0];}
if (keyboard_check_pressed(ord("I")))  {v_drawForm = !v_drawForm;}
t = v_filterButtons[0];

if (t) { hj = lerp(hj, 256, 0.1);  yj = lerp(yj, max(5 * (v_slotSize + v_slotOffsetY) - v_slotRows * (v_slotSize + v_slotOffsetY) + (v_slotSize / 2) * 3, 0), 0.1);}
else {v_slotOffsetX = lerp(v_slotOffsetX, 6, 0.1); v_slotOffsetY = lerp(v_slotOffsetY, 6, 0.1); hj = lerp(hj, 0, 0.1); yj = lerp(yj, 0, 0.1);}

if (u) {v_slotSize = lerp(v_slotSize, 48, 0.1);}
else {v_slotSize = lerp(v_slotSize, 32, 0.1);}

if (!v_drawForm) {v_formAlpha = lerp(v_formAlpha, 0, 0.5);}
else {v_formAlpha = lerp(v_formAlpha, 1, 0.5);}


// **** /DEBUG

v_drawStartX = x;
v_drawStartY = y;
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
		tmp_hover = true;
		tmp_offsetHelp = oHUD.v_hudSlotUseX;
		tmp_lastHover = i;
		if (v_slot[i, e_inventoryAtributes.valID] != e_items.valNONE) {tmp_hovered = true; v_lastHover = tmp_lastHover;}
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
			shader_set_uniform_f(tmp_uID, color_get_red(v_slot[i, e_inventoryAtributes.valLerpColor]), color_get_green(v_slot[i, e_inventoryAtributes.valLerpColor]), color_get_blue(v_slot[i, e_inventoryAtributes.valLerpColor]), v_actualLerp);
		}
		draw_sprite_ext(v_slot[i, e_inventoryAtributes.valSprite], v_slot[i, e_inventoryAtributes.valImageIndex] + 2, tmp_drawX + (v_slotSize / 2) + (tmp_realSlotArea - v_slotSize) / 2, tmp_drawY + (v_slotSize / 2) + (tmp_realSlotArea - v_slotSize) / 2, 1, 1, 0, c_white, v_formAlpha);	
		shader_reset();
	
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
				var tmp_atrb, tmp_prop, tmp_req;
				for (var k = 0; k <= mcInvenotryAtributes; k++)
				{
					tmp_atrb[k] = v_slot[v_slotBeingDragged, k];			
				}
				
				for (var k = 0; k < mcInventoryProperties; k++)
				{
					tmp_prop[k] = v_slotProperty[v_slotBeingDragged, k];	
					tmp_req[k] = v_slotReq[v_slotBeingDragged, k];
				}
				
				for (var k = 0; k <= mcInvenotryAtributes; k++)
				{
					v_slot[v_slotBeingDragged, k] = v_slot[tmp_lastHover, k];					
					v_slot[tmp_lastHover, k] = tmp_atrb[k];
				}
			
				for (var k = 0; k < mcInventoryProperties; k++)
				{
					v_slotProperty[v_slotBeingDragged, k] = v_slotProperty[tmp_lastHover, k];
					v_slotProperty[tmp_lastHover, k] = tmp_prop[k];
					
					v_slotReq[v_slotBeingDragged, k] = v_slotReq[tmp_lastHover, k];
					v_slotReq[tmp_lastHover, k] = tmp_req[k];					
				}
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
				var tmp_atrb, tmp_prop, tmp_req;
				for (var k = 0; k <= mcInvenotryAtributes; k++)
				{
					tmp_atrb[k] = v_slot[v_slotBeingDragged, k];			
				}
				
				for (var k = 0; k < mcInventoryProperties; k++)
				{
					tmp_prop[k] = v_slotProperty[v_slotBeingDragged, k];	
					tmp_req[k] = v_slotReq[v_slotBeingDragged, k];
				}
				
				for (var k = 0; k <= mcInvenotryAtributes; k++)
				{
					v_slot[v_slotBeingDragged, k] = v_containerID.v_slot[v_containerID.tmp_lastHover, k];					
					v_containerID.v_slot[v_containerID.tmp_lastHover, k] = tmp_atrb[k];
				}
			
				for (var k = 0; k < mcInventoryProperties; k++)
				{
					v_slotProperty[v_slotBeingDragged, k] = v_containerID.v_slotProperty[v_containerID.tmp_lastHover, k];
					v_containerID.v_slotProperty[v_containerID.tmp_lastHover, k] = tmp_prop[k];
					
					v_slotReq[v_slotBeingDragged, k] = v_containerID.v_slotReq[v_containerID.tmp_lastHover, k];
					v_containerID.v_slotReq[v_containerID.tmp_lastHover, k] = tmp_req[k];					
				}
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
		if (mouse_check_button_pressed(mb_left))
		{
			v_filterButtons[i, 0] = !v_filterButtons[i, 0];
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
		draw_sprite(sEquipmentForm, 0, v_formBaseMaxX + (v_slotSize / 2) * 3, v_drawStartY + v_slotSize);
		
		cpEquipmentDraw();
		
		alg("center")
		fnt(fntPixelBig);
		clr(-1, min(v_formAlpha, v_formExtAlpha));
		draw_text(v_formBaseMaxX + (v_slotOffsetX * v_slotsPerRow) / 2 + (v_slotSize * 3) + v_formExtAlpha * (v_slotSize / 2), v_drawStartY + 16, __("Equipment"));
		fnt();
		alg();
	}
}

clr();

if (v_lerpMode == 0) {v_actualLerp = lin(v_actualLerp, 0.01, 0.00005); if (v_actualLerp >= 0.003) {v_lerpMode = 1;}}
if (v_lerpMode == 1) {v_actualLerp = lin(v_actualLerp, 0, 0.00005); if (v_actualLerp <= 0.0003) {v_lerpMode = 0;}}
}