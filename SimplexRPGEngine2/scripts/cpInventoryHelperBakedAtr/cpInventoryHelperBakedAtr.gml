/// @function cpInventoryHelperBakedAtr(index)
/// @desc Checks if target index is un-transferable attribute
/// @arg {e_inventoryAtributes} index Index to check

var tmp_index;
tmp_index = 0;

if (argument_count > 0) {tmp_index = argument[0];}

if (tmp_index == e_inventoryAtributes.valCurrentStackSize)
{
	return true;
}

return false;