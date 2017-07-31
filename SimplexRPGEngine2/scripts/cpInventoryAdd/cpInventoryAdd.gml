/// @function cpInventoryAdd(item, number)
/// @desc Adds target item to the inventory
/// @arg {object} item Item to add
/// @arg {int} number How many times to add the item

var tmp_item, tmp_number;
tmp_item = noone;
tmp_number = 1;

if (argument_count > 0) {tmp_item = argument[0];}
if (argument_count > 1) {tmp_number = argument[1];}

repeat(tmp_number)
{
	var i = instance_create_depth(oPlayer.x, oPlayer.y, -100, tmp_item);
	cpInventoryHelpPick(i);
}
