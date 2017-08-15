/// @function cpInventoryHelperClearSlot(slot, containerID)
/// @desc This script will clear provided slot
/// @arg {int} slot Slot to clear
/// @arg {object} containerID ID of container

var tmp_slot, tmp_id;
tmp_slot = 0;
tmp_id = oInventory.id;

if (argument_count > 0) {tmp_slot = argument[0];}
if (argument_count > 1) {tmp_id = argument[1];}

for (var i = 0; i <= mcInvenotryAtributes; i++)
{
	if (cpInventoryHelpIsStringAtr(i))
	{
		tmp_id.v_slot[tmp_slot, i] = "";
	}
	else
	{
		tmp_id.v_slot[tmp_slot, i] = 0;
	}
}

for (var i = 0; i <= mcInventoryProperties; i++)
{
	tmp_id.v_slotProperty[tmp_slot, i] = 0;
	tmp_id.v_slotReq[tmp_slot, i] = 0;
}