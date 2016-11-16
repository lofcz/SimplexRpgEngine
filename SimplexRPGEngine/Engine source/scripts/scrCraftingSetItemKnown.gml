/// scrCraftingSetItemKnown(id, recipeName, recipeText, craftingLevelRequired)

var index, page, normalizedIndex, rn, rt, c;
index = 0;
page  = 0;
rn    = "";
rt    = "";
c     = 0;

if (argument_count > 0) {index = argument[0];}
if (argument_count > 1) {rn    = argument[1];}
if (argument_count > 2) {rt    = argument[2];}
if (argument_count > 3) {c     = argument[3];}

page             = (index div oHUD.craftingEntriesPerPage);
normalizedIndex  = (index - (page * oHUD.craftingEntriesPerPage));

if (ds_list_find_index(oHUD.craftingKnownItems, index) == -1) 
    {
    ds_list_add(oHUD.craftingKnownItems, index);
    oHUD.craftingItemsNewFlag[page,  normalizedIndex] = true;
    oHUD.craftingItemsName[page,     normalizedIndex] = rn;
    oHUD.craftingDetailsText[page,   normalizedIndex] = rt;
    oHUD.craftingItemsLevelReq[page, normalizedIndex] = c;
    }
