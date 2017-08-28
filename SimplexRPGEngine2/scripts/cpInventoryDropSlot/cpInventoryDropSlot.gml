/// cpInventoryDropSlot(slot)

var tmp_inst, tmp_slot;
tmp_inst = instance_create_layer(oPlayer.x + 32, oPlayer.y, "Items", oBasicItem);
tmp_slot = 0;

if (argument_count > 0) {tmp_slot = argument[0];}

for (var i = 0; i < mcInvenotryAtributes; i++)
{
	tmp_inst.v_itemAtributes[i] = oInventory.v_slot[tmp_slot, i];
}

for (var i = 0; i < mcInventoryProperties; i++)
{
	tmp_inst.v_itemProperty[i] = oInventory.v_slotProperty[tmp_slot, i];
	tmp_inst.v_itemReq[i] = oInventory.v_slotReq[tmp_slot, i]
}

for (var i = 0; i < mcAnimations; i++)
{
	tmp_inst.v_itemAnimation[i] = oInventory.v_slotAnimations[tmp_slot, i];
}

for (var i = 0;  i < array_length_2d(v_itemOptions, tmp_slot); i++)
{
	tmp_inst.v_itemOption[i] = oInventory.v_itemOptions[tmp_slot, i];
}

tmp_inst.sprite_index = sItems;
tmp_inst.image_speed = 0;
tmp_inst.image_index = tmp_inst.v_itemAtributes[e_inventoryAtributes.valID] - 2;

cpInventoryHelperClearSlot(tmp_slot, id);