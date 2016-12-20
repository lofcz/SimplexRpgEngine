/// inventoryIterateSetAtribute(itemID, atributeIndex, atributeValue, [onlyIfPrevValEquals], [wordwrapWidth), [wordwrapFont])

var iID, pI, pV, a, o, w, wF;
iID = itemEnum.itemShuriken;
pI  = inv_item_info_head;
pV  = "[renamed]";
o   = "";
w   = -1;
wF  = fntPixelSmall;

if (argument_count > 0) {iID = argument[0];}
if (argument_count > 1) {pI  = argument[1];}
if (argument_count > 2) {pV  = argument[2];}
if (argument_count > 3) {o   = argument[3];}
if (argument_count > 4) {w   = argument[4];}
if (argument_count > 5) {wF  = argument[5];}

// Iterate all slots
for (a = 0; a < oInventory.slots; a++)
    {
     if (oInventory.slot[a, inv_id] == iID)
        {
         if (o != "") {if (oInventory.slot[a, pI] != o) {continue;}}
         oInventory.slot[a, pI] = pV;
         if (w != -1) {oInventory.slot[a, pI] = scrWordwrap(pV, w, wF);}
        }    
    }    
    
if (oInventory.drag)
   {
     if (oInventory.equip_sprite_s[6] == idd)
        {
         if (o != "") {if (oInventory.slot[a, pI] != o) {exit;}}        
         oInventory.temp_equip[pI] = pV;
         if (w != -1) {oInventory.slot[a, pI] = scrWordwrap(pV, w, wF);}         
        }
   }



