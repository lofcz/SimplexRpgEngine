/// _cFilterFreeGemstone(slot)

for (var i = 0; i < oInventory.v_slot[argument0, e_inventoryAtributes.valGemSlots]; i++)
{
	if (oInventory.v_slotGems[argument0, i * 4] == "")
	{
		return true;
	}
}

return false;