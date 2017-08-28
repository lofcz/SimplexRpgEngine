/// @function cpItemSetAtribute(atribute1, value1)
/// @desc Sets value of target atribute, up to 8 pairs per call 
/// @arg {e_inventoryProperties} atribute1 First property index
/// @arg {int} value1 Value of first property

for (var i = 0; i < argument_count; i += 2)
{
	v_itemAtributes[argument[i]] = argument[i + 1];
}