
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
v_tipAlpha = 0;

// Detail logic is handeled in cpCraftingHelperDB
// <recieptID>
g_itemsList = ds_list_create();

v_currentFormType = "item";

// <name, rarity, craftingSlots, craftingSlotsOptional, outputObject, seenByPlayer, tabType, customRuleIndex, description, reqCraftingSkill>
v_recieptItem[0, 0] = "Fod";
	v_recieptItem[0, 1] = e_rarities.valCommon;
	v_recieptItem[0, 2] = 12;
	v_recieptItem[0, 3] = 3;
	v_recieptItem[0, 4] = oItem1;
	v_recieptItem[0, 5] = false;
	v_recieptItem[0, 6] = "Items";
	v_recieptItem[0, 7] = "";
	v_recieptItem[0, 8] = "";
	v_recieptItem[0, 9] = 0;	
				
v_recieptItem[1, 0] = "Basic HP elixir";
	v_recieptItem[1, 1] = e_rarities.valRare;
	v_recieptItem[1, 2] = 2;
	v_recieptItem[1, 3] = 1;
	v_recieptItem[1, 4] = oItem1;
	v_recieptItem[1, 5] = false;
	v_recieptItem[1, 6] = "Food";
	v_recieptItem[1, 7] = "";	
	v_recieptItem[1, 8] = "Placebo effect for the win";
	v_recieptItem[1, 9] = 0;			
// <propertiesREQ>
for (var j = 0; j < 2; j++)
{
	for (var i = 0; i < mcInventoryProperties; i++)
	{
		v_recieptItemReq[j, i] = 0;
	}
}

// crafting slots needed
// <itemID, materialID, numberNeeded, slotName, slotDesc, inputID>
for (var j = 0; j < 2; j++)
{
	for (var i = 0; i < 7 * v_recieptItem[j, 2]; i++)
	{
		v_recieptItemSlot[j, i] = 0;
	}
}

// Bound slots to reciept [reciept_id, {neededItem, materialType, numberOfNeededItems, SlotName, slotDesc, actualItemInSlot}]
v_recieptItemSlot[0, 0] = e_items.valSwordWooden;
v_recieptItemSlot[0, 1] = -1;
v_recieptItemSlot[0, 2] = 1;
v_recieptItemSlot[0, 3] = "Handle";
v_recieptItemSlot[0, 4] = "Makes this sword usable";
v_recieptItemSlot[0, 5] = -1;

v_recieptItemSlot[0, 6] = e_items.valNONE;
v_recieptItemSlot[0, 7] = -1;
v_recieptItemSlot[0, 8] = 1;
v_recieptItemSlot[0, 9] = "Blade";
v_recieptItemSlot[0, 10] = "Due to this part you can stab ur enemies";
v_recieptItemSlot[0, 11] = -1;

v_recieptItemSlot[0, 12] = e_items.valNONE;
v_recieptItemSlot[0, 13] = -1;
v_recieptItemSlot[0, 14] = 1;
v_recieptItemSlot[0, 15] = "Random text";
v_recieptItemSlot[0, 16] = "Trashtalking";
v_recieptItemSlot[0, 17] = -1;

v_recieptItemSlot[0, 18] = e_items.valNONE;
v_recieptItemSlot[0, 19] = -1;
v_recieptItemSlot[0, 20] = 1;
v_recieptItemSlot[0, 21] = "Freaking shit";
v_recieptItemSlot[0, 22] = "Sample text";
v_recieptItemSlot[0, 23] = -1;

v_recieptItemSlot[0, 24] = e_items.valNONE;
v_recieptItemSlot[0, 25] = -1;
v_recieptItemSlot[0, 26] = 1;
v_recieptItemSlot[0, 27] = "More trash";
v_recieptItemSlot[0, 28] = "Shitty train";
v_recieptItemSlot[0, 29] = -1;

v_recieptItemSlot[0, 30] = e_items.valNONE;
v_recieptItemSlot[0, 31] = -1;
v_recieptItemSlot[0, 32] = 1;
v_recieptItemSlot[0, 33] = "Even more crafting slots";
v_recieptItemSlot[0, 34] = "Simplex sucks";
v_recieptItemSlot[0, 35] = -1;

v_recieptItemSlot[0, 36] = e_items.valSwordWooden;
v_recieptItemSlot[0, 37] = -1;
v_recieptItemSlot[0, 38] = 1;
v_recieptItemSlot[0, 39] = "Fcking endless";
v_recieptItemSlot[0, 40] = "Die in hell";
v_recieptItemSlot[0, 41] = -1;

v_recieptItemSlot[0, 42] = e_items.valNONE;
v_recieptItemSlot[0, 43] = -1;
v_recieptItemSlot[0, 44] = 1;
v_recieptItemSlot[0, 45] = "Shit";
v_recieptItemSlot[0, 46] = "Im dying in pain";
v_recieptItemSlot[0, 47] = -1;

v_recieptItemSlot[0, 48] = e_items.valSwordWooden;
v_recieptItemSlot[0, 49] = -1;
v_recieptItemSlot[0, 50] = 1;
v_recieptItemSlot[0, 51] = "Can we";
v_recieptItemSlot[0, 52] = "qwerty and more random trash";
v_recieptItemSlot[0, 53] = -1;

v_recieptItemSlot[0, 54] = e_items.valNONE;
v_recieptItemSlot[0, 55] = -1;
v_recieptItemSlot[0, 56] = 1;
v_recieptItemSlot[0, 57] = "End";
v_recieptItemSlot[0, 58] = "hell please";
v_recieptItemSlot[0, 59] = -1;

v_recieptItemSlot[0, 60] = e_items.valNONE;
v_recieptItemSlot[0, 61] = -1;
v_recieptItemSlot[0, 62] = 1;
v_recieptItemSlot[0, 63] = "My suffering";
v_recieptItemSlot[0, 64] = "au revoair";
v_recieptItemSlot[0, 65] = -1;

v_recieptItemSlot[0, 66] = e_items.valNONE;
v_recieptItemSlot[0, 67] = -1;
v_recieptItemSlot[0, 68] = 1;
v_recieptItemSlot[0, 69] = "Please";
v_recieptItemSlot[0, 70] = "Finally";
v_recieptItemSlot[0, 71] = -1;

v_recieptItemSlot[1, 0] = e_items.valSwordWooden; // Item we need (-1 if we want material slot)
v_recieptItemSlot[1, 1] = -1; // Material type we need (-1 if we want item specific slot)
v_recieptItemSlot[1, 2] = 1; // How many times we need item to be placed in slot
v_recieptItemSlot[1, 3] = "Handle"; // Slot title
v_recieptItemSlot[1, 4] = "Makes this sword usable"; // Slot description
v_recieptItemSlot[1, 5] = -1; // Always -1 (current item in slot)

v_recieptItemSlot[1, 6] = e_items.valSwordWooden;
v_recieptItemSlot[1, 7] = -1;
v_recieptItemSlot[1, 8] = 1;
v_recieptItemSlot[1, 9] = "Blade";
v_recieptItemSlot[1, 10] = "Due to this part you can stab ur enemies";
v_recieptItemSlot[1, 11] = -1;

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
	valTrash = c_dkgray,
	valCommon = c_black,
	valUncommon = c_black,
	valRare = c_lime,
	valVeryRare = c_aqua,
	valMythic = c_purple,
	valLegendary = c_yellow,
	valQuest = c_fuchsia
}

v_craftItemSelected = -1;
v_craftAlpha = 0;
v_craftWIP = false;
v_tooltipAlpha = 0;
v_customDropItem = false;
v_craftFinishAlpha = 0;
v_drawPreview = false;
v_previewAlpha = 0;
tmp_refID = -1;