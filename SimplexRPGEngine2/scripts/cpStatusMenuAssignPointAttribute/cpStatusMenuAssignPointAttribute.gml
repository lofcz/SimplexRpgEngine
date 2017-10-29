/// cpStatusMenuAssignPointAttribute(propertyIndex, doAssign)

var tmp_index, tmp_really;
tmp_index = argument[0];
tmp_really = argument[1];

if (tmp_really)
{
	for (var i = 0; i < mcInventoryProperties; i++)
	{
		oHUD.v_playerProperty[i] += oStatusMenu.v_propertyTemp[i];	
	}
	
	return 1;
}

if (tmp_index == e_inventoryProperties.valStrenght)
{
	oStatusMenu.v_propertyTemp[e_inventoryProperties.valHp] += 5;
	oStatusMenu.v_propertyTemp[e_inventoryProperties.valMaxHp] += 5;
}
