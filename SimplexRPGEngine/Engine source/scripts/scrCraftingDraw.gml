/// scrCraftingDraw()

var xpos, ypos;
xpos = view_xview + 288;
ypos = view_yview;

// Test form resoluttion
clr(c_black, 0.4);
draw_rectangle(xpos, ypos, xpos + 256, ypos + 288, false);
clr(1);

// Form name (header)
clr();
draw_set_font(fntPixelHuge);
draw_sprite(sInventoryTitle, 0, xpos - 32, y);
scrCenterText();
draw_text(xpos + 128, ypos + 14, craftingTitle);
draw_set_font(fntPixelSmall);
scrCenterText(0);

// Draw menu
// ************************************************

if (craftingMenuAlpha > 0)
    {
     tempX = xpos;
     tempY = ypos + 48;
     
     // Draw array craftingMenuIndex
     for (i = 0; i < array_length_1d(craftingMenuIndex); i++)
        {
         tempColor = c_black;
         if (mouse_in(tempX, tempX + 256, tempY, tempY + 24) && craftingSelectedIndex = -1) {tempColor = c_yellow; if (mouse_check_button_pressed(mb_left)) {craftingSelectedIndex = i; selectedIndexY = 0;}}
         
         if (craftingSelectedIndex != i) // Normal indexes
         {
         clr(tempColor, min(craftingMenuAlpha, 0.4));
         draw_roundrect(tempX, tempY, tempX + 256, tempY + 24, false);
         clr(c_black, min(craftingMenuAlpha, 1));
         draw_roundrect(tempX, tempY, tempX + 256, tempY + 24, true);        
         clr(c_white, min(craftingMenuAlpha, 1));
         alg("center", fntPixel);
         draw_text(tempX + 128, tempY + 12, craftingMenuIndex[i]); 
         alg();
         }
         else // Selected index
         {
         clr(tempColor, 0.4);
         draw_roundrect(tempX, tempY - selectedIndexY, tempX + 256, tempY + 24 - selectedIndexY, false);
         clr(c_black, 1);
         draw_roundrect(tempX, tempY - selectedIndexY, tempX + 256, tempY + 24 - selectedIndexY, true);        
         clr(c_white);
         alg("center", fntPixel);
         draw_text(tempX + 128, tempY + 12 - selectedIndexY, craftingMenuIndex[i]); 
         alg();                 
         }
         tempY += 30;
        }
    
    // In case selected index is choosen, fade menu
    if (craftingSelectedIndex != -1)
        {
         craftingMenuAlpha = max(lerp(craftingMenuAlpha, -0.02, 0.1), 0);
         selectedIndexY = lerp(selectedIndexY, (craftingSelectedIndex * 30), 0.1);
        }
    }
else
{
         // Draw selected index
         tempX = xpos;
         tempY = ypos + 49;
         
         clr(tempColor, 0.4);
         draw_roundrect(tempX, tempY, tempX + 256, tempY + 24 + craftingDetailsHeight, false);
         clr(c_black, 1);
         draw_roundrect(tempX, tempY, tempX + 256, tempY + 24 + craftingDetailsHeight, true);        
         clr(c_white, craftingDetailsAlpha);
         alg();
         draw_text_colored(tempX + 2, tempY + 32, string(craftingTitleHelper2));
         clr(c_white);
         alg("center", fntPixel);
         if (craftingTitleHelper == "") 
            {
            draw_text(tempX + 128, tempY + 12, craftingMenuIndex[craftingSelectedIndex]); 
            alg();
            
            // Return button (x)
            tc = c_white;            
            if (mouse_in(tempX + 230, tempX + 250, tempY, tempY + 20))
                {
                 tc = c_lime;
                 
                 if (mouse_check_button_pressed(mb_left))
                    {
                     craftingSelectedIndex = -1;
                     craftingMenuAlpha = 1;
                    }
                }                
            clr(tc, 1);
            draw_text(tempX + 240, tempY, "x");            
            }            
            else 
                {
                alg("center", fntPixel);
                draw_text(tempX + 128, tempY + 12, craftingTitleHelper);
                alg();
                
                // Handle crafting details form
                // *************************************************
                
                if (!craftingDetails) 
                    {
                    if (craftingDetailsHeight > 0) {craftingDetailsHeight = lerp(craftingDetailsHeight, -1, 0.1);}
                    if (craftingDetailsAlpha > 0) {craftingDetailsAlpha = lerp(craftingDetailsAlpha, -0.01, 0.1);}
                    
                    tc = c_white;
                    
                     if (mouse_in(tempX + 230, tempX + 250, tempY, tempY + 20))
                        {
                        tc = c_lime;
                 
                        if (mouse_check_button_pressed(mb_left))
                            {
                             craftingDetails = true;
                            }
                        }
                        
                    clr(tc, 1);
                    draw_text_transformed(tempX + 245, tempY + 22, "^", 1, 1, 180);                   
                    }
                 else
                    {
                    if (craftingDetailsHeight < 215) {craftingDetailsHeight = lerp(craftingDetailsHeight, 216, 0.1);}
                    else {if (craftingDetailsAlpha < 1) {craftingDetailsAlpha = lerp(craftingDetailsAlpha, 1.01, 0.1);}}
                    
                    tc = c_white;
                    
                     if (mouse_in(tempX + 230, tempX + 250, tempY, tempY + 20))
                        {
                        tc = c_lime;
                 
                        if (mouse_check_button_pressed(mb_left))
                            {
                             craftingDetails = false;
                             for (var i = 0; i < min(array_height_2d(oInventory.slot), ((oInventory.currentPage*oInventory.slotsPerPage) + oInventory.slotsPerPage)); i++)
                                {
                                 oInventory.slot[i, inv_item_beingUsed] = false;
                                }
                            }
                        }
                        
                    clr(tc, 1);
                    draw_text(tempX + 240, tempY, "^");                                       
                    }
                
                }
         alg();          
         
         // Draw crafting form    
         // ************************************************
         tempX = xpos;
         tempY = ypos + 96;
             
         // Creating item form 
         if (craftingSelectedIndex == 0 && craftingHelper == -1 && !craftingDetails)
            {    
            j = 0;        
            
            // Draw frames
            for (i = 0; i < craftingEntriesPerPage; i++)
                {
                 clr(c_black, 1);
                 draw_rectangle(tempX, tempY, tempX + 32, tempY + 32, true);
                 clr(c_white, 0.1);
                 draw_rectangle(tempX, tempY, tempX + 32, tempY + 32, false);
                 
                 if (mouse_in(tempX, tempX + 32, tempY, tempY + 32))
                    {
                     clr(c_yellow, 0.3);
                     draw_rectangle(tempX, tempY, tempX + 32, tempY + 32, false);                     
                    }

                 tempX += 32;
                 j++;
                 if (j == craftingEntriesPerRow) {j = 0; tempX = xpos; tempY += 32;}
                 clr();
                }
                
            // Draw known items
            tempX = xpos;
            tempY = ypos + 96;   
            j = 0;
            fnt(fntPixel);
            var z = apiPlayerGetPropertyValue(vlastnost_zrucnost);
            
            for (i = 0; i < ds_list_size(craftingKnownItems); i++)
                {
                 var v = ds_list_find_value(craftingKnownItems, i);
                 
                 draw_sprite(sTestItem, craftingItemsSprite[craftingPageSelected, v], tempX+16, tempY+16);
                 if (craftingItemsNewFlag[craftingPageSelected, v]) {draw_text_colour(tempX + 25, tempY, "!", c_yellow, c_yellow, c_yellow, c_yellow, 1);}
                 if (z >= craftingItemsLevelReq[craftingPageSelected, v]) {u = true;} else {u = false;} 
                 if (!u) {clr(c_black, 0.5); draw_rectangle(tempX, tempY, tempX + 32, tempY + 32, false); clr();}
                 
                 // On-Hover
                 if (mouse_in(tempX, tempX + 32, tempY, tempY + 32))
                 {               
                 fnt();
                 text  = craftingItemsName[craftingPageSelected, v];
                 color = c_white;
                 
                 if (!u) {color = c_red; text = "Vyžaduje zručnost na úrovni " + string(craftingItemsLevelReq[craftingPageSelected, v]) + ".";}
                 
                 clr(c_black, 0.4);
                 draw_roundrect(tempX + 16, tempY + 16, tempX + 32 + string_width(text), tempY + 42, false);
                 clr(c_black, 1);
                 draw_roundrect(tempX + 16, tempY + 16, tempX + 32 + string_width(text), tempY + 42, true);
                 clr(color, 1);
                 draw_text(tempX + 24, tempY + 16, text);
                 clr();
                 
                 if (mouse_check_button_pressed(mb_left) && ds_list_find_index(craftingKnownItems, v) != -1 && u)
                    {
                     craftingHelper = 0;
                     if (craftingItemsNewFlag[craftingPageSelected, v]) {craftingItemsNewFlag[craftingPageSelected, v] = 0;}   
                                           
                     craftingSelectedItem = v;
                     craftingTitleHelper = craftingItemsName[craftingPageSelected, v];
                     craftingTitleHelper2 = craftingDetailsText[craftingPageSelected, v];                  
                    } 
                 }
                 
                 tempX += 32;
                 j++;
                 if (j == craftingEntriesPerRow) {j = 0; tempX = xpos; tempY += 32;}
                 clr();                
                }

            }   
         
       // Crafting details form (item to creaft is selected)
       if (craftingSelectedIndex == 0 && craftingHelper == 0 && !craftingDetails)
          {
            tempX = xpos;
            tempY = ypos + 96;   
            
            scrCraftingDB(craftingEnum.craftCraft, craftingSelectedItem);            
          }
          
       // Crafting details form - Upgrade item
       // ****************************************************************************
         if (craftingSelectedIndex == 1)
            {
             tempX = xpos;
             tempY = ypos + 96; 
             color = c_white;
                        
             if (oInventory.drag && oInventory.equip_sprite_s[3] == materialEnum.materialNone)
                {
                 color = c_lime;
                }
             
             // Draw slot for item to be upgraded      
             clr(color, 0.1);
             draw_roundrect(tempX + 96, tempY, tempX + 128, tempY + 32, false);
             clr();
             draw_roundrect(tempX + 96, tempY, tempX + 128, tempY + 32, true);
             
             if (upgradingItemSprite > 0) {draw_sprite(sTestItem, upgradingItemSprite, tempX + 96 + 16, tempY + 16);}

             
             // Slot for input item
             if (mouse_in(tempX + 96, tempX + 128, tempY, tempY + 32) && (color == c_lime || upgradingItemID != -1))
                {
                  // Put in
                  if (mouse_check_button_released(mb_left) && upgradingItemID == -1)
                     {
                      oInventory.pre_switch                               = true;
                      oInventory.draw_item_mouse                          = false;
                      oInventory.slot[oInventory.h_c, inv_item_beingUsed] = true;
                      upgradingItemID                                     = oInventory.equip_sprite_s[6];
                      upgradingItemSlotID                                 = oInventory.h_c;
                      upgradingItemSprite                                 = oInventory.equip_sprite_s[1];
                     }
                 
                  // Take out
                  if (mouse_check_button_pressed(mb_left))
                    {
                     // Remove all unatached materials
                     for (i = 0; i < 3; i++)
                        {
                         if (upgradingItemSlotID > 0)
                         {
                         if (enchantItemSprite[i] > 0)
                            {
                             oInventory.slot[enchantItemSlotID[i], inv_item_beingUsed] = false;
                             enchantItemID[i]     = -1;
                             enchantItemSlotID[i] = -1;
                             enchantItemSprite[i] = 0;                             
                            }
                         }
                        }    
                       
                     // Remove upgraded item 
                     upgradingItemSprite = -1;  
                     upgradingItemID     = -1;      
                     oInventory.slot[upgradingItemSlotID, inv_item_beingUsed] = false;   
                     upgradingItemSlotID = -1;                                                
                    }
                }      
              
           
            // Slot for upgrade material
            if (upgradingItemID != -1)
                {
                 // Draw all upgrade slots
                 for (i = 0; i < oInventory.slot_vlastnosti[upgradingItemSlotID, vlastnost_maxUpgrade]; i++)
                 {
                 color = c_white;
                 
                 if (oInventory.drag = 1 && (oInventory.equip_sprite_s[3] = oInventory.slot_vlastnosti[upgradingItemSlotID, vlastnost_upgradeMaterial1 + i] && (oInventory.slot_vlastnosti[upgradingItemSlotID, vlastnost_upgradeMaterial1 + i] != materialEnum.materialNone)))
                    {
                     color = c_lime;
                    }
                 
                 // Attach item  
                 if (mouse_in(tempX, tempX + 32, tempY + 32 + (48 * i), tempY + 64 + (48 * i)) && (color == c_lime || enchantItemSprite[i] != 0))
                    {
                        // If slot is free, attach item
                        if (mouse_check_button_released(mb_left) && oInventory.slot_vlastnosti[upgradingItemSlotID, vlastnost_upgradeSprite1 + i] = 0)
                            {
                             oInventory.pre_switch                               = true;
                             oInventory.draw_item_mouse                          = false;
                             oInventory.slot[oInventory.h_c, inv_item_beingUsed] = true;
                             enchantItemID[i]                                    = oInventory.equip_sprite_s[6];
                             enchantItemSlotID[i]                                = oInventory.h_c;
                             enchantItemSprite[i]                                = oInventory.equip_sprite_s[1];
                            }    
                             
                       // If attached item isnt'baked, remove it    
                       if (mouse_check_button_pressed(mb_left) && !oInventory.slot_vlastnosti[upgradingItemSlotID, vlastnost_upgradeBaked1 + i])
                            {
                             oInventory.slot[enchantItemSlotID[i], inv_item_beingUsed] = false;
                             enchantItemID[i]     = -1;
                             enchantItemSlotID[i] = -1;
                             enchantItemSprite[i] = 0;                                                        
                            }           
                    }
                    
                 clr(color, 0.1);
                 draw_roundrect(tempX, tempY + 32 + (48 * i), tempX + 32, tempY + 64 + (48 * i), false);
                 clr();
                 draw_roundrect(tempX, tempY + 32 + (48 * i), tempX + 32, tempY + 64 + (48 * i), true);  
                  
                 
                 // Draw icon for empty slots
                 if (enchantItemSprite[i] <= 0 && oInventory.slot_vlastnosti[upgradingItemSlotID, vlastnost_upgradeSprite1 + i] <= 0 && oInventory.slot_vlastnosti[upgradingItemSlotID, vlastnost_upgradeMaterial1 + i] > 0)
                 {   
                 draw_sprite(sCraftingIcons, oInventory.slot_vlastnosti[upgradingItemSlotID, vlastnost_upgradeMaterial1 + i], tempX, tempY + 32 + (48 * i));
                 }
                 
                 // Draw sprite & text for equiped slots
                 if (enchantItemSprite[i] <= 0)
                    {
                     if (oInventory.slot_vlastnosti[upgradingItemSlotID, vlastnost_upgradeSprite1 + i] > 0)
                        {
                         draw_sprite(sTestItem, oInventory.slot_vlastnosti[upgradingItemSlotID, vlastnost_upgradeSprite1 + i], tempX + 16, tempY + 32 + (48 * i) + 16);                        
                         clr(c_white, 1);
                         fnt(fntPixelTiny);
                         draw_text_colored(tempX + 40, tempY + 32 + (48 * i), scrCraftingGetMaterialText(oInventory.slot_vlastnosti[upgradingItemSlotID, vlastnost_upgradeID1 + i], 1));
                         draw_sprite(sLockIcon, 0, tempX + 16, tempY  + (48 * (i + 1))); 
                         draw_text_colored(tempX + 40, tempY + 32 + (48 * i), scrCraftingGetUpgradeText(oInventory.slot_vlastnosti[upgradingItemSlotID, vlastnost_upgradeID1 + i], 1));
                                             
                        }               
                    }
                else
                    {
                    if (enchantItemSprite[i] > 0) 
                    {
                    draw_sprite(sTestItem, enchantItemSprite[i], tempX + 16, tempY + 32 + (48 * i) + 16);
                    clr(c_white, 1);
                    fnt(fntPixelTiny);
                    draw_text_colored(tempX + 40, tempY + 32 + (48 * i), scrCraftingGetUpgradeText(enchantItemID[i], 1));
                    
                    // Draw lock icon for baked slots
                    if (oInventory.slot_vlastnosti[upgradingItemSlotID, vlastnost_upgradeBaked1 + i])
                        {
                         draw_sprite(sLockIcon, 0, tempX + 16, tempY  + (48 * (i + 1))); 
                        }
                    }
                    }                 
                 }             
                } 
                
                             
                // Draw navigation
                // ******************************************                
                textColor = c_gray;
                bcgColor  = c_black;
                
                // Check for ability to confirm crafting
                if (upgradingItemSlotID >= 0)
                {
                for (i = 0; i < 3; i++)
                    {
                     if (enchantItemSprite[i] > 0 && !oInventory.slot_vlastnosti[upgradingItemSlotID, vlastnost_upgradeBaked1 + i])
                        {
                         textColor = c_lime;
                         break;
                        }
                    }  
                }
                   
                // Check for on-hover event
                if (mouse_in(tempX + 16, tempX + 112, tempY + 170, tempY + 190))
                    {
                     bcgColor = c_yellow;
                     
                     // Confirm crafting
                     if (mouse_check_button_pressed(mb_left) && textColor == c_lime)
                        {
                        for (k = 0; k < 3; k++)
                            {
                            if (enchantItemSprite[k] > 0 && !oInventory.slot_vlastnosti[upgradingItemSlotID, vlastnost_upgradeBaked1 + k])
                                {
                                inventoryDelete(enchantItemID[k], 1);
                                scrCraftingUpgradeStats();
                                audio_play_sound(sndItemUpgrade1, 0, false);
                                oInventory.slot_vlastnosti[upgradingItemSlotID, vlastnost_upgradeBaked1 + k] = true;
                                oInventory.slot_vlastnosti[upgradingItemSlotID, vlastnost_upgradeSprite1 + k] = enchantItemSprite[k];  
                                oInventory.slot_vlastnosti[upgradingItemSlotID, vlastnost_upgradeID1 + k] = enchantItemID[k];                                  
                                oInventory.slot[enchantItemSlotID[k], inv_item_beingUsed] = false;                                                                                         
                                }
                            }
                            
                         // Remove all unatached materials
                         for (i = 0; i < 3; i++)
                            {
                             if (upgradingItemSlotID > 0)
                                {
                                if (enchantItemSprite[i] > 0 && !oInventory.slot_vlastnosti[upgradingItemSlotID, vlastnost_upgradeBaked1 + i])
                                    {
                                     oInventory.slot[enchantItemSlotID[i], inv_item_beingUsed] = false;
                                     enchantItemID[i]     = -1;
                                     enchantItemSlotID[i] = -1;
                                     enchantItemSprite[i] = 0;                             
                                    }
                                }
                            }    
                       
                        // Remove upgraded item 
                        upgradingItemSprite = -1;  
                        upgradingItemID     = -1;      
                        oInventory.slot[abs(upgradingItemSlotID), inv_item_beingUsed] = false;   
                        upgradingItemSlotID = -1;                                                    
                        }
                    }
                    
                // Draw "upgrade button"
                clr(bcgColor, 0.4);
                draw_roundrect(tempX + 16, tempY + 170, tempX + 112, tempY + 190, false);
                clr(c_black, 1);
                draw_roundrect(tempX + 16, tempY + 170, tempX + 112, tempY + 190, true);
                alg("center", fntPixelSmall);
                clr(textColor, 1);
                draw_text(tempX + 64, tempY + 180, "[Vylepšit]");     
                
                // Draw "abort" button
                bcgColor = c_black;
                
                if (mouse_in(tempX + 128, tempX + 240, tempY + 170, tempY + 190))
                    {
                     bcgColor = c_yellow;
                     
                     if (mouse_check_button_pressed(mb_left))
                        {
                         // Remove all unatached materials
                         for (i = 0; i < 3; i++)
                            {
                             if (upgradingItemSlotID >= 0)
                                {
                                if (enchantItemSprite[i] > 0 )
                                    {
                                     oInventory.slot[enchantItemSlotID[i], inv_item_beingUsed] = false;
                                     enchantItemID[i]     = -1;
                                     enchantItemSlotID[i] = -1;
                                     enchantItemSprite[i] = 0;                             
                                    }
                                }
                            }    
                       
                        // Remove upgraded item 
                        upgradingItemSprite = -1;  
                        upgradingItemID     = -1;      
                        if (upgradingItemSlotID >= 0) {oInventory.slot[upgradingItemSlotID, inv_item_beingUsed] = false;}     
                        upgradingItemSlotID = -1;  
                        
                        // Return to main menu
                        craftingHelper = -1;
                        craftingTitleHelper = "";
                        craftingSelectedIndex = -1;
                        craftingMenuAlpha = 1;
                        }                     
                    }     
                    
                clr(bcgColor, 0.4);
                draw_roundrect(tempX + 128, tempY + 170, tempX + 240, tempY + 190, false);
                clr(c_black, 1);
                draw_roundrect(tempX + 128, tempY + 170, tempX + 240, tempY + 190, true);
                alg("center", fntPixelSmall);
                clr(c_white, 1);
                draw_text(tempX + 184, tempY + 180, "[Zrušit]");          
                                      
            }  
            
      // Crafting material form
      // *****************************************************************************
      if (craftingSelectedIndex == 2 && craftingHelper == -1 && !craftingDetails)
            {    
            j = 0;        
            
            // Draw frames
            for (i = 0; i < craftingEntriesPerPage; i++)
                {
                 clr(c_black, 1);
                 draw_rectangle(tempX, tempY, tempX + 32, tempY + 32, true);
                 clr(c_white, 0.1);
                 draw_rectangle(tempX, tempY, tempX + 32, tempY + 32, false);
                 
                 if (mouse_in(tempX, tempX + 32, tempY, tempY + 32))
                    {
                     clr(c_yellow, 0.3);
                     draw_rectangle(tempX, tempY, tempX + 32, tempY + 32, false);                     
                    }

                 tempX += 32;
                 j++;
                 if (j == craftingEntriesPerRow) {j = 0; tempX = xpos; tempY += 32;}
                 clr();
                }
                
            // Draw known items
            tempX = xpos;
            tempY = ypos + 96;   
            j = 0;
            fnt(fntPixel);
            
            for (i = 0; i < ds_list_size(craftingKnownMaterials); i++)
                {
                 draw_sprite(sTestItem, craftingMaterialsSprite[craftingPageSelected, ds_list_find_value(craftingKnownMaterials, i)], tempX + 16, tempY + 16);
                 if (craftingMaterialsNewFlag[craftingPageSelected, ds_list_find_value(craftingKnownMaterials, i)]) {draw_text_colour(tempX + 25, tempY, "!", c_yellow, c_yellow, c_yellow, c_yellow, 1);}
             
                 // On-Hover
                 if (mouse_in(tempX, tempX + 32, tempY, tempY + 32))
                 {
                 
                 fnt();
                 text = craftingMaterialsName[craftingPageSelected, ds_list_find_value(craftingKnownMaterials, i)];
                 clr(c_black, 0.4);
                 draw_roundrect(tempX + 16, tempY + 16, tempX + 32 + string_width(text), tempY + 42, false);
                 clr(c_black, 1);
                 draw_roundrect(tempX + 16, tempY + 16, tempX + 32 + string_width(text), tempY + 42, true);
                 clr(c_white, 1);
                 draw_text(tempX + 24, tempY + 16, text);
                  clr();
                 
                 if (mouse_check_button_pressed(mb_left) && ds_list_find_index(craftingKnownMaterials, ds_list_find_value(craftingKnownMaterials, i)) != -1)
                    {
                    craftingHelper = 0;
                    if (craftingMaterialsNewFlag[craftingPageSelected, ds_list_find_value(craftingKnownMaterials, i)]) {craftingMaterialsNewFlag[craftingPageSelected, ds_list_find_value(craftingKnownMaterials, i)] = 0;}                         
                    craftingSelectedItem = ds_list_find_value(craftingKnownMaterials, i);
                    craftingTitleHelper = craftingMaterialsName[craftingPageSelected, ds_list_find_value(craftingKnownMaterials, i)];
                    craftingTitleHelper2 = craftingMaterialsDetailsText[craftingPageSelected, ds_list_find_value(craftingKnownMaterials, i)];
                   
                     } 
                 }
                 
                 tempX += 32;
                 j++;
                 if (j == craftingEntriesPerRow) {j = 0; tempX = xpos; tempY += 32;}
                 clr();                
                }

            }   
         
       // Crafting details form (item to creaft is selected)
       if (craftingSelectedIndex == 2 && craftingHelper == 0 && !craftingDetails)
          {
            tempX = xpos;
            tempY = ypos + 96;   
            
            scrCraftingMaterialDB(craftingEnum.craftCraft, craftingSelectedItem);            
          }
          
      // Alchemy form
      // *****************************************************************************
      if (craftingSelectedIndex == 4 && craftingHelper == -1 && !craftingDetails)
            {    
            j = 0;        
            
            // Draw frames
            for (i = 0; i < craftingEntriesPerPage; i++)
                {
                 clr(c_black, 1);
                 draw_rectangle(tempX, tempY, tempX + 32, tempY + 32, true);
                 clr(c_white, 0.1);
                 draw_rectangle(tempX, tempY, tempX + 32, tempY + 32, false);
                 
                 if (mouse_in(tempX, tempX + 32, tempY, tempY + 32))
                    {
                     clr(c_yellow, 0.3);
                     draw_rectangle(tempX, tempY, tempX + 32, tempY + 32, false);                     
                    }

                 tempX += 32;
                 j++;
                 if (j == craftingEntriesPerRow) {j = 0; tempX = xpos; tempY += 32;}
                 clr();
                }
                
            // Draw known items
            tempX = xpos;
            tempY = ypos + 96;   
            j = 0;
            fnt(fntPixel);
            
            for (i = 0; i < ds_list_size(craftingKnownAlchemy); i++)
                {
                 tempIndex = ds_list_find_value(craftingKnownAlchemy, i);
                 
                 draw_sprite(sTestItem, craftingAlchemySprite[craftingPageSelected, tempIndex], tempX + 16, tempY + 16);
                 if (craftingAlchemyNewFlag[craftingPageSelected, tempIndex]) {draw_text_colour(tempX + 25, tempY, "!", c_yellow, c_yellow, c_yellow, c_yellow, 1);}
             
                 // On-Hover
                 if (mouse_in(tempX, tempX + 32, tempY, tempY + 32))
                 {
                 
                 fnt();
                 text = craftingAlchemyName[craftingPageSelected, tempIndex];
                 clr(c_black, 0.4);
                 draw_roundrect(tempX + 16, tempY + 16, tempX + 32 + string_width(text), tempY + 42, false);
                 clr(c_black, 1);
                 draw_roundrect(tempX + 16, tempY + 16, tempX + 32 + string_width(text), tempY + 42, true);
                 clr(c_white, 1);
                 draw_text(tempX + 24, tempY + 16, text);
                 clr();
                 
                 if (mouse_check_button_pressed(mb_left) && ds_list_find_index(craftingKnownAlchemy, tempIndex) != -1)
                    {
                    craftingHelper = 0;
                    if (craftingAlchemyNewFlag[craftingPageSelected, tempIndex]) {craftingAlchemyNewFlag[craftingPageSelected, tempIndex] = false;}                         
                    craftingSelectedItem = tempIndex;
                    craftingTitleHelper = craftingAlchemyName[craftingPageSelected, tempIndex];
                    craftingTitleHelper2 = craftingAlchemyDetailsText[craftingPageSelected, tempIndex];
                   
                     } 
                 }
                 
                 tempX += 32;
                 j++;
                 if (j == craftingEntriesPerRow) {j = 0; tempX = xpos; tempY += 32;}
                 clr();                
                }

            }   
       // --> Occupied by satan <--  
       // Crafting details form (item to craft is selected)
       if (craftingSelectedIndex == 4 && craftingHelper == 0 && !craftingDetails)
          {
            tempX = xpos;
            tempY = ypos + 96;   
            
            scrCraftingAlchemyDB(craftingEnum.craftCraft, craftingSelectedItem);            
          }
      
            
      // Crafting details form - material enrichtment
      // *********************************************************************************************
      if (craftingSelectedIndex == 3) 
        {
         tempX = xpos;
         tempY = ypos + 96; 
         color = c_white;
         
         if (oInventory.drag = 1 && oInventory.equip_sprite_s[3] != materialEnum.materialNone)
            {
             if (oInventory.equip_sprite_s[5] >= 4) {color = c_lime;}
             else {color = c_orange;}
            }
         
         // Draw input slot
         clr(color, 0.1);
         draw_roundrect(tempX + 64, tempY, tempX + 96, tempY + 32, false);
         clr();
         draw_roundrect(tempX + 64, tempY, tempX + 96, tempY + 32, true);

         // Draw output slot
         clr(c_white, 0.1);
         draw_roundrect(tempX + 144, tempY, tempX + 176, tempY + 32, false);
         clr();
         draw_roundrect(tempX + 144, tempY, tempX + 176, tempY + 32, true);

                  
         clr(c_white, 1);
         draw_text(tempX + 38, tempY + 4, "4x");
         draw_text(tempX + 106, tempY + 4, "-->");
         if (enrichtItemSprite > 0) {draw_sprite(sTestItem, enrichtItemSprite, tempX + 64 + 16, tempY + 16);}
         if (enrichtingOutputSprite > 0) 
            {
            draw_sprite(sTestItem, enrichtingOutputSprite, tempX + 144 + 16, tempY + 16);
            fnt(fntPixelSmall);
            draw_text_colored(tempX, tempY + 48, scrCraftingDbMaterialEnrichtText(enrichtItemID));
            }
        // Slot for input item
        if (mouse_in(tempX + 64, tempX + 96, tempY, tempY + 32) && (color == c_lime || enrichtItemID != -1))
            {
            // Put in
            if (mouse_check_button_released(mb_left) && enrichtItemID = -1 && oInventory.equip_sprite_s[5] >= 4)
                {
                 oInventory.pre_switch                               = true;
                 oInventory.draw_item_mouse                          = false;
                 oInventory.slot[oInventory.h_c, inv_item_beingUsed] = true;
                 enrichtItemID                                       = oInventory.equip_sprite_s[6];
                 enrichtItemSlotID                                   = oInventory.h_c;
                 enrichtItemSprite                                   = oInventory.equip_sprite_s[1];
                 
                 enrichtingOutputSprite = scrCraftingDbMaterialEnricht(enrichtItemID);
                 }
                 
            // Take out
            if (mouse_check_button_pressed(mb_left))
                {
                // Reset enricht variables
                if (enrichtItemSlotID > -1) {oInventory.slot[enrichtItemSlotID, inv_item_beingUsed] = false;}
                enrichtItemSprite = 0;  
                enrichtItemID     = -1;         
                enrichtItemSlotID = -1;        
                enrichtingOutputSprite = 0;                      
                }
            } 
            
                 // Draw navigation
                // ******************************************                
                textColor = c_gray;
                bcgColor  = c_black;
                
                // Check for ability to confirm crafting
                if (enrichtItemSlotID >= 0)
                    { 
                     textColor = c_lime;
                    }
                   
                // Check for on-hover event
                if (mouse_in(tempX + 16, tempX + 112, tempY + 170, tempY + 190))
                    {
                     bcgColor = c_yellow;
                     
                     // Confirm material upgrade
                     if (mouse_check_button_pressed(mb_left))
                        {
                         inventoryDelete(enrichtItemID, 4);
                         oInventory.slot[enrichtItemSlotID, inv_item_beingUsed] = false;
                         scrCraftingDbMaterialEnricht(enrichtItemID, true);
                         enrichtItemID = -1;
                         enrichtItemSprite = 0;
                         enrichtItemSlotID = -1;        
                         enrichtingOutputSprite = 0;         
                        }                                                    
                    }
                    
                    
                // Draw "upgrade button"
                clr(bcgColor, 0.4);
                draw_roundrect(tempX + 16, tempY + 170, tempX + 112, tempY + 190, false);
                clr(c_black, 1);
                draw_roundrect(tempX + 16, tempY + 170, tempX + 112, tempY + 190, true);
                alg("center", fntPixelSmall);
                clr(textColor, 1);
                draw_text(tempX + 64, tempY + 180, "[Zušlechtit]");     
                
                // Draw "abort" button
                bcgColor = c_black;
                
                if (mouse_in(tempX + 128, tempX + 240, tempY + 170, tempY + 190))
                    {
                     bcgColor = c_yellow;
                     
                     if (mouse_check_button_pressed(mb_left))
                        {                          
                        // Remove attached material
                        if (enrichtItemSlotID > 0) {oInventory.slot[enrichtItemSlotID, inv_item_beingUsed] = false;}   
                        enrichtItemID       = 0;  
                        enrichtItemSprite   = 0;      
                        enrichtItemSlotID   = -1;
                        enrichtingOutputSprite = 0;  
                        
                        // Return to main menu
                        craftingHelper = -1;
                        craftingTitleHelper = "";
                        craftingSelectedIndex = -1;
                        craftingMenuAlpha = 1;
                        }                     
                    }     
                    
                clr(bcgColor, 0.4);
                draw_roundrect(tempX + 128, tempY + 170, tempX + 240, tempY + 190, false);
                clr(c_black, 1);
                draw_roundrect(tempX + 128, tempY + 170, tempX + 240, tempY + 190, true);
                alg("center", fntPixelSmall);
                clr(c_white, 1);
                draw_text(tempX + 184, tempY + 180, "[Zrušit]");                                                       
        }     
        
      // Food form
      // *****************************************************************************
      if (craftingSelectedIndex == 5 && craftingHelper == -1 && !craftingDetails)
            {    
            j = 0;        
            
            // Draw frames
            for (i = 0; i < craftingEntriesPerPage; i++)
                {
                 clr(c_black, 1);
                 draw_rectangle(tempX, tempY, tempX + 32, tempY + 32, true);
                 clr(c_white, 0.1);
                 draw_rectangle(tempX, tempY, tempX + 32, tempY + 32, false);
                 
                 if (mouse_in(tempX, tempX + 32, tempY, tempY + 32))
                    {
                     clr(c_yellow, 0.3);
                     draw_rectangle(tempX, tempY, tempX + 32, tempY + 32, false);                     
                    }

                 tempX += 32;
                 j++;
                 if (j == craftingEntriesPerRow) {j = 0; tempX = xpos; tempY += 32;}
                 clr();
                }
                
            // Draw known items
            tempX = xpos;
            tempY = ypos + 96;   
            j = 0;
            fnt(fntPixel);
            
            for (i = 0; i < ds_list_size(craftingKnownFood); i++)
                {
                 tempIndex = ds_list_find_value(craftingKnownFood, i);
                 
                 draw_sprite(sTestItem, craftingFoodSprite[craftingPageSelected, tempIndex], tempX + 16, tempY + 16);
                 if (craftingFoodNewFlag[craftingPageSelected, tempIndex]) {draw_text_colour(tempX + 25, tempY, "!", c_yellow, c_yellow, c_yellow, c_yellow, 1);}
             
                 // On-Hover
                 if (mouse_in(tempX, tempX + 32, tempY, tempY + 32))
                 {
                 
                 fnt();
                 text = craftingFoodName[craftingPageSelected, tempIndex];
                 clr(c_black, 0.4);
                 draw_roundrect(tempX + 16, tempY + 16, tempX + 32 + string_width(text), tempY + 42, false);
                 clr(c_black, 1);
                 draw_roundrect(tempX + 16, tempY + 16, tempX + 32 + string_width(text), tempY + 42, true);
                 clr(c_white, 1);
                 draw_text(tempX + 24, tempY + 16, text);
                 clr();
                 
                 if (mouse_check_button_pressed(mb_left) && ds_list_find_index(craftingKnownFood, tempIndex) != -1)
                    {
                    craftingHelper = 0;
                    if (craftingFoodNewFlag[craftingPageSelected, tempIndex]) {craftingFoodNewFlag[craftingPageSelected, tempIndex] = false;}                         
                    craftingSelectedItem = tempIndex;
                    craftingTitleHelper  = craftingFoodName[craftingPageSelected, tempIndex];
                    craftingTitleHelper2 = craftingFoodDetailsText[craftingPageSelected, tempIndex];
                   
                     } 
                 }
                 
                 tempX += 32;
                 j++;
                 if (j == craftingEntriesPerRow) {j = 0; tempX = xpos; tempY += 32;}
                 clr();                
                }

            }   
         
       // Crafting details form (item to craft is selected)
       if (craftingSelectedIndex == 5 && craftingHelper == 0 && !craftingDetails)
          {
            tempX = xpos;
            tempY = ypos + 96;   
            
            scrCraftingFoodDB(craftingEnum.craftCraft, craftingSelectedItem);            
          }
     
      // Crafting details form - repair item
      // *********************************************************************************************
      if (craftingSelectedIndex == 6) 
        {
         tempX = xpos;
         tempY = ypos + 96; 
         color = c_white;
         
         if (oInventory.drag)
            {
             if (oInventory.equip_sprite_s[7] != "") {color = c_lime;}
            }
         
         // Draw input slot
         clr(color, 0.1);
         draw_roundrect(tempX + 96, tempY, tempX + 128, tempY + 32, false);
         clr();
         draw_roundrect(tempX + 96, tempY, tempX + 128, tempY + 32, true);
                  
         clr(c_white, 1);
    //     draw_text(tempX + 38, tempY + 4, "4x");
        // draw_text(tempX + 106, tempY + 4, "-->");
         if (repairItemSprite > 0) {draw_sprite(sTestItem, repairItemSprite, tempX + 96 + 16, tempY + 16);}

        // Slot for input item
        if (mouse_in(tempX + 96, tempX + 128, tempY, tempY + 32) && (color == c_lime || repairItemID != -1))
            {
            // Put in
            if (mouse_check_button_released(mb_left))
                {
                 oInventory.pre_switch                               = true;
                 oInventory.draw_item_mouse                          = false;
                 oInventory.slot[oInventory.h_c, inv_item_beingUsed] = true;
                 repairItemID                                        = oInventory.equip_sprite_s[6];
                 repairItemSlotID                                    = oInventory.h_c;
                 repairItemSprite                                    = oInventory.equip_sprite_s[1];
                }
                 
            // Take out
            if (mouse_check_button_pressed(mb_left))
                {
                 // Reset enricht variables
                 repairItemSprite = 0;  
                 repairItemID     = -1;      
                 oInventory.slot[repairItemSlotID, inv_item_beingUsed] = false;   
                 repairItemSlotID = -1;                            
                }
            } 
            
                 // Draw navigation
                // ******************************************                
                textColor = c_gray;
                bcgColor  = c_black;
                
                // Check for ability to confirm crafting
                if (repairItemSlotID >= 0)
                    { 
                     textColor = c_lime;
                    }
                   
                // Check for on-hover event
                if (mouse_in(tempX + 16, tempX + 112, tempY + 170, tempY + 190))
                    {
                     bcgColor = c_yellow;
                     
                     // Confirm material upgrade
                     if (mouse_check_button_pressed(mb_left))
                        {
                      //   inventoryDelete(enrichtItemID, 4);
                       //  oInventory.slot[enrichtItemSlotID, inv_item_beingUsed] = false;
                      //   scrCraftingDbMaterialEnricht(enrichtItemID, true);
                      //   enrichtItemID = -1;
                      //   enrichtItemSprite = 0;
                      //   enrichtItemSlotID = -1;        
                        // enrichtingOutputSprite = 0;         
                        }                                                    
                    }
                    
                    
                // Draw "upgrade button"
                clr(bcgColor, 0.4);
                draw_roundrect(tempX + 16, tempY + 170, tempX + 112, tempY + 190, false);
                clr(c_black, 1);
                draw_roundrect(tempX + 16, tempY + 170, tempX + 112, tempY + 190, true);
                alg("center", fntPixelSmall);
                clr(textColor, 1);
                draw_text(tempX + 64, tempY + 180, "[Opravit]");     
                
                // Draw "abort" button
                bcgColor = c_black;
                
                if (mouse_in(tempX + 128, tempX + 240, tempY + 170, tempY + 190))
                    {
                     bcgColor = c_yellow;
                     
                     if (mouse_check_button_pressed(mb_left))
                        {                          
                        // Remove attached material
                        if (repairItemSlotID > 0) {oInventory.slot[repairItemSlotID, inv_item_beingUsed] = false;}                           
                        repairItemID       = 0;  
                        repairItemSlotID   = -1;      
                        repairItemSprite   = -1;
                        
                        // Return to main menu
                        craftingHelper = -1;
                        craftingTitleHelper = "";
                        craftingSelectedIndex = -1;
                        craftingMenuAlpha = 1;
                        }                     
                    }     
                    
                clr(bcgColor, 0.4);
                draw_roundrect(tempX + 128, tempY + 170, tempX + 240, tempY + 190, false);
                clr(c_black, 1);
                draw_roundrect(tempX + 128, tempY + 170, tempX + 240, tempY + 190, true);
                alg("center", fntPixelSmall);
                clr(c_white, 1);
                draw_text(tempX + 184, tempY + 180, "[Zrušit]");                                                       
        } 
}
