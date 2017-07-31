/// @function cpInventoryHelperClearSlot(slot)
/// @desc This script will clear provided slot
/// @arg {int} slot Slot to clear

var tmp_slot;
tmp_slot = 0;

if (argument_count > 0) {tmp_slot = argument[0];}

for (var i = 0; i <= mcInvenotryAtributes; i++)
{
	if (cpInventoryHelpIsStringAtr(i))
	{
		oInventory.v_slot[tmp_slot, i] = "";
	}
	else
	{
		oInventory.v_slot[tmp_slot, i] = 0;
	}
}

for (var i = 0; i <= mcInventoryProperties; i++)
{
	oInventory.v_slotProperty[i] = 0;
}