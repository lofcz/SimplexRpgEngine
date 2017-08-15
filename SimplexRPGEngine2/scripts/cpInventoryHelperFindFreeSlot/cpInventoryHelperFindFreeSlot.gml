/// @function cpInventoryHelperFindFreeSlot()

var tmp_freeSlot, tmp_id;
tmp_freeSlot = -1;
tmp_id = id;

if (argument_count > 0) {tmp_id = argument[0];}

for (var i = 0; i < tmp_id.v_slots; i++)
{
	if (tmp_id.v_slot[i, e_inventoryAtributes.valID] == e_items.valNONE)
	{
		tmp_freeSlot = i;
		break;
	}
}

return tmp_freeSlot;