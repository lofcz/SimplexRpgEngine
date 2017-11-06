/// @desc [Simplex description line]

if (cpInventoryHelpPick(id) != -1)
{
	cpSplashMessage("+ " + string(v_itemAtributes[e_inventoryAtributes.valInfoTextHead]), v_itemAtributes[e_inventoryAtributes.valRarity], v_tempSprite, 0, 0.9, x, y - 32);
	instance_destroy();
}