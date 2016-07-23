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
            
            for (i = 0; i < ds_list_size(craftingKnownItems); i++)
                {
                 draw_sprite(sTestItem, craftingItemsSprite[craftingPageSelected, ds_list_find_value(craftingKnownItems, i)], tempX, tempY);
                 if (craftingItemsNewFlag[craftingPageSelected, ds_list_find_value(craftingKnownItems, i)]) {draw_text_colour(tempX + 25, tempY, "!", c_yellow, c_yellow, c_yellow, c_yellow, 1);}
             
                 // On-Hover
                 if (mouse_in(tempX, tempX + 32, tempY, tempY + 32))
                 {
                 
                 fnt();
                 text = craftingItemsName[craftingPageSelected, ds_list_find_value(craftingKnownItems, i)];
                 clr(c_black, 0.4);
                 draw_roundrect(tempX + 16, tempY + 16, tempX + 32 + string_width(text), tempY + 42, false);
                 clr(c_black, 1);
                 draw_roundrect(tempX + 16, tempY + 16, tempX + 32 + string_width(text), tempY + 42, true);
                 clr(c_white, 1);
                 draw_text(tempX + 24, tempY + 16, text);
                  clr();
                 
                 if (mouse_check_button_pressed(mb_left) && ds_list_find_index(craftingKnownItems, ds_list_find_value(craftingKnownItems, i)) != -1)
                    {
                    craftingHelper = 0;
                    if (craftingItemsNewFlag[craftingPageSelected, ds_list_find_value(craftingKnownItems, i)]) {craftingItemsNewFlag[craftingPageSelected, ds_list_find_value(craftingKnownItems, i)] = 0;}                         
                    craftingSelectedItem = ds_list_find_value(craftingKnownItems, i);
                    craftingTitleHelper = craftingItemsName[craftingPageSelected, ds_list_find_value(craftingKnownItems, i)];
                    craftingTitleHelper2 = craftingDetailsText[craftingPageSelected, ds_list_find_value(craftingKnownItems, i)];
                   
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

}
