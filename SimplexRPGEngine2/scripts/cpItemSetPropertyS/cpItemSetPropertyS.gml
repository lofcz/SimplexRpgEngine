/// @function cpItemSetPropertyS(property1, value1)
/// @desc Sets value of target property, up to 8 pairs per call 
/// @arg {e_inventoryProperties} property1 First property index
/// @arg {int} value1 Value of first property

for (var i = 0; i < argument_count; i += 2)
{
	v_itemPropertyStatic[argument[i]] = argument[i + 1];
}