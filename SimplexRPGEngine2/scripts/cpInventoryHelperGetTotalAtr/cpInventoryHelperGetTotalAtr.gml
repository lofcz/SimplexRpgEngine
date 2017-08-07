/// @function cpInventoryHelperGetTotalAtr(atribute)
/// @desc Return sum of target atribute in all slots
/// @arg {e_inventoryAtributes} atribute Atribute to return

var tmp_atr, tmp_result;
tmp_atr = e_inventoryAtributes.valWeight;
tmp_result = 0;

if (argument_count > 0) {tmp_atr = argument[0];}

if (cpInventoryHelpIsStringAtr(tmp_atr)) {return -1;}

for (var i = 0; i < oInventory.v_slots; i++)
{
	tmp_result += oInventory.v_slot[i, tmp_atr] * oInventory.v_slot[i, e_inventoryAtributes.valCurrentStackSize];
}

return tmp_result;