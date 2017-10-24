/// @function cpInventoryHelperDrawItem(ownerID, slotID, x, y)
/// @desc Draws item of target IContainer on target position
/// @arg {object} ownerID ID of owner
/// @arg {int} slotID ID of slot
/// @arg {int} x x-pos
/// @arg {int} y y-pos

var tmp_owner, tmp_slot, tmp_x, tmp_y, tmp_alpha;
tmp_owner = id;
tmp_slot = 0;
tmp_x = mouse_x;
tmp_y = mouse_y;

if (argument_count > 0) {tmp_owner = argument[0];}
if (argument_count > 1) {tmp_slot = argument[1];}
if (argument_count > 2) {tmp_x = argument[2];}
if (argument_count > 3) {tmp_y = argument[3];}


tmp_alpha = tmp_owner.v_formAlpha;
			
if (!tmp_owner.v_slot[tmp_slot, e_inventoryAtributes.valIdentified])
{
	tmp_alpha /= 3;
}
			
if (tmp_owner.v_slot[tmp_slot, e_inventoryAtributes.valLerpColor] != 0)
{
	shader_set(shdLerp);
	var tmp_uID = shader_get_uniform(shdLerp, "f_Colour1");
	shader_set_uniform_f(tmp_uID, color_get_red(tmp_owner.v_slot[tmp_slot, e_inventoryAtributes.valLerpColor]) / 255, color_get_green(tmp_owner.v_slot[tmp_slot, e_inventoryAtributes.valLerpColor]) / 255, color_get_blue(tmp_owner.v_slot[tmp_slot, e_inventoryAtributes.valLerpColor]) / 255, tmp_owner.v_actualLerp);
}
draw_sprite_ext(tmp_owner.v_slot[tmp_slot, e_inventoryAtributes.valSprite], tmp_owner.v_slot[tmp_slot, e_inventoryAtributes.valImageIndex] + 2, tmp_x + (tmp_owner.v_slotSize / 2) + (tmp_owner.v_slotSize + 4 - tmp_owner.v_slotSize) / 2, tmp_y + (tmp_owner.v_slotSize / 2) + (tmp_owner.v_slotSize + 4 - tmp_owner.v_slotSize) / 2, 1, 1, 0, c_white, tmp_alpha);	
shader_reset();
			
// If unidentified
if (!tmp_owner.v_slot[tmp_slot, e_inventoryAtributes.valIdentified])
{
	draw_sprite_part(oInventory.v_inventorySprite, 0, 237, 517, 36, 36, tmp_x + 2, tmp_y + 2);
}	
					
// Draw star / trash icon
if (tmp_owner.v_slot[tmp_slot, e_inventoryAtributes.valLabel] == 1)
{
	draw_sprite_part_ext(oInventory.v_inventorySprite, 0, 605, 455, 20, 20, tmp_x + 24, tmp_y + 5, 0.5, 0.5, c_white, draw_get_alpha());
}

if (tmp_owner.v_slot[tmp_slot, e_inventoryAtributes.valLabel] == 2)
{
	draw_sprite_part_ext(oInventory.v_inventorySprite, 0, 628, 455, 20, 20, tmp_x + 24, tmp_y + 5, 0.5, 0.5, c_white, draw_get_alpha());
}	

var tmp_drawColor, tmp_drawOffsetX;
tmp_drawColor = c_white;
tmp_drawOffsetX = 0; 
		
if (tmp_owner.v_slot[tmp_slot, e_inventoryAtributes.valStackable])
{
	if (tmp_owner.v_slot[tmp_slot, e_inventoryAtributes.valCurrentStackSize] == tmp_owner.v_slot[tmp_slot, e_inventoryAtributes.valMaxStackSize]) 
	{
		tmp_drawColor = c_yellow;
	}
			
	if (tmp_owner.v_slot[tmp_slot, e_inventoryAtributes.valCurrentStackSize] >= 1000)
	{
		tmp_drawOffsetX = 12;
	}			
	else if (tmp_owner.v_slot[tmp_slot, e_inventoryAtributes.valCurrentStackSize] >= 100)
	{
		tmp_drawOffsetX = 8;
	}
	else if (tmp_owner.v_slot[tmp_slot, e_inventoryAtributes.valCurrentStackSize] >= 10)
	{
		tmp_drawOffsetX = 4;
	}
			
	fnt(fntPixelSmall);
	clr(tmp_drawColor, tmp_owner.v_formAlpha);
	draw_text(tmp_x + (tmp_owner.v_slotSize / 2) - tmp_drawOffsetX + 6, tmp_y + tmp_owner.v_slotSize - 10, string(tmp_owner.v_slot[tmp_slot, e_inventoryAtributes.valCurrentStackSize]));
	clr(c_black, tmp_owner.v_formAlpha);
}

// Draw combinations
if (v_drawCombinations)
{
	var tmp_canBeCombined;
	tmp_canBeCombined = (cpItemsOptionsDB(v_slot[v_usedItem, e_inventoryAtributes.valID], v_usedOption, tmp_slot) && !v_slot[tmp_slot, e_inventoryAtributes.valBeingUsed] && v_slot[tmp_slot, e_inventoryAtributes.valIdentified]);
	
	if (tmp_canBeCombined)
	{
		clr(c_lime, tmp_owner.v_formAlpha / 3);
		draw_roundrect(tmp_x + 2, tmp_y + 2, tmp_x + 36, tmp_y + 36, false);
		clr(c_black, tmp_owner.v_formAlpha);
	}
	else
	{
		if (!v_slot[tmp_slot, e_inventoryAtributes.valBeingUsed])
		{
			clr(c_red, tmp_owner.v_formAlpha / 3);
			draw_roundrect(tmp_x + 1, tmp_y + 2, tmp_x + 36, tmp_y + 36, false);
			clr(c_black, tmp_owner.v_formAlpha);	
		}
	}
}
			
if (tmp_owner.v_slot[tmp_slot, e_inventoryAtributes.valBeingUsed])
{
	clr(c_black, tmp_owner.v_formAlpha / 3);
	draw_rectangle(tmp_x + 1, tmp_y + 2, tmp_x + 38, tmp_y + 38, false);
	clr(c_black, tmp_owner.v_formAlpha);
}