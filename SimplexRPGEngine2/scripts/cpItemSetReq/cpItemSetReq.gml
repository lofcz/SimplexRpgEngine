/// @function cpItemSetReq(reqIndex1, reqVal1...)
/// @desc Sets requirement of item
/// @arg {e_inventoryProperties} reqIndex1 Index of first requirement
/// @arg {int} reqVal1 Value of first requirement

for (var i = 0; i < argument_count; i += 2)
{
	v_itemReq[argument[i]] = argument[i + 1];
}