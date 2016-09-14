/// scrLockpickingDraw(x, y)

xx = x + drawX;
yy = y + 200;
canPick = true;
//if (argument_count > 0) {xx = argument[0];}
//if (argument_count > 1) {yy = argument[1];}

if (backgroundAlpha < 0.6) {backgroundAlpha = lerp(backgroundAlpha, 0.6, 0.05);}
clr(c_black, backgroundAlpha);
draw_rectangle(view_xview, view_yview, view_xview + 800, view_yview + 600, false);
clr();

// Navigation
if (keyboard_check_pressed(ord("D"))) {if (currentItem < (array_length_1d(itemUp) - 1)) {currentItem++;}}
if (keyboard_check_pressed(ord("A"))) {if (currentItem > 0) {currentItem--;}}
if (keyboard_check_pressed(ord("E"))) {if (!opened) {close = true;}}

//draw_rectangle_dashed(view_xview + 100, view_yview + 100, view_xview + 201, view_yview + 100);
//draw_line_dashed(x + 100, yy - itemMoveAnimation, x + 700, yy - itemMoveAnimation);

// Draw
for (i = 0; i < itemNumber; i++)
    {       
     if (currentItem == i) 
        {    
        if (tempColour[i] > 0) {tempColour[i] = lerp(tempColour[i], 0, 0.05);} 
        itemColor[i] = make_colour_rgb(255, 255, tempColour[i]);      
        }  
     else
        {
        if (tempColour[i] < 255 && !itemUp[i]) {tempColour[i] = lerp(tempColour[i], 255, 0.05);} 
        itemColor[i] = make_colour_rgb(255, 255, tempColour[i]);      
        } 
     
     // Animation slide UP / DOWN
     if (itemUp[i])
        {
         if (itemUpY[i] < 64)
            {
             itemUpY[i] = lerp(itemUpY[i], real(64 + 1), real(0.1));
            }
        }
     else
        {
         if (itemUpY[i] > 0)
            {
              itemUpY[i] = lerp(itemUpY[i], 0, (itemMoveAnimationSpd * itemMultiplicator[i]));           
            }
        }
        
     // Lock picking
     if (keyboard_check_pressed(ord("W")) && canPick && (currentItem == i)) 
        {
        canPick = false; // Normalize picking while iterating to one iteration
        
        if (actualCombination == "") 
            {
             actualCombination = string(i);
             itemUp[i] = true;
            }
        else if (!itemUp[i])
            {
             // Try to add new item 
             canAdd = false;
             
             for (j = 0; j < array_length_2d(itemUpCombination, i); j++)
                {
                 if (itemUpCombination[i, j] == actualCombination)
                    {
                     canAdd = true;
                    }
                }
             
             if (canAdd)
                {
                 actualCombination += "," + string(i);
                 itemUp[i] = true;
                }
             else 
                {
                 actualCombination = "";
                 actualLockpickHp--;
                 if (actualLockpickHp <= 0) {inventoryDelete(itemEnum.itemLockpick, 1); if (inventoryNumber(itemEnum.itemLockpick) == 0) {close = true;}}
                 multiplicator = 1;
                 for (k = 0; k < itemNumber; k++)
                    {
                     if (itemUp[k]) 
                        { 
                         itemUp[k] = false;
                         itemMultiplicator[i] = 1 - random_range(0, 0.4);
                         multiplicator += 0.1;
                         
                        }
                    }
                }
            }
            
        
        }
       
     
     draw_set_color(c_white);  
     draw_set_alpha(alpha / 8);
     draw_set_color(itemColor[i]);  
     if (currentItem == i) {draw_rectangle(xx + itemXPos[i], yy - itemUpY[i], xx + itemXPos[i] + itemWidth, yy + itemHeight[i] - itemUpY[i], false);}
     draw_set_alpha(alpha);
     draw_rectangle(xx + itemXPos[i], yy - itemUpY[i], xx + itemXPos[i] + itemWidth, yy + itemHeight[i] - itemUpY[i], true);
    }
fnt(fntPixelBig);    
draw_text(xx - 220, yy - 180,"Paklíče: " + string(inventoryNumber(itemEnum.itemLockpick)) + "#Pokusů do rozbití paklíče: " + string(actualLockpickHp));    
opened = true;
for (i = 0; i < itemNumber; i++)
    { 
    if (!itemUp[i]) {opened = false;}
    }
    
if (opened)
    {
    alpha = lerp(alpha, -0.1, 0.1);
    if (alpha <= 0) {parent.unlocked = true; instance_destroy(); return true;}
    }    
if (close)
    {
    alpha = lerp(alpha, -0.1, 0.1);
    if (alpha <= 0) {instance_destroy(); return false;}
    }  
//draw_set_colour(c_black);
//draw_text(xx, yy + 300, "Combination DEBUG: " + actualCombination);

return false;
