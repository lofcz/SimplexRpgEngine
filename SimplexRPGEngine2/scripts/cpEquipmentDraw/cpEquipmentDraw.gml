
var tmp_slotSize;
v_hoverContainerForm = "";

for (var i = 0; i < mcEquipmentSlots; i++)
{
	if (i == e_equipmentSlots.valRing1 || i == e_equipmentSlots.valRing2) {tmp_slotSize = 16;} else {tmp_slotSize = 36;}
	
	if (point_in_rectangle(mouse_x, mouse_y, v_formBaseMaxX + (v_slotSize / 2) * 3 + v_equipmentSlots[i, 0], v_drawStartY + v_slotSize + v_equipmentSlots[i, 1], v_formBaseMaxX + (v_slotSize / 2) * 3 + v_equipmentSlots[i, 0] + tmp_slotSize, v_drawStartY + v_slotSize + v_equipmentSlots[i, 1] + tmp_slotSize))
	{
		//draw_rectangle(v_formBaseMaxX + (v_slotSize / 2) * 3 + v_equipmentSlots[i, 0], v_drawStartY + v_slotSize + v_equipmentSlots[i, 1], v_formBaseMaxX + (v_slotSize / 2) * 3 + v_equipmentSlots[i, 0] + tmp_slotSize, v_drawStartY + v_slotSize + v_equipmentSlots[i, 1] + tmp_slotSize, false);
		v_hoverContainerForm = "equipment";
		v_equipmentLastHover = i;
		
		if (v_equipmentSlot[i, e_inventoryAtributes.valID] != 0)
		{
			cpInventoryHelperDrawInfobox(id, v_equipmentSlot, 1, v_equipmentLastHover, v_equipmentSlotProperty, v_equipmentReq);	
			
			// Unequip
			if (mouse_check_button_pressed(mb_left))
			{
				cpEquipmentUnequip();
			}
		}				
	}
	
	// If we hover item and it can be equiped to slot, highlight that slot
	if (v_slotBeingDragged != -1)
	{
		if (v_slot[v_slotBeingDragged, e_inventoryAtributes.valEquipSlot] == v_equipmentSlots[i, 2])
		{
			clr(c_lime, 0.3);
			draw_rectangle(v_formBaseMaxX + (v_slotSize / 2) * 3 + v_equipmentSlots[i, 0], v_drawStartY + v_slotSize + v_equipmentSlots[i, 1], v_formBaseMaxX + (v_slotSize / 2) * 3 + v_equipmentSlots[i, 0] + tmp_slotSize, v_drawStartY + v_slotSize + v_equipmentSlots[i, 1] + tmp_slotSize, false);
			clr();
		}
	}
	
	if (i == v_equipmentLastHover)
	{
		draw_text(v_formBaseMaxX + (v_slotSize / 2) * 3 + v_equipmentSlots[i, 0], v_drawStartY + v_slotSize + v_equipmentSlots[i, 1], "XXXXXXXX");
	}

	if (v_equipmentSlot[i, e_inventoryAtributes.valID] != 0)
	{	
		// Apply shader if needed
		if (v_equipmentSlot[i, e_inventoryAtributes.valLerpColor] != 0)
		{
			shader_set(shdLerp);
			var tmp_uID = shader_get_uniform(shdLerp, "f_Colour1");
			shader_set_uniform_f(tmp_uID, color_get_red(v_equipmentSlot[i, e_inventoryAtributes.valLerpColor]) / 255, color_get_green(v_equipmentSlot[i, e_inventoryAtributes.valLerpColor]) / 255, color_get_blue(v_equipmentSlot[i, e_inventoryAtributes.valLerpColor]) / 255, v_actualLerp);
		}
		draw_sprite_ext(v_equipmentSlot[i, e_inventoryAtributes.valSprite], v_equipmentSlot[i, e_inventoryAtributes.valImageIndex] + 2, v_formBaseMaxX + (v_slotSize / 2) * 3 + v_equipmentSlots[i, 0] + 16, v_drawStartY + v_slotSize + v_equipmentSlots[i, 1] + 16, 1, 1, 0, c_white, min(v_formExtAlpha, v_formAlpha));	
		shader_reset();
	}
}
