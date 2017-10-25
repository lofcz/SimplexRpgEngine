/// @function cpItemFinalize(canBeAttached)

var tmp_cba;
tmp_cba = false;

if (argument_count > 0) {tmp_cba = argument[0];}

if (tmp_cba)
{
	// Serialize string
	v_itemPearls[0] = string(v_itemAtributes[e_inventoryAtributes.valID]);
	v_itemPearls[1] = "";
	
	for (var i = 0; i < mcInventoryProperties; i++)
	{
		v_itemPearls[1] += string(v_itemProperty[i]) + ",";	
	}
}