/// @function cpInventoryHelpPick(item, containerID)
/// @desc Helper to pick up the item
/// @arg {object} item Item to pick
/// @arg {object} containerID Container to wchich add item in

// Step 1: search for free space in inventory
//	- If stackable, simply check for the same item in inventory and add if there is a space in the stack
//		- There may exist a case in which we can place only part of item_number into the v_slot found
//	- In the other case or fail of the first step, iterate trough inventory to find the first free v_slot

var tmp_freeSlot, tmp_item, tmp_id;
tmp_item = noone;
tmp_id = oInventory;

if (argument_count > 0) {tmp_item = argument[0];}
if (argument_count > 1) {tmp_id = argument[1];}

repeat(tmp_item.v_itemAtributes[e_inventoryAtributes.valItemNumber])
{
	tmp_freeSlot = -1;

	if (tmp_item.v_itemAtributes[e_inventoryAtributes.valStackable])
	{
		for (var i = 0; i < tmp_id.v_slots; i++)
		{
			if (tmp_id.v_slot[i, e_inventoryAtributes.valID] == tmp_item.v_itemAtributes[e_inventoryAtributes.valID])
			{
				// We need to prior transfer info about max stack size
				tmp_id.v_slot[i, e_inventoryAtributes.valMaxStackSize] = tmp_item.v_itemAtributes[e_inventoryAtributes.valMaxStackSize];
				
				if (tmp_id.v_slot[i, e_inventoryAtributes.valCurrentStackSize] < tmp_id.v_slot[i, e_inventoryAtributes.valMaxStackSize])
				{
					tmp_freeSlot = i;
					tmp_id.v_slot[i, e_inventoryAtributes.valCurrentStackSize]++;
					break;
				}
			}
		}	
	}
	
	if (tmp_freeSlot == -1)
	{
		for (var i = 0; i < tmp_id.v_slots; i++)
		{
			if (tmp_id.v_slot[i, e_inventoryAtributes.valID] == e_items.valNONE)
			{
				tmp_freeSlot = i;
				break;
			}
		}
	}
	
	// If we found free slot, transfer item into inventory
	if (tmp_freeSlot != -1)
	{
		for (var i = 0; i < mcInvenotryAtributes; i++)
		{
			if (!cpInventoryHelperBakedAtr(i)) {tmp_id.v_slot[tmp_freeSlot, i] = tmp_item.v_itemAtributes[i];}
		}
		
		for (var i = 0; i < mcInventoryProperties; i++)
		{
			tmp_id.v_slotProperty[tmp_freeSlot, i] = tmp_item.v_itemProperty[i];
			tmp_id.v_slotReq[tmp_freeSlot, i] = tmp_item.v_itemReq[i];
			tmp_id.v_slotPropertyStatic[tmp_freeSlot, i] = tmp_item.v_itemPropertyStatic[i];
		}

		for (var i = 0; i < mcAnimations; i++)
		{
			tmp_id.v_slotAnimations[tmp_freeSlot, i] = tmp_item.v_itemAnimation[i];
		}
		
		if (variable_instance_exists(tmp_item, "v_itemOption"))
		{
			for (var i = 0; i < array_length_1d(tmp_item.v_itemOption); i++)
			{
				tmp_id.v_itemOptions[tmp_freeSlot, i] = tmp_item.v_itemOption[i];
			}
		}		
		// If we place item in the empty slot, inc stack size by 1
		if (tmp_id.v_slot[tmp_freeSlot, e_inventoryAtributes.valCurrentStackSize] == 0) {tmp_id.v_slot[tmp_freeSlot, e_inventoryAtributes.valCurrentStackSize]++;}
		instance_destroy(tmp_item);
	}
	else
	{
		// [DEBUG] 
		show_message("no space in da container " + string(tmp_id));
	}
}

return tmp_freeSlot;