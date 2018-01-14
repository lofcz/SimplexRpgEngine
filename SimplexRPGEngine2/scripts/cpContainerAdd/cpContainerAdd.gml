/// @function cpContainerAdd(item, number, containerID, allowRandomness)
/// @desc Adds target item to the inventory
/// @arg {object} item Item to add
/// @arg {int} number How many times to add the item
/// @arg {object} containerID containerID
/// @arg {bool} allowRandomness Is static?

var tmp_item, tmp_number, tmp_id, tmp_finalSlot, tmp_r;
tmp_item = noone;
tmp_number = 1;
tmp_id = id;
tmp_finalSlot = -1;
tmp_r = true;

if (argument_count > 0) {tmp_item = argument[0];}
if (argument_count > 1) {tmp_number = argument[1];}
if (argument_count > 2) {tmp_id = argument[2];}
if (argument_count > 3) {tmp_r = argument[3];}

repeat(tmp_number)
{
	if (!tmp_r)
	{
		global.tempArg0 = tmp_item;
	
		with(instance_create_depth(-1, -1, -100, oTempObject))
		{
			v_staticItem = true;
			global.tempArg1 = id;
			instance_change(global.tempArg0, true);
		}
		
		tmp_finalSlot = cpInventoryHelpPick(global.tempArg1, tmp_id);
	}
	else
	{
		global.tempArg0 = instance_create_depth(-1, -1, -100, tmp_item);
		tmp_finalSlot = cpInventoryHelpPick(global.tempArg0, tmp_id);
	}
}

return tmp_finalSlot;