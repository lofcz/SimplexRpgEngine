/// @desc [Simplex description line]

for (var i = 0; i < mcInvenotryAtributes; i++)
{
	if (!cpInventoryHelpIsStringAtr(i))
	{
		v_itemAtributes[i] = 0;
	}
	else
	{
		v_itemAtributes[i] = "";
	}
}

for (var i = 0; i < mcInventoryProperties; i++)
{
	v_itemProperty[i] = 0;
}

v_itemAtributes[e_inventoryAtributes.valID] = e_items.valAlchemyDust;
v_itemAtributes[e_inventoryAtributes.valSprite] = sItems;
v_itemAtributes[e_inventoryAtributes.valImageIndex] = e_items.valAlchemyDust - 4;
v_itemAtributes[e_inventoryAtributes.valItemNumber] = 1;
v_itemAtributes[e_inventoryAtributes.valStackable] = 1;
v_itemAtributes[e_inventoryAtributes.valMaxStackSize] = 12;