
v_craftingForms[0, 0] = "Items";
v_craftingForms[1, 0] = "Enchanting";
v_craftingForms[2, 0] = "Materials";
v_craftingForms[3, 0] = "Alchemy";
v_craftingForms[4, 0] = "Food";
v_craftingForms[5, 0] = "Anvil";

v_craftingForms[0, 1] = 0;
v_craftingForms[1, 1] = 0;
v_craftingForms[2, 1] = 0;
v_craftingForms[3, 1] = 0;
v_craftingForms[4, 1] = 0;
v_craftingForms[5, 1] = 0;

v_craftingForms[0, 2] = 1;
v_craftingForms[1, 2] = 1;
v_craftingForms[2, 2] = 1;
v_craftingForms[3, 2] = 1;
v_craftingForms[4, 2] = 1;
v_craftingForms[5, 2] = 1;

v_craftingForms[0, 3] = 0;
v_craftingForms[1, 3] = 0;
v_craftingForms[2, 3] = 0;
v_craftingForms[3, 3] = 0;
v_craftingForms[4, 3] = 0;
v_craftingForms[5, 3] = 0;

v_craftingForms[0, 4] = 1;
v_craftingForms[1, 4] = 1;
v_craftingForms[2, 4] = 0;
v_craftingForms[3, 4] = 0;
v_craftingForms[4, 4] = 1;
v_craftingForms[5, 4] = 0;

//v_craftingFormsUnlocked = [true, true, true, true, true, false];
v_selectedForm = -1;
v_subformAlpha = 0;
v_selectedLastForm = -1;
v_searchText = "";
v_carret = true;
v_carretTimer = 60;
v_searchActive = false;

v_searchSurface = surface_create(400, 32); // 230
v_searchSurfaceX = 200;
v_searchSurfaceTarX = 200;
v_searchTipAlpha = 0;

// Detail logic is handeled in cpCraftingHelperDB
// <recieptID>
g_itemsList = ds_list_create();
g_materialsList = ds_list_create();
g_alchemyList = ds_list_create();
g_foodList = ds_list_create();

// <name, rarity, craftingSlots, craftingSlotsOptional>
v_recieptItem[0, 0] = "Fod";
	v_recieptItem[0, 1] = e_rarities.valCommon;
	v_recieptItem[0, 2] = 12;
	v_recieptItem[0, 3] = 3;
		
v_recieptItem[1, 0] = "Fol";
	v_recieptItem[1, 1] = e_rarities.valRare;
	v_recieptItem[1, 2] = 2;
	v_recieptItem[1, 3] = 1;
	
// <propertiesREQ>
for (var j = 0; j < 2; j++)
{
	for (var i = 0; i < mcInventoryProperties; i++)
	{
		v_recieptItemReq[j, i] = 0;
	}
}

// crafting slots needed
// <itemID, materialID, numberNeeded, slotName, slotDesc>
for (var j = 0; j < 2; j++)
{
	for (var i = 0; i < 5 * v_recieptItem[j, 2]; i++)
	{
		v_recieptItemSlot[j, i] = 0;
	}
}

v_recieptItemSlot[1, 0] = e_items.valSwordWooden;
v_recieptItemSlot[1, 1] = -1;
v_recieptItemSlot[1, 2] = 1;
v_recieptItemSlot[1, 3] = "Handle";
v_recieptItemSlot[1, 4] = "Makes this sword usable";

v_recieptItemSlot[1, 5] = e_items.valSwordWooden;
v_recieptItemSlot[1, 6] = -1;
v_recieptItemSlot[1, 7] = 1;
v_recieptItemSlot[1, 8] = "Blade";
v_recieptItemSlot[1, 9] = "Due to this part you can stab ur enemies";


// crafting slots optional
for (var j = 0; j < 2; j++)
{
	for (var i = 0; i < 3 * v_recieptItem[j, 3]; i++)
	{
		v_recieptItemSlotOptional[j, i] = 0;
	}
}

ds_list_add(g_itemsList, 1);
ds_list_add(g_itemsList, 0);

enum e_rarities
{
	valTrash,
	valCommon,
	valUncommon,
	valRare,
	valVeryRare,
	valMythic,
	valLegendary,
	valQuest
}

v_craftItemSelected = -1;
v_craftAlpha = 0;
v_craftWIP = false;
v_tooltipAlpha = 0;