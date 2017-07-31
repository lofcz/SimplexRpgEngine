/// @function cpInventoryHelpPick(item)
/// @desc Helper to pick up the item
/// @arg {object} item Item to pick

// Step 1: search for free space in inventory
//	- If stackable, simply check for the same item in inventory and add if there is a space in the stack
//		- There may exist a case in which we can place only part of item_number into the v_slot found
//	- In the other case or fail of the first step, iterate trough inventory to find the first free v_slot

var tmp_freeSlot, tmp_item;
tmp_item = noone;

if (argument_count > 0) {tmp_item = argument[0];}

repeat(tmp_item.v_itemAtributes[e_inventoryAtributes.valItemNumber])
{
	tmp_freeSlot = -1;

	if (tmp_item.v_itemAtributes[e_inventoryAtributes.valStackable])
	{
		for (var i = 0; i < oInventory.v_slots; i++)
		{
			if (oInventory.v_slot[i, e_inventoryAtributes.valID] == tmp_item.v_itemAtributes[e_inventoryAtributes.valID])
			{
				// We need to prior transfer info about max stack size
				oInventory.v_slot[i, e_inventoryAtributes.valMaxStackSize] = tmp_item.v_itemAtributes[e_inventoryAtributes.valMaxStackSize];
				
				if (oInventory.v_slot[i, e_inventoryAtributes.valCurrentStackSize] < oInventory.v_slot[i, e_inventoryAtributes.valMaxStackSize])
				{
					tmp_freeSlot = i;
					oInventory.v_slot[i, e_inventoryAtributes.valCurrentStackSize]++;
					break;
				}
			}
		}	
	}
	
	if (tmp_freeSlot == -1)
	{
		for (var i = 0; i < oInventory.v_slots; i++)
		{
			if (oInventory.v_slot[i, e_inventoryAtributes.valID] == e_items.valNONE)
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
			if (!cpInventoryHelperBakedAtr(i)) {oInventory.v_slot[tmp_freeSlot, i] = tmp_item.v_itemAtributes[i];}
		}
		
		for (var i = 0; i < mcInventoryProperties; i++)
		{
			oInventory.v_slotProperty[tmp_freeSlot, i] = tmp_item.v_itemProperty[i];
		}
		
		// If we place item in the empty slot, inc stack size by 1
		if (oInventory.v_slot[tmp_freeSlot, e_inventoryAtributes.valCurrentStackSize] == 0) {oInventory.v_slot[tmp_freeSlot, e_inventoryAtributes.valCurrentStackSize]++;}
		instance_destroy(tmp_item);
	}
	else
	{
		// [DEBUG] 
		show_message("no space in da inventori");
	}
}