/// scrCraftingSetMaterialKnown(id, recipeName, recipeText)

var index, page, normalizedIndex, rn, rt;
index = 0;
page  = 0;
rn    = "";
rt    = "";

if (argument_count > 0) {index = argument[0];}
if (argument_count > 1) {rn    = argument[1];}
if (argument_count > 2) {rt    = argument[2];}

page             = (index div oHUD.craftingEntriesPerPage);
normalizedIndex  = (index - (page * oHUD.craftingEntriesPerPage));

if (ds_list_find_index(oHUD.craftingKnownMaterials, index) == -1) 
    {
    ds_list_add(oHUD.craftingKnownMaterials, index);
    oHUD.craftingMaterialsNewFlag[page, normalizedIndex] = true;
    oHUD.craftingMaterialsName[page, normalizedIndex] = rn;
    oHUD.craftingMaterialsDetailsText[page, normalizedIndex] = rt;
    }
