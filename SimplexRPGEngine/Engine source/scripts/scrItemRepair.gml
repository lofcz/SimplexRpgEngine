/// scrItemRepair(index)

var i;
i = 0;

if (argument_count > 0) {i = argument[0];}

if (oInventory.slot_vlastnosti[i, vlastnost_max_durability] != -1)
   {
    oInventory.slot_vlastnosti[i, vlastnost_durability] = oInventory.slot_vlastnosti[i, vlastnost_max_durability];
    oInventory.slot_vlastnosti[i, vlastnost_cena]       = oInventory.slot_vlastnosti[i, vlastnost_originalniCena];    
    return true;
   }
return false;
