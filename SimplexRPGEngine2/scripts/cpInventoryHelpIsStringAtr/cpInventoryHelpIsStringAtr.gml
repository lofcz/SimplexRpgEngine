/// @function cpInventoryHelpIsStringAtr(index)
/// @desc Checks target index for int or string type
/// @arg {e_inventoyAtributes} index Index to check

var index;
index = 0;

if (argument_count > 0) {index = argument[0];}

if (index == e_inventoryAtributes.valInfoTextBody || index == e_inventoryAtributes.valInfoTextHead || index == e_inventoryAtributes.valInfoTextFooter || index == e_inventoryAtributes.valOptions)
{
	return true;
}

return false;