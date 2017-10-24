/// cpItemsCombinationsDB(owner, firstSlot, secondSlot)

var tmp_owner, tmp_s1, tmp_s2;
tmp_owner = argument0;
tmp_s1 = argument1;
tmp_s2 = argument2;

if (tmp_owner.v_slot[tmp_s1, e_inventoryAtributes.valID] == e_items.valPearlGreen)
{
	tmp_owner.v_slotProperty[tmp_s2, e_inventoryProperties.valDamage] += 2;
	cpInventoryHelperClearSlot(tmp_s1, tmp_owner);
}

return 1;