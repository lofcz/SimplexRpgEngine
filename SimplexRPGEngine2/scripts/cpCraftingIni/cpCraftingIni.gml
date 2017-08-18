
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

// Detail logic is handeled in cpCraftingHelperDB
// <recieptID>
g_itemsList = ds_list_create();
g_materialsList = ds_list_create();
g_alchemyList = ds_list_create();
g_foodList = ds_list_create();
