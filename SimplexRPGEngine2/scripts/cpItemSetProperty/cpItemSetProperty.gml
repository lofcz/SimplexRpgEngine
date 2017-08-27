/// @function cpItemSetProperty(property1, value1)
/// @desc Sets value of target atribute, up to 8 pairs per call 
/// @arg {e_inventoryProperties} property1 First atribute index
/// @arg {int} value1 Value of first atribute

for (var i = 0; i < argument_count; i += 2)
{
	v_itemProperty[argument[i]] = argument[i + 1];
}