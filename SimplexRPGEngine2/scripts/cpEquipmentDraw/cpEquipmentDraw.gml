
var tmp_slotSize;

for (var i = 0; i < mcEquipmentSlots; i++)
{
	if (i == e_equipmentSlots.valRing1 || i == e_equipmentSlots.valRing2) {tmp_slotSize = 16;} else {tmp_slotSize = 36;}
	
	if (point_in_rectangle(mouse_x, mouse_y, v_formBaseMaxX + (v_slotSize / 2) * 3 + v_equipmentSlots[i, 0], v_drawStartY + v_slotSize + v_equipmentSlots[i, 1], v_formBaseMaxX + (v_slotSize / 2) * 3 + v_equipmentSlots[i, 0] + tmp_slotSize, v_drawStartY + v_slotSize + v_equipmentSlots[i, 1] + tmp_slotSize))
	{
		draw_rectangle(v_formBaseMaxX + (v_slotSize / 2) * 3 + v_equipmentSlots[i, 0], v_drawStartY + v_slotSize + v_equipmentSlots[i, 1], v_formBaseMaxX + (v_slotSize / 2) * 3 + v_equipmentSlots[i, 0] + tmp_slotSize, v_drawStartY + v_slotSize + v_equipmentSlots[i, 1] + tmp_slotSize, false);
	}
}