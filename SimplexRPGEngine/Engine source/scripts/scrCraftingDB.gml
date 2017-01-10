#define scrCraftingDB
/// scrCraftingDB(callMode, id)

var callMode, index, t;
callMode = craftingEnum.craftInfo;
index    = 0;
craftingCompleted = true;
t = false;

tx = tempX;
ty = tempY;

if (argument_count > 0) {callMode = argument[0];}
if (argument_count > 1) {index    = argument[1];}


dbID = index;
if (index == 3 ) // Wooden sword
    {
     scrCraftingDbDrawSlot(tx, ty, materialEnum.materialWood, 0, 3, 0);
     scrCraftingDbDrawSlot(tx, ty + 40, materialEnum.materialMetal, 1, 1, 2);
     scrCraftingDrawCraftingSeparator(tx + 3, ty + 80);
     scrCraftingDbDrawSlot(tx, ty + 100, materialEnum.materialPearl, 2, 1, 1, true);
     
     if (cStep)
     { 
     if (craftingPreview != "") {for(i = 0; i < celkem_vlastnosti; i++) {cp[i] = 0;}}   
     for (var i = 0; i < 3; i++)
         {
          if (slotArray[i] != -1)
             {
              t = true;
              if (slotArray[i] == itemEnum.itemWood) {cp[vlastnost_poskozeni] += 2; cp[vlastnost_stamina_cost] = 4;}
              if (slotArray[i] == itemEnum.itemSteel) {cp[vlastnost_poskozeni] += 4;}
              if (slotArray[i] == itemEnum.itemPearlRed) {cp[vlastnost_stackSezehnuti] += 0.5;}
             }   
         }
     if (t || forceDB) {craftingPreview = scrCraftingFinalizePreviewString(); forceDB = false;}
     cStep = false;
     }
    }

// Navigation       
if (callMode == craftingEnum.craftCraft)
{
textColor = c_gray; 
if (craftingCompleted) {textColor = c_lime;}


// Draw craft button
     btnColor = c_black;
     if (mouse_in(tx + 16, tx + 112, ty + 170, ty + 190)) 
        {
        btnColor = c_yellow;
        
        if (mouse_check_button_pressed(mb_left) && textColor == c_lime)
            {
             scrCraftingCraft(index, true);
            }
        }
      
     clr(btnColor, 0.4);
     draw_roundrect(tx + 16, ty + 170, tx + 112, ty + 190, false);
     clr(c_black, 1);
     draw_roundrect(tx + 16, ty + 170, tx + 112, ty + 190, true);
     alg("center", fntPixelSmall);
     clr(textColor, 1);
     draw_text(tx + 64, ty + 180, "[Vytvořit]");     
          
// Draw abort button
     btnColor = c_black;
     if (mouse_in(tx + 128, tx + 240, ty + 170, ty + 190)) 
        {        
        btnColor = c_yellow;  
        
        if (mouse_check_button_pressed(mb_left))
        {     
        scrCraftingCraft(index, false);
        craftingHelper = -1;
        craftingTitleHelper = "";
        craftingPreview = "";
        cStep = false;
        for(i = 0; i < celkem_vlastnosti; i++) {cp[i] = 0;}
        }
        }
     
     clr(btnColor, 0.4);
     draw_roundrect(tx + 128, ty + 170, tx + 240, ty + 190, false);
     clr(c_black, 1);
     draw_roundrect(tx + 128, ty + 170, tx + 240, ty + 190, true);
     alg("center", fntPixelSmall);
     clr(c_white, 1);
     draw_text(tx + 184, ty + 180, "[Zrušit]");          
}

#define scrCraftingDbDrawSlot
/// scrCraftingDbDrawSlot(x, y, materialRequired, id, numberRequired, emptyImageIndex, optional)

var xx, yy, mr, in, nr, ei, o;
xx = x;
yy = y;
mr = materialEnum.materialMetal;
in = 0;
nr = 1;
ei = 1;
o  = false;

if (argument_count > 0) {xx = argument[0];}
if (argument_count > 1) {yy = argument[1];}
if (argument_count > 2) {mr = argument[2];}
if (argument_count > 3) {in = argument[3];}
if (argument_count > 4) {nr = argument[4];}
if (argument_count > 5) {ei = argument[5];}
if (argument_count > 6) {o  = argument[6];}

color = c_black;
craftingSlotNumber[in] = nr;
craftingSlotOptional[in] = o;

if (oInventory.drag && oInventory.equip_sprite_s[3] = mr && oInventory.equip_sprite_s[5] >= nr)
        { 
         color = c_lime;
        }

if (mouse_in(xx, xx + 32, yy, yy + 32)) 
    {
    color = c_yellow;
    
        if (oInventory.drag && oInventory.equip_sprite_s[3] = mr && oInventory.equip_sprite_s[5] >= nr)
        { 
         color = c_lime;
        }
    
    if (mouse_check_button_released(mb_left) && color == c_lime)
    {
    oInventory.pre_switch = 1;
    oInventory.draw_item_mouse = 0;
    oInventory.slot[oInventory.h_c, inv_item_beingUsed] = true; 
    craftingSlotID[in] = oInventory.h_c;
    craftingSlotItemID[in] = oInventory.equip_sprite_s[6];
    cStep = true;

    if (color == c_lime)
        {
        craftingSlotSprite[in] = oInventory.equip_sprite_s[1];
        }
    }    
    
    if (mouse_check_button_pressed(mb_left))
        {
         if (craftingSlotID[in] != -1)
            {
            oInventory.slot[craftingSlotID[in], inv_item_beingUsed] = false;
            craftingSlotSprite[in] = 0;
            craftingSlotID[in] = -1;
            cStep = true;
            forceDB = true;
            scrCraftingDB(craftingEnum.craftInfo, dbID);
            }
        }
    }
    

clr(color, 0.2);
draw_rectangle(xx, yy, xx + 32, yy + 32, false);
clr(c_black, 1);
draw_rectangle(xx, yy, xx + 32, yy + 32, true);
clr(c_white, 1);
fnt();
draw_text(xx + 40, yy, "x" + string(nr));

slotArray[in] = -1;
if (craftingSlotSprite[in] != 0)
    {
     draw_sprite(sTestItem, craftingSlotSprite[in], xx + 16, yy + 16);
     //craftingPreview += string(craftingSlotSprite[in]);
     slotArray[in] = (craftingSlotSprite[in] + 1);
     
     if (mouse_in(xx, xx + 32, yy, yy + 32))
     {
     fnt(fntPixelTiny);
     global.tP[0] = xx + 68;
     global.tP[1] = yy - 6;
     global.tP[2] = scrCraftingGetMaterialText(craftingSlotItemID[in], nr);
     global.tP[3] = xx + 68 + string_width(global.tP[2]);
     global.tP[4] = yy - 6 + string_height(global.tP[2]);
      
     with(oInventoryDepthHelper)
     { 
     clr(c_black, 0.3);    
     draw_roundrect_ext(global.tP[0] - 6, global.tP[1] - 2, global.tP[3] + 4, global.tP[4] + 2, 24, 24, false);
     clr(c_black, 1);    
     draw_roundrect_ext(global.tP[0] - 6, global.tP[1] - 2, global.tP[3] + 4, global.tP[4] + 2, 24, 24, true);
     clr(c_white);
     draw_text_colored(global.tP[0], global.tP[1], global.tP[2]);
     }
      fnt();
     }
    }
else
    {
     if (!craftingSlotOptional[in]) {craftingCompleted = false;}
     draw_sprite(sCraftingIcons, ei, xx, yy);     
    }

#define scrCraftingGetMaterialText
/// scrCraftingGetMaterialText(material, count)

var str, m, c;
str = "";
m   = 0;
c   = 1;

if (argument_count > 0) {m = argument[0];}
if (argument_count > 1) {c = argument[1];}


if (m == itemEnum.itemWood)
    {
     str = scrWordwrap("Základní materiál, slouží zejména jako palivo.", 128, fntPixelTiny);
    }
if (m == itemEnum.itemSteel)
    {
     str = scrWordwrap("Kvalitní kus oceli, jeden z nejběžnějších kovů pro výrobu zbraní.", 128, fntPixelTiny);
    }
if (m == itemEnum.itemStone)
    {
     str = scrWordwrap("Kámen s lehkou přísměsí kovové rudy.", 128, fntPixelTiny);
    }
if (m == itemEnum.itemPearlRed)
    {
     str = scrWordwrap("Červená perla symbolizuje sílu, život a vytrvalost.", 128, fntPixelTiny);
    }
if (m == itemEnum.itemPearlGreen)
    {
     str = scrWordwrap("Zelená perla značí přírodní energii, štěstí a moc.", 128, fntPixelTiny);
    }
return str;

#define scrCraftingCraft
/// scrCraftingCraft(id, craftingCompleted)

var index, i, cc;
index = 0;
cc    = true;

if (argument_count > 0) {index = argument[0];}
if (argument_count > 1) {cc    = argument[1];}


if (cc)
{
// DB Part add entries here
// **********************************************
if (index == 3)
    {
     instance = instance_create(x, y, oTestItem3);
     scrCraftingAddCraftedItemStats(index);
     
     with(instance) {inventoryPickUp();}
    }

// DB End ***************************************    
    
    
// Delete used material
for (i = 0; i < 10; i++)
    {
     if (craftingSlotItemID[i] != -1)
        {
         inventoryDelete(craftingSlotItemID[i], craftingSlotNumber[i]);
        }     
    }  
    
audio_play_sound(sndItemCrafted, 0, false);
}
     
// Cleanup
for (q = 0; q < 10; q++)
    {
    if (craftingSlotID[q] >= 0)
    {
      oInventory.slot[craftingSlotID[q], inv_item_beingUsed] = false;
      craftingSlotSprite[q] = 0;
      craftingSlotID[q]     = 0;
      craftingSlotFree[q]   = true;
      craftingSlotItemID[q] = -1;
    }
    }

#define scrCraftingDbMaterialEnricht
/// scrCraftingDbMaterialEnricht(id, addItem)

var in, ai, ti, tr;
in  = 0;
ai  = false;
tr  = 1;


if (argument_count > 0) {in = argument[0];}
if (argument_count > 1) {ai = argument[1];}

if (in == itemEnum.itemPearlRed)
    {
     if (ai) {ti = instance_create(x, y, oRedPearlLvl2); with(ti) {inventoryPickUp();}}
     tr  = itemEnum.itemPearlRedLvl2;
    }
    
if (ai) {audio_play_sound(sndMaterialUpgrade1, 0, false);}   
return (tr - 1);

#define scrCraftingDbMaterialEnrichtText
/// scrCraftingDbMaterialEnrichtText(id)

var in, t;
in = 0;
t  = "";

if (argument_count > 0) {in = argument[0];}

if (in == itemEnum.itemPearlRed) {t = "Vzácná " + scrColorflag(c_red) + "červená " + scrEndColorflag() + "perla.";}

return t;
#define scrCraftingDrawCraftingSeparator
/// scrCraftingDrawCraftingSeparator(x, y, optional)

var xx,yy,o;
xx = x;
yy = y;
o  = true;

if (argument_count > 0) {xx = argument[0];}
if (argument_count > 1) {yy = argument[1];}
if (argument_count > 2) {o  = argument[2];}

fnt(fntPixelSmall);
clr(c_white, 1);
if (!o) {draw_text(xx, yy, "Jádro:");}
else {draw_text(xx, yy, "Nepovinné:");}

#define scrCraftingAddCraftedItemStats
/// scrCraftingAddCraftedItemStats(index)

var index
index = 0;

if (argument_count > 0) {index = argument[0];}

if (index == 3)
    {
     scrCraftingAddCraftingItemStatsIterate();
    }

#define scrCraftingMaterialDB
/// scrCraftingMaterialDB(callMode, id)

var callMode, index;
callMode = craftingEnum.craftInfo;
index    = 0;
craftingCompleted = true;

tx = tempX;
ty = tempY;

if (argument_count > 0) {callMode = argument[0];}
if (argument_count > 1) {index    = argument[1];}


if (index == 3) // Steel
    {
     if (callMode == craftingEnum.craftCraft)
        {
         scrCraftingDbDrawMaterialSlot(tx, ty, itemEnum.itemWood, 0, 1, 0);
         scrCraftingDbDrawMaterialSlot(tx, ty + 40, itemEnum.itemStone, 1, 2, 3);
        }
    
    }

// Navigation       
if (callMode == craftingEnum.craftCraft)
{
textColor = c_gray; 
if (craftingCompleted) {textColor = c_lime;}


// Draw craft button
     btnColor = c_black;
     if (mouse_in(tx + 16, tx + 112, ty + 170, ty + 190)) 
        {
        btnColor = c_yellow;
        
        if (mouse_check_button_pressed(mb_left) && textColor == c_lime)
            {
             scrCraftingMaterialCraft(index, true);
            }
        }
      
     clr(btnColor, 0.4);
     draw_roundrect(tx + 16, ty + 170, tx + 112, ty + 190, false);
     clr(c_black, 1);
     draw_roundrect(tx + 16, ty + 170, tx + 112, ty + 190, true);
     alg("center", fntPixelSmall);
     clr(textColor, 1);
     draw_text(tx + 64, ty + 180, "[Vytvořit]");     
          
// Draw abort button
     btnColor = c_black;
     if (mouse_in(tx + 128, tx + 240, ty + 170, ty + 190)) 
        {        
        btnColor = c_yellow;  
        
        if (mouse_check_button_pressed(mb_left))
        {     
        scrCraftingCraft(index, false);
        craftingHelper = -1;
        craftingTitleHelper = "";
        }
        }
     
     clr(btnColor, 0.4);
     draw_roundrect(tx + 128, ty + 170, tx + 240, ty + 190, false);
     clr(c_black, 1);
     draw_roundrect(tx + 128, ty + 170, tx + 240, ty + 190, true);
     alg("center", fntPixelSmall);
     clr(c_white, 1);
     draw_text(tx + 184, ty + 180, "[Zrušit]");          
}

#define scrCraftingAddCraftingItemStatsIterate
/// scrCraftingAddCraftingItemStatsIterate()

var i;

for (i = 0; i < 10; i++)
{
if (craftingSlotItemID[i] == itemEnum.itemPearlRed) {instance.vlastnost[vlastnost_stackSezehnuti] += 0.5;}
if (craftingSlotItemID[i] == itemEnum.itemPearlGreen) {instance.vlastnost[vlastnost_bonusove_poskozeni_vuci_zviratum] += 2;}
if (craftingSlotItemID[i] == itemEnum.itemSteel) {instance.vlastnost[vlastnost_poskozeni] += 3;}
if (craftingSlotItemID[i] == itemEnum.itemWood) {instance.vlastnost[vlastnost_max_zivot] += 2;}
}

#define scrCraftingDbDrawMaterialSlot
/// scrCraftingDbDrawMaterialSlot(x, y, itemID, id, numberRequired, emptyImageIndex, optional)

var xx, yy, mr, in, nr, ei, o;
xx = x;
yy = y;
mr = itemEnum.itemWood;
in = 0;
nr = 1;
ei = 1;
o  = false;

if (argument_count > 0) {xx = argument[0];}
if (argument_count > 1) {yy = argument[1];}
if (argument_count > 2) {mr = argument[2];}
if (argument_count > 3) {in = argument[3];}
if (argument_count > 4) {nr = argument[4];}
if (argument_count > 5) {ei = argument[5];}
if (argument_count > 6) {o  = argument[6];}

color = c_black;
craftingSlotNumber[in] = nr;
craftingSlotOptional[in] = o;

if (oInventory.drag = 1 && oInventory.equip_sprite_s[6] = mr && oInventory.equip_sprite_s[5] >= nr)
        { 
         color = c_lime;
        }

if (mouse_in(xx, xx + 32, yy, yy + 32)) 
    {
    color = c_yellow;
    
        if (oInventory.drag = 1 && oInventory.equip_sprite_s[6] = mr && oInventory.equip_sprite_s[5] >= nr)
        { 
         color = c_lime;
        }
    
    if (mouse_check_button_released(mb_left) && color == c_lime)
    {
    oInventory.pre_switch = 1;
    oInventory.draw_item_mouse = 0;
    oInventory.slot[oInventory.h_c, inv_item_beingUsed] = true; 
    craftingSlotID[in] = oInventory.h_c;
    craftingSlotItemID[in] = oInventory.equip_sprite_s[6];

    if (color == c_lime)
        {
        craftingSlotSprite[in] = oInventory.equip_sprite_s[1];
        }
    }    
    
    if (mouse_check_button_pressed(mb_left))
        {
         if (craftingSlotID[in] != -1)
            {
            oInventory.slot[craftingSlotID[in], inv_item_beingUsed] = false;
            craftingSlotSprite[in] = 0;
            craftingSlotID[in] = -1;
            }
        }
    }
    

clr(color, 0.2);
draw_rectangle(xx, yy, xx + 32, yy + 32, false);
clr(c_black, 1);
draw_rectangle(xx, yy, xx + 32, yy + 32, true);
clr(c_white, 1);
fnt();
draw_text(xx + 40, yy, "x" + string(nr));

if (craftingSlotSprite[in] != 0)
    {
     draw_sprite(sTestItem, craftingSlotSprite[in], xx + 16, yy + 16);
     
     fnt(fntPixelTiny);
     draw_text_colored(xx + 64, yy - 6, scrCraftingGetMaterialText(craftingSlotItemID[in], nr));
    }
else
    {
     if (!craftingSlotOptional[in]) {craftingCompleted = false;}
     draw_sprite(sCraftingIcons, ei, xx, yy);     
    }

#define scrCraftingMaterialCraft
/// scrCraftingMaterialCraft(id, craftingCompleted)

var index, i, cc;
index = 0;
cc    = true;

if (argument_count > 0) {index = argument[0];}
if (argument_count > 1) {cc    = argument[1];}


if (cc)
{
// DB Part add entries here
// **********************************************
if (index == 3)
    {
     instance = instance_create(x, y, oMetalSteel);    
     with(instance) {inventoryPickUp();}
    }

// DB End ***************************************    
    
    
// Delete used material
for (i = 0; i < 10; i++)
    {
     if (craftingSlotItemID[i] != -1)
        {
         inventoryDelete(craftingSlotItemID[i], craftingSlotNumber[i]);
        }     
    }  
}
     
// Cleanup
for (q = 0; q < 10; q++)
    {
    if (craftingSlotID[q] >= 0)
    {
      oInventory.slot[craftingSlotID[q], inv_item_beingUsed] = false;
      craftingSlotSprite[q] = 0;
      craftingSlotID[q]     = 0;
      craftingSlotFree[q]   = true;
      craftingSlotItemID[q] = -1;
    }
    }
#define scrCraftingAlchemyDB
/// scrCraftingAlchemyDB(callMode, id)

var callMode, index;
callMode = craftingEnum.craftInfo;
index    = 0;
craftingCompleted = true;

tx = tempX;
ty = tempY;

if (argument_count > 0) {callMode = argument[0];}
if (argument_count > 1) {index    = argument[1];}


if (index == 3) // HP Pot
    {
     if (callMode == craftingEnum.craftCraft)
        {
         scrCraftingDbDrawAlchemySlot(tx, ty, itemEnum.itemHerbSuzenka, 0, 1, itemEnum.itemHerbSuzenka-1);
       //  scrCraftingDbDrawAlchemySlot(tx, ty + 40, itemEnum.itemStone, 1, 2, 3);
        }
    
    }

// Navigation       
if (callMode == craftingEnum.craftCraft)
{
textColor = c_gray; 
if (craftingCompleted) {textColor = c_lime;}


// Draw craft button
     btnColor = c_black;
     if (mouse_in(tx + 16, tx + 112, ty + 170, ty + 190)) 
        {
        btnColor = c_yellow;
        
        if (mouse_check_button_pressed(mb_left) && textColor == c_lime)
            {
             scrCraftingAlchemyCraft(index, true);
            }
        }
      
     clr(btnColor, 0.4);
     draw_roundrect(tx + 16, ty + 170, tx + 112, ty + 190, false);
     clr(c_black, 1);
     draw_roundrect(tx + 16, ty + 170, tx + 112, ty + 190, true);
     alg("center", fntPixelSmall);
     clr(textColor, 1);
     draw_text(tx + 64, ty + 180, "[Vytvořit]");     
          
// Draw abort button
     btnColor = c_black;
     if (mouse_in(tx + 128, tx + 240, ty + 170, ty + 190)) 
        {        
        btnColor = c_yellow;  
        
        if (mouse_check_button_pressed(mb_left))
        {     
        scrCraftingCraft(index, false);
        craftingHelper = -1;
        craftingTitleHelper = "";
        }
        }
     
     clr(btnColor, 0.4);
     draw_roundrect(tx + 128, ty + 170, tx + 240, ty + 190, false);
     clr(c_black, 1);
     draw_roundrect(tx + 128, ty + 170, tx + 240, ty + 190, true);
     alg("center", fntPixelSmall);
     clr(c_white, 1);
     draw_text(tx + 184, ty + 180, "[Zrušit]");          
}

#define scrCraftingDbDrawAlchemySlot
/// scrCraftingDbDrawAlchemySlot(x, y, itemID, id, numberRequired, emptyImageIndex, optional)

var xx, yy, mr, in, nr, ei, o;
xx = x;
yy = y;
mr = itemEnum.itemWood;
in = 0;
nr = 1;
ei = 1;
o  = false;

if (argument_count > 0) {xx = argument[0];}
if (argument_count > 1) {yy = argument[1];}
if (argument_count > 2) {mr = argument[2];}
if (argument_count > 3) {in = argument[3];}
if (argument_count > 4) {nr = argument[4];}
if (argument_count > 5) {ei = argument[5];}
if (argument_count > 6) {o  = argument[6];}

color = c_black;
craftingSlotNumber[in] = nr;
craftingSlotOptional[in] = o;

fnt(fntPixelTiny);
draw_text_colored(xx + 64, yy - 6, scrCraftingGetAlchemyText(mr, nr));

if (oInventory.drag = 1 && oInventory.equip_sprite_s[6] = mr && oInventory.equip_sprite_s[5] >= nr)
        { 
         color = c_lime;
        }

if (mouse_in(xx, xx + 32, yy, yy + 32)) 
    {
    color = c_yellow;
    
        if (oInventory.drag = 1 && oInventory.equip_sprite_s[6] = mr && oInventory.equip_sprite_s[5] >= nr)
        { 
         color = c_lime;
        }
    
    if (mouse_check_button_released(mb_left) && color == c_lime)
    {
    oInventory.pre_switch = 1;
    oInventory.draw_item_mouse = 0;
    oInventory.slot[oInventory.h_c, inv_item_beingUsed] = true; 
    craftingSlotID[in] = oInventory.h_c;
    craftingSlotItemID[in] = oInventory.equip_sprite_s[6];

    if (color == c_lime)
        {
        craftingSlotSprite[in] = oInventory.equip_sprite_s[1];
        }
    }    
    
    if (mouse_check_button_pressed(mb_left))
        {
         if (craftingSlotID[in] != -1)
            {
            oInventory.slot[craftingSlotID[in], inv_item_beingUsed] = false;
            craftingSlotSprite[in] = 0;
            craftingSlotID[in] = -1;
            }
        }
    }
    

clr();
draw_rectangle(xx, yy, xx + 32, yy + 32, true);
clr(c_white, 1);
fnt();
draw_text(xx + 40, yy, "x" + string(nr));

if (craftingSlotSprite[in] != 0)
    {
     draw_sprite(sTestItem, craftingSlotSprite[in], xx + 16, yy + 16);     
    }
else
    {
     if (!craftingSlotOptional[in]) {craftingCompleted = false;}
     
     shader_set(shdBlackWhite);
     draw_sprite(sTestItem, ei, xx + 16, yy + 16);  
     shader_reset();   
    }
    
clr(color, 0.2);
draw_rectangle(xx, yy, xx + 32, yy + 32, false);
clr();

#define scrCraftingGetAlchemyText
/// scrCraftingGetAlchemyText(material, count)

var str, m, c;
str = "";
m   = 0;
c   = 1;

if (argument_count > 0) {m = argument[0];}
if (argument_count > 1) {c = argument[1];}


if (m == itemEnum.itemWood)
    {
     str = scrWordwrap("Základní materiál, slouží zejména jako palivo.", 128, fntPixelTiny);
    }
if (m == itemEnum.itemHerbSuzenka)
    {
     str = "Suženka."
    }
return str;

#define scrCraftingAlchemyCraft
/// scrCraftingAlchemyCraft(id, craftingCompleted)

var index, i, cc;
index = 0;
cc    = true;

if (argument_count > 0) {index = argument[0];}
if (argument_count > 1) {cc    = argument[1];}


if (cc)
{
// DB Part add entries here
// **********************************************
if (index == 3) // Hp POT
    {
     instance = instance_create(x, y, oElixirHP);    
     with(instance) {inventoryPickUp();}
    }

// DB End ***************************************    
    
    
// Delete used material
for (i = 0; i < 10; i++)
    {
     if (craftingSlotItemID[i] != -1)
        {
         inventoryDelete(craftingSlotItemID[i], craftingSlotNumber[i]);
        }     
    }  
}
     
// Cleanup
for (q = 0; q < 10; q++)
    {
    if (craftingSlotID[q] >= 0)
    {
      oInventory.slot[craftingSlotID[q], inv_item_beingUsed] = false;
      craftingSlotSprite[q] = 0;
      craftingSlotID[q]     = 0;
      craftingSlotFree[q]   = true;
      craftingSlotItemID[q] = -1;
    }
    }

#define scrCraftingGetUpgradeText
/// scrCraftingGetUpgradeText(item, count)

var str, m, c;
str = "";
m   = 0;
c   = 1;

if (argument_count > 0) {m = argument[0];}
if (argument_count > 1) {c = argument[1];}


if (m == itemEnum.itemPearlRed)
    {
     str = scrWordwrap("Červená perla.", 128, fntPixelTiny);
    }
if (m == itemEnum.itemPearlGreen)
    {
     str = scrWordwrap("Zelená perla.", 128, fntPixelTiny);
    }
return str;

#define scrCraftingUpgradeStats
/// scrCraftingUpgradeStats()

if (enchantItemID[k] == itemEnum.itemPearlRed) {oInventory.slot_vlastnosti_static[upgradingItemSlotID, vlastnost_stackSezehnuti] += 0.5;}
if (enchantItemID[k] == itemEnum.itemPearlGreen) {oInventory.slot_vlastnosti_static[upgradingItemSlotID, vlastnost_bonusove_poskozeni_vuci_zviratum] += 2;}

#define scrCraftingFoodDB
/// scrCraftingFoodDB(callMode, id)

var callMode, index;
callMode = craftingEnum.craftInfo;
index    = 0;
craftingCompleted = true;

tx = tempX;
ty = tempY;

if (argument_count > 0) {callMode = argument[0];}
if (argument_count > 1) {index    = argument[1];}


if (index == 3) // Cheese
    {
     if (callMode == craftingEnum.craftCraft)
        {
         scrCraftingDbDrawFoodSlot(tx, ty, itemEnum.itemFoodMilk, 0, 3, itemEnum.itemFoodMilk - 1);
        }
    
    }

// Navigation       
if (callMode == craftingEnum.craftCraft)
{
textColor = c_gray; 
if (craftingCompleted) {textColor = c_lime;}


// Draw craft button
     btnColor = c_black;
     if (mouse_in(tx + 16, tx + 112, ty + 170, ty + 190)) 
        {
        btnColor = c_yellow;
        
        if (mouse_check_button_pressed(mb_left) && textColor == c_lime)
            {
             scrCraftingFoodCraft(index, true);
            }
        }
      
     clr(btnColor, 0.4);
     draw_roundrect(tx + 16, ty + 170, tx + 112, ty + 190, false);
     clr(c_black, 1);
     draw_roundrect(tx + 16, ty + 170, tx + 112, ty + 190, true);
     alg("center", fntPixelSmall);
     clr(textColor, 1);
     draw_text(tx + 64, ty + 180, "[Vytvořit]");     
          
// Draw abort button
     btnColor = c_black;
     if (mouse_in(tx + 128, tx + 240, ty + 170, ty + 190)) 
        {        
        btnColor = c_yellow;  
        
        if (mouse_check_button_pressed(mb_left))
        {     
        scrCraftingCraft(index, false);
        craftingHelper = -1;
        craftingTitleHelper = "";
        }
        }
     
     clr(btnColor, 0.4);
     draw_roundrect(tx + 128, ty + 170, tx + 240, ty + 190, false);
     clr(c_black, 1);
     draw_roundrect(tx + 128, ty + 170, tx + 240, ty + 190, true);
     alg("center", fntPixelSmall);
     clr(c_white, 1);
     draw_text(tx + 184, ty + 180, "[Zrušit]");          
}


#define scrCraftingDbDrawFoodSlot
/// scrCraftingDbDrawFoodSlot(x, y, itemID, id, numberRequired, emptyImageIndex, optional)

var xx, yy, mr, in, nr, ei, o;
xx = x;
yy = y;
mr = itemEnum.itemWood;
in = 0;
nr = 1;
ei = 1;
o  = false;

if (argument_count > 0) {xx = argument[0];}
if (argument_count > 1) {yy = argument[1];}
if (argument_count > 2) {mr = argument[2];}
if (argument_count > 3) {in = argument[3];}
if (argument_count > 4) {nr = argument[4];}
if (argument_count > 5) {ei = argument[5];}
if (argument_count > 6) {o  = argument[6];}

color = c_black;
craftingSlotNumber[in] = nr;
craftingSlotOptional[in] = o;

fnt(fntPixelTiny);
draw_text_colored(xx + 64, yy - 6, scrCraftingGetFoodText(mr, nr));

if (oInventory.drag = 1 && oInventory.equip_sprite_s[6] = mr && oInventory.equip_sprite_s[5] >= nr)
        { 
         color = c_lime;
        }

if (mouse_in(xx, xx + 32, yy, yy + 32)) 
    {
    color = c_yellow;
    
        if (oInventory.drag && oInventory.equip_sprite_s[6] = mr && oInventory.equip_sprite_s[5] >= nr)
        { 
         color = c_lime;
        }
    
    if (mouse_check_button_released(mb_left) && color == c_lime)
    {
    oInventory.pre_switch = 1;
    oInventory.draw_item_mouse = 0;
    oInventory.slot[oInventory.h_c, inv_item_beingUsed] = true; 
    craftingSlotID[in] = oInventory.h_c;
    craftingSlotItemID[in] = oInventory.equip_sprite_s[6];

    if (color == c_lime)
        {
        craftingSlotSprite[in] = oInventory.equip_sprite_s[1];
        }
    }    
    
    if (mouse_check_button_pressed(mb_left))
        {
         if (craftingSlotID[in] != -1)
            {
            oInventory.slot[craftingSlotID[in], inv_item_beingUsed] = false;
            craftingSlotSprite[in] = 0;
            craftingSlotID[in] = -1;
            }
        }
    }
    

clr();
draw_rectangle(xx, yy, xx + 32, yy + 32, true);
clr(c_white, 1);
fnt();
draw_text(xx + 40, yy, "x" + string(nr));

if (craftingSlotSprite[in] != 0)
    {
     draw_sprite(sTestItem, craftingSlotSprite[in], xx + 16, yy + 16);     
    }
else
    {
     if (!craftingSlotOptional[in]) {craftingCompleted = false;}
     
     shader_set(shdBlackWhite);
     draw_sprite(sTestItem, ei, xx + 16, yy + 16);  
     shader_reset();   
    }
    
clr(color, 0.2);
draw_rectangle(xx, yy, xx + 32, yy + 32, false);
clr();


#define scrCraftingGetFoodText
/// scrCraftingGetFoodText(material, count)

var str, m, c;
str = "";
m   = 0;
c   = 1;

if (argument_count > 0) {m = argument[0];}
if (argument_count > 1) {c = argument[1];}


if (m == itemEnum.itemWood)
    {
     str = scrWordwrap("Základní materiál, slouží zejména jako palivo.", 128, fntPixelTiny);
    }
if (m == itemEnum.itemHerbSuzenka)
    {
     str = "Suženka."
    }
return str;

#define scrCraftingFoodCraft
/// scrCraftingFoodCraft(id, craftingCompleted)

var index, i, cc;
index = 0;
cc    = true;

if (argument_count > 0) {index = argument[0];}
if (argument_count > 1) {cc    = argument[1];}


if (cc)
{
// DB Part add entries here
// **********************************************
if (index == 3) // Cheese
    {
     inventoryAdd(oCheese, 1);
    }

// DB End ***************************************    
    
    
// Delete used material
for (i = 0; i < 10; i++)
    {
     if (craftingSlotItemID[i] != -1)
        {
         inventoryDelete(craftingSlotItemID[i], craftingSlotNumber[i]);
        }     
    }  
}
     
// Cleanup
for (q = 0; q < 10; q++)
    {
    if (craftingSlotID[q] >= 0)
    {
      oInventory.slot[craftingSlotID[q], inv_item_beingUsed] = false;
      craftingSlotSprite[q] = 0;
      craftingSlotID[q]     = 0;
      craftingSlotFree[q]   = true;
      craftingSlotItemID[q] = -1;
    }
    }
#define scrCraftingFinalizePreviewString
/// scrCraftingFinalizePreviewString()

var a, t_text;
a      = 0;
t_text = "";

for(a = 0; a < celkem_vlastnosti; a++)
      {  
       if (cp[a] != 0)
          {
           switch(a)
                    {
                    case(vlastnost_bonusove_poskozeni_vuci_zviratum):
                         {
                           t_text += "#Poškození vůči zvířatům: "+scrColorText(string(cp[a]), c_lime) + "%";
                           break;                                                                   
                         }
                    case(vlastnost_stackSezehnuti):
                         {
                           t_text += "#Šance na sežehnutí: "+scrColorText(scrColorText(string_format(cp[a], 3, 1), c_lime), c_lime) + "%";
                           break;                                                                   
                         }
                     case(vlastnost_poskozeni):
                         {
                           t_text += "#Poškození: " +scrColorText(string(cp[a]), c_lime);
                           break;                                                                   
                         }
                     case(vlastnost_max_zivot):
                         {
                           t_text += "#Život: "+scrColorText(string(cp[a]), c_lime);                    
                           break;                                                                   
                         }
                     case(vlastnost_stamina_cost):
                         {
                           t_text += "#Stamina za úder: "+scrColorText(string(cp[a]), c_lime);
                           break;                                                                   
                         }
                    case(vlastnost_max_mana):
                         {
                           t_text += "#Mana: "+scrColorText(string(cp[a]), c_lime);
                           break;                                                                   
                         }
                    case(vlastnost_sila):
                         {
                           t_text += "#Síla: "+scrColorText(string(cp[a]), c_lime);
                           break;                                                                   
                         }
                    case(vlastnost_obratnost):
                         {
                           t_text += "#Obratnost: "+scrColorText(string(cp[a]), c_lime);
                           break;                                                                   
                         }
                    case(vlastnost_kovarstvi):
                         {
                           t_text += "#Kovářství: "+scrColorText(string(cp[a]), c_lime);
                           break;                                                                   
                         }
                    case(vlastnost_tezarstvi):
                         {
                           t_text += "#Těžařství: "+scrColorText(string(cp[a]), c_lime);
                           break;                                                                   
                         }
                    case(vlastnost_odolnost):
                         {
                           t_text += "#Odolnost: "+scrColorText(string(cp[a]), c_lime);
                           break;                                                                   
                         }
                    case(vlastnost_vytrvalost):
                         {
                           t_text += "#Vytrvalost: "+scrColorText(string(cp[a]), c_lime);
                           break;                                                                   
                         }
                     case(vlastnost_presnost):
                         {
                           t_text += "#Přesnost: "+scrColorText(string(cp[a]), c_lime);
                           break;                                                                   
                         }
                     case(vlastnost_rychlost):
                         {
                           t_text += "#Rychlost: "+scrColorText(string(cp[a]), c_lime);
                           break;                                                                   
                         }
                    case(vlastnost_zrucnost):
                         {
                           t_text += "#Zručnost: "+scrColorText(string(cp[a]), c_lime);
                           break;                                                                   
                         }
                    case(vlastnost_svadeni):
                         {
                           t_text += "#Svádění: "+scrColorText(string(cp[a]), c_lime);
                           break;                                                                   
                         }
                    case(vlastnost_zastrasovani):
                         {
                           t_text += "#Zastrašování: "+scrColorText(string(cp[a]), c_lime);
                           break;                                                                   
                         }
                    case(vlastnost_dustojnost):
                         {
                           t_text += "#Důstojnost: "+scrColorText(string(cp[a]), c_lime);
                           break;                                                                   
                         }
                    case(vlastnost_vyrecnost):
                         {
                           t_text += "#Výřečnost: "+scrColorText(string(cp[a]), c_lime);
                           break;                                                                   
                         }
                    case(vlastnost_elegance):
                         {
                           t_text += "#Elegance: "+scrColorText(string(cp[a]), c_lime);
                           break;                                                                   
                         }
                    case(vlastnost_cest):
                         {
                           t_text += "#Čest: "+scrColorText(string(cp[a]), c_lime);
                           break;                                                                   
                         }
                         
                    case(vlastnost_kapsarstvi):
                         {
                           t_text += "#Kapsářství: "+scrColorText(string(cp[a]), c_lime);
                           break;                                                                   
                         }
                     case(vlastnost_paceni_zanmku):
                         {
                           t_text += "#Páčení zámků: "+scrColorText(string(cp[a]), c_lime);
                           break;                                                                   
                         }
                     case(vlastnost_vule):
                         {
                           t_text += "#Vůle: "+scrColorText(string(cp[a]), c_lime);
                           break;                                                                   
                         }
                    case(vlastnost_inteligence):
                         {
                           t_text += "#Inteligence: "+scrColorText(string(cp[a]), c_lime);
                           break;                                                                   
                         }
                    case(vlastnost_ritualy):
                         {
                           t_text += "#Rituály: "+scrColorText(string(cp[a]), c_lime);
                           break;                                                                   
                         }
                    case(vlastnost_tradicni_magie):
                         {
                           t_text += "#Tradiční magie: "+scrColorText(string(cp[a]), c_lime);
                           break;                                                                   
                         }
                    case(vlastnost_astralni_videni):
                         {
                           t_text += "#Astrální vidění: "+scrColorText(string(cp[a]), c_lime);
                           break;                                                                   
                         }
                    case(vlastnost_mece):
                         {
                           t_text += "#Meče: "+scrColorText(string(cp[a]), c_lime);
                           break;                                                                   
                         }
                    case(vlastnost_dyky):
                         {
                           t_text += "#Dýky: "+scrColorText(string(cp[a]), c_lime);
                           break;                                                                   
                         }
                    case(vlastnost_luky):
                         {
                           t_text += "#Lukostřelba: "+scrColorText(string(cp[a]), c_lime);
                           break;                                                                   
                         }
                     case(vlastnost_kopi):
                         {
                           t_text += "#Kopí: "+scrColorText(string(cp[a]), c_lime);
                           break;                                                                   
                         }
                     case(vlastnost_jednorucni):
                         {
                           t_text += "#Jednoruční zbraně: "+scrColorText(string(cp[a]), c_lime);
                           break;                                                                   
                         }
                    case(vlastnost_dvojrucni):
                         {
                           t_text += "#Dvojruční zbraně: "+scrColorText(string(cp[a]), c_lime);
                           break;                                                                   
                         }
                    case(vlastnost_stity):
                         {
                           t_text += "#Štíty: "+scrColorText(string(cp[a]), c_lime);
                           break;                                                                   
                         }
                    case(vlastnost_rezistence_vse):
                         {
                           t_text += "#Ochrana proti všem elementům: "+scrColorText(string(cp[a]), c_lime);
                           break;                                                                   
                         }
                    case(vlastnost_rezistence_zeme):
                         {
                           t_text += "#Ochrana proti zemi: "+scrColorText(string(cp[a]), c_lime);
                           break;                                                                   
                         }
                    case(vlastnost_rezistence_ohen):
                         {
                           t_text += "#Ochrana proti ohni: "+scrColorText(string(cp[a]), c_lime);
                           break;                                                                   
                         }
                    case(vlastnost_rezistence_voda):
                         {
                           t_text += "#Ochrana proti vodě: "+scrColorText(string(cp[a]), c_lime);
                           break;                                                                   
                         }
                    case(vlastnost_rezistence_temnota):
                         {
                           t_text += "#Ochrana proti temnotě: "+scrColorText(string(cp[a]), c_lime);
                           break;                                                                   
                         }
                         
                     case(vlastnost_rezistence_svetlo):
                         {
                           t_text += "#Ochrana proti světlu: "+scrColorText(string(cp[a]), c_lime);
                           break;                                                                   
                         }
                    case(vlastnost_rezistence_vitr):
                         {
                           t_text += "#Ochrana proti vodě: "+scrColorText(string(cp[a]), c_lime);
                           break;                                                                   
                         }
                    case(vlastnost_zivot):
                         {
                           t_text += "#Obnoví zdraví: "+scrColorText(string(cp[a]), c_lime);
                           break;                                                                   
                         }
                    case(vlastnost_mana):
                         {
                           t_text += "#Obnoví manu: "+scrColorText(string(cp[a]), c_lime);
                           break;                                                                   
                         }
                    case(vlastnost_stamina):
                         {
                           t_text += "#Obnoví výdrž: "+scrColorText(string(cp[a]), c_lime);
                           break;                                                                   
                         }
                         
                    case(vlastnost_max_stamina):
                         {
                           t_text += "#Výdrž: "+scrColorText(string(cp[a]), c_lime);
                           break;                                                                   
                         }
                    case(vlastnost_kriticka_sance):
                         {
                           t_text += "#Šance na kritický úder: "+scrColorText(string(cp[a]), c_lime);
                           break;                                                                   
                         }
                    case(vlastnost_kriticka_nasobic):
                         {
                           t_text += "#Násobič kritického úderu: "+scrColorText(string(cp[a]), c_lime) + "%";
                           break;                                                                   
                         }
                    case(vlastnost_stit):
                         {
                           t_text += "#Obnoví štít: "+scrColorText(string(cp[a]), c_lime);
                           break;                                                                   
                         }
                    case(vlastnost_max_stit):
                         {
                           t_text += "#Štít: "+scrColorText(string(cp[a]), c_lime);
                           break;                                                                   
                         }
                    case(vlastnost_zkusenosti):
                         {
                           t_text += "#Přidá zkušenosti: "+scrColorText(string(cp[a]), c_lime);
                           break;                                                                   
                         }
                    case(vlastnost_max_zkusenosti):
                         {
                           t_text += "#Zvýší tkušenosti potřebné k dosažení další úravně: "+scrColorText(string(cp[a]), c_lime);
                           break;                                                                   
                         }
                    case(vlastnost_level):
                         {
                           t_text += "#Zváší úroveň: "+scrColorText(string(cp[a]), c_lime);
                           break;                                                                   
                         }
                    case(vlastnost_tick_stamina):
                         {
                           t_text += "#Zvýší rychlost obnovy výdrže: "+scrColorText(string(cp[a]), c_lime);
                           break;                                                                   
                         }
                    case(vlastnost_tick_stamina_add):
                         {
                           t_text += "#Zvýší množství obnovené výdrže: "+scrColorText(string(cp[a]), c_lime);
                           break;                                                                   
                         }
                    case(vlastnost_bonusoveZkusenosti):
                         {
                           t_text += "#Bonusové zkušenosti: "+scrColorText(string(cp[a]), c_lime) + "%";
                           break;                                                                   
                         }
                    case(vlastnost_healHp):
                         {
                           t_text += "#Obnoví zdraví: "+scrColorText(string(cp[a]), c_lime);
                           break;                                                                   
                         }
                    case(vlastnost_healMp):
                         {
                           t_text += "#Obnoví manu: "+scrColorText(string(cp[a]), c_lime);
                           break;                                                                   
                         }
                    case(vlastnost_healStamina):
                         {
                           t_text += "#Obnoví výdrž: "+scrColorText(string(cp[a]), c_lime);
                           break;                                                                   
                         }
                    case(vlastnost_healShield):
                         {
                           t_text += "#Obnoví štít: "+scrColorText(string(cp[a]), c_lime);
                           break;                                                                   
                         }             
  }
 }
}
return (t_text);
#define scrCraftingStructuresDB
/// scrCraftingStructuresDB(callMode, id)

var callMode, index, t;
callMode = craftingEnum.craftInfo;
index    = 0;
craftingCompleted = true;
t = false;

tx = tempX;
ty = tempY;

if (argument_count > 0) {callMode = argument[0];}
if (argument_count > 1) {index    = argument[1];}


dbID = index;
if (index == 3 ) // Campfire
    {
     scrCraftingDbDrawSlot(tx, ty, materialEnum.materialWood, 0, 3, 0);
    }

// Navigation       
if (callMode == craftingEnum.craftCraft)
{
textColor = c_gray; 
if (craftingCompleted) {textColor = c_lime;}


// Draw craft button
     btnColor = c_black;
     if (mouse_in(tx + 16, tx + 112, ty + 170, ty + 190)) 
        {
        btnColor = c_yellow;
        
        if (mouse_check_button_pressed(mb_left) && textColor == c_lime)
            {
             scrCraftingStructuresCraft(index, true);
            }
        }
      
     clr(btnColor, 0.4);
     draw_roundrect(tx + 16, ty + 170, tx + 112, ty + 190, false);
     clr(c_black, 1);
     draw_roundrect(tx + 16, ty + 170, tx + 112, ty + 190, true);
     alg("center", fntPixelSmall);
     clr(textColor, 1);
     draw_text(tx + 64, ty + 180, "[Vytvořit]");     
          
// Draw abort button
     btnColor = c_black;
     if (mouse_in(tx + 128, tx + 240, ty + 170, ty + 190)) 
        {        
        btnColor = c_yellow;  
        
        if (mouse_check_button_pressed(mb_left))
        {     
        scrCraftingCraft(index, false);
        craftingHelper = -1;
        craftingTitleHelper = "";
        craftingPreview = "";
        cStep = false;
        for(i = 0; i < celkem_vlastnosti; i++) {cp[i] = 0;}
        }
        }
     
     clr(btnColor, 0.4);
     draw_roundrect(tx + 128, ty + 170, tx + 240, ty + 190, false);
     clr(c_black, 1);
     draw_roundrect(tx + 128, ty + 170, tx + 240, ty + 190, true);
     alg("center", fntPixelSmall);
     clr(c_white, 1);
     draw_text(tx + 184, ty + 180, "[Zrušit]");          
}


#define scrCraftingStructturesDbDrawSlot
/// scrCraftingStructturesDbDrawSlot(x, y, materialRequired, id, numberRequired, emptyImageIndex, optional)

var xx, yy, mr, in, nr, ei, o;
xx = x;
yy = y;
mr = materialEnum.materialMetal;
in = 0;
nr = 1;
ei = 1;
o  = false;

if (argument_count > 0) {xx = argument[0];}
if (argument_count > 1) {yy = argument[1];}
if (argument_count > 2) {mr = argument[2];}
if (argument_count > 3) {in = argument[3];}
if (argument_count > 4) {nr = argument[4];}
if (argument_count > 5) {ei = argument[5];}
if (argument_count > 6) {o  = argument[6];}

color = c_black;
craftingSlotNumber[in] = nr;
craftingSlotOptional[in] = o;

if (oInventory.drag && oInventory.equip_sprite_s[3] = mr && oInventory.equip_sprite_s[5] >= nr)
        { 
         color = c_lime;
        }

if (mouse_in(xx, xx + 32, yy, yy + 32)) 
    {
    color = c_yellow;
    
        if (oInventory.drag && oInventory.equip_sprite_s[3] = mr && oInventory.equip_sprite_s[5] >= nr)
        { 
         color = c_lime;
        }
    
    if (mouse_check_button_released(mb_left) && color == c_lime)
    {
    oInventory.pre_switch = 1;
    oInventory.draw_item_mouse = 0;
    oInventory.slot[oInventory.h_c, inv_item_beingUsed] = true; 
    craftingSlotID[in] = oInventory.h_c;
    craftingSlotItemID[in] = oInventory.equip_sprite_s[6];
    cStep = true;

    if (color == c_lime)
        {
        craftingSlotSprite[in] = oInventory.equip_sprite_s[1];
        }
    }    
    
    if (mouse_check_button_pressed(mb_left))
        {
         if (craftingSlotID[in] != -1)
            {
            oInventory.slot[craftingSlotID[in], inv_item_beingUsed] = false;
            craftingSlotSprite[in] = 0;
            craftingSlotID[in] = -1;
            cStep = true;
            forceDB = true;
            scrCraftingStructuresDB(craftingEnum.craftInfo, dbID);
            }
        }
    }
    

clr(color, 0.2);
draw_rectangle(xx, yy, xx + 32, yy + 32, false);
clr(c_black, 1);
draw_rectangle(xx, yy, xx + 32, yy + 32, true);
clr(c_white, 1);
fnt();
draw_text(xx + 40, yy, "x" + string(nr));

slotArray[in] = -1;
if (craftingSlotSprite[in] != 0)
    {
     draw_sprite(sTestItem, craftingSlotSprite[in], xx + 16, yy + 16);
     //craftingPreview += string(craftingSlotSprite[in]);
     slotArray[in] = (craftingSlotSprite[in] + 1);
     
     if (mouse_in(xx, xx + 32, yy, yy + 32))
     {
     fnt(fntPixelTiny);
     global.tP[0] = xx + 68;
     global.tP[1] = yy - 6;
     global.tP[2] = scrCraftingStructuresGetMaterialText(craftingSlotItemID[in], nr);
     global.tP[3] = xx + 68 + string_width(global.tP[2]);
     global.tP[4] = yy - 6 + string_height(global.tP[2]);
      
     with(oInventoryDepthHelper)
     { 
     clr(c_black, 0.3);    
     draw_roundrect_ext(global.tP[0] - 6, global.tP[1] - 2, global.tP[3] + 4, global.tP[4] + 2, 24, 24, false);
     clr(c_black, 1);    
     draw_roundrect_ext(global.tP[0] - 6, global.tP[1] - 2, global.tP[3] + 4, global.tP[4] + 2, 24, 24, true);
     clr(c_white);
     draw_text_colored(global.tP[0], global.tP[1], global.tP[2]);
     }
      fnt();
     }
    }
else
    {
     if (!craftingSlotOptional[in]) {craftingCompleted = false;}
     draw_sprite(sCraftingIcons, ei, xx, yy);     
    }


#define scrCraftingStructuresGetMaterialText
/// scrCraftingStructuresGetMaterialText(material, count)

var str, m, c;
str = "";
m   = 0;
c   = 1;

if (argument_count > 0) {m = argument[0];}
if (argument_count > 1) {c = argument[1];}


if (m == itemEnum.itemWood)
    {
     str = scrWordwrap("Základní materiál, slouží zejména jako palivo.", 128, fntPixelTiny);
    }
if (m == itemEnum.itemSteel)
    {
     str = scrWordwrap("Kvalitní kus oceli, jeden z nejběžnějších kovů pro výrobu zbraní.", 128, fntPixelTiny);
    }
if (m == itemEnum.itemStone)
    {
     str = scrWordwrap("Kámen s lehkou přísměsí kovové rudy.", 128, fntPixelTiny);
    }
if (m == itemEnum.itemPearlRed)
    {
     str = scrWordwrap("Červená perla symbolizuje sílu, život a vytrvalost.", 128, fntPixelTiny);
    }
if (m == itemEnum.itemPearlGreen)
    {
     str = scrWordwrap("Zelená perla značí přírodní energii, štěstí a moc.", 128, fntPixelTiny);
    }
return str;


#define scrCraftingStructuresCraft
/// scrCraftingStructuresCraft(id, craftingCompleted)

var index, i, cc;
index = 0;
cc    = true;

if (argument_count > 0) {index = argument[0];}
if (argument_count > 1) {cc    = argument[1];}


if (cc)
{
// DB Part add entries here
// **********************************************
if (index == 3)
    {
     instance = instance_create(x, y, oBuildHelper);
    }

// DB End ***************************************    
    
    
// Delete used material
for (i = 0; i < 10; i++)
    {
     if (craftingSlotItemID[i] != -1)
        {
         inventoryDelete(craftingSlotItemID[i], craftingSlotNumber[i]);
        }     
    }  
    
audio_play_sound(sndItemCrafted, 0, false);
}
     
// Cleanup
for (q = 0; q < 10; q++)
    {
    if (craftingSlotID[q] >= 0)
    {
      oInventory.slot[craftingSlotID[q], inv_item_beingUsed] = false;
      craftingSlotSprite[q] = 0;
      craftingSlotID[q]     = 0;
      craftingSlotFree[q]   = true;
      craftingSlotItemID[q] = -1;
    }
    }
