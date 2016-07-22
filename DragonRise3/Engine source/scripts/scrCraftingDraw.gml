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
         draw_roundrect(tempX, tempY, tempX + 256, tempY + 24, false);
         clr(c_black, 1);
         draw_roundrect(tempX, tempY, tempX + 256, tempY + 24, true);        
         clr(c_white);
         alg("center", fntPixel);
         draw_text(tempX + 128, tempY + 12, craftingMenuIndex[craftingSelectedIndex]); 
         alg();          
         
         // Draw crafting form    
         tempX = xpos;
         tempY = ypos + 49;
              
         if (craftingSelectedIndex == 0)
            {
            clr(c_black, 0.4);
            draw_rectangle(tempX, tempY, tempX + 32, tempY + 32, false);
            }       

}
