/// @function cpContainerAdd(item, number, containerID)
/// @desc Adds target item to the inventory
/// @arg {object} item Item to add
/// @arg {int} number How many times to add the item
/// @arg {object} containerID containerID

var tmp_item, tmp_number, tmp_id, tmp_finalSlot;
tmp_item = noone;
tmp_number = 1;
tmp_id = id;
tmp_finalSlot = -1;

if (argument_count > 0) {tmp_item = argument[0];}
if (argument_count > 1) {tmp_number = argument[1];}
if (argument_count > 2) {tmp_id = argument[2];}

repeat(tmp_number)
{
	var inst = instance_create_depth(-1, -1, -100, tmp_item);
	tmp_finalSlot = cpInventoryHelpPick(inst, tmp_id);
}

return tmp_finalSlot;