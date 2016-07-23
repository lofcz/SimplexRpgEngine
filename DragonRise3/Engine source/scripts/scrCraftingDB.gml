#define scrCraftingDB
/// scrCraftingDB(callMode, id)

var callMode, index;
callMode = craftingEnum.craftInfo;
index    = 0;
craftingCompleted = true;

tx = tempX;
ty = tempY;

if (argument_count > 0) {callMode = argument[0];}
if (argument_count > 1) {index    = argument[1];}


if (index == 3) // Wooden sword
    {
     if (callMode == craftingEnum.craftCraft)
        {
         scrCraftingDbDrawSlot(tx, ty, materialEnum.materialWood, 0);
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
/// scrCraftingDbDrawSlot(x, y, materialRequired, id, numberRequired, emptyImageIndex)

var xx, yy, mr, in, nr, ei;
xx = x;
yy = y;
mr = materialEnum.materialMetal;
in = 0;
nr = 1;
ei = 1;

if (argument_count > 0) {xx = argument[0];}
if (argument_count > 1) {yy = argument[1];}
if (argument_count > 2) {mr = argument[2];}
if (argument_count > 3) {in = argument[3];}
if (argument_count > 4) {nr = argument[4];}
if (argument_count > 5) {ei = argument[5];}

color = c_black;
craftingSlotNumber[in] = nr;

if (oInventory.drag = 1 && oInventory.equip_sprite_s[3] = mr && oInventory.equip_sprite_s[5] >= nr)
        { 
         color = c_lime;
        }

if (mouse_in(xx, xx + 32, yy, yy + 32)) 
    {
    color = c_yellow;
    
        if (oInventory.drag = 1 && oInventory.equip_sprite_s[3] = mr && oInventory.equip_sprite_s[5] >= nr)
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
     draw_sprite(sTestItem, craftingSlotSprite[in], xx, yy);
     
     fnt(fntPixelTiny);
     draw_text_colored(xx + 64, yy - 6, scrCraftingGetMaterialText(craftingSlotItemID[in], nr));
    }
else
    {
     craftingCompleted = false;
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

if (m == itemEnum.itemPearlRed)
    {
     str = "Šance na aplikování efektu " + scrColorflag(c_red) + "#sežehnutí " + scrEndColorflag() + "při zásahu " + string(c * 0.5) + "%";
    }
if (m == itemEnum.itemPearlGreen)
    {
     str = "Poškození vůči zvířátům " + scrColorflag(c_lime) + "+ " + string(c * 2) + scrEndColorflag() + "%";
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
     if (craftingSlotItemID[0] == itemEnum.itemPearlRed) {instance.vlastnost[vlastnost_stackSezehnuti] += 0.5;}
     if (craftingSlotItemID[0] == itemEnum.itemPearlGreen) {instance.vlastnost[vlastnost_bonusove_poskozeni_vuci_zviratum] += 2;}
     
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
