/// scrBestiaryDraw()

if (view_current == 0)
{
x = (view_xview + view_wview);
y = (view_yview + 150);

// Computations
nX    = (x - drawX);
nY    = y;
pages = array_length_1d(pageName);

// Temp vars
hover = false;

// Horizontal movement
if (activated) {if (drawX < xOffset) {drawX = lerp(drawX, xOffset + 8, 0.05);}}
else {if (drawX > 0) {drawX = lerp(drawX, -8, 0.05);}}

// Draw header 
clr();
draw_sprite(sBestiar, 0, nX, y);
draw_sprite(sBestiar, 2, nX, y);

alg("center", fntPixelHuge);
clr(c_white);
draw_text(nX + 128, y + 16, pageName[currentPage]);
alg("center", fntPixelSmall);
draw_text(nX + 128, y + 36, "strana " +string(currentPage + 1) + " / " + string(pages));

// paginace [TODO]

// Draw monsters
tempI = 0;
for (i = (currentPage * entriesPerPage); i < (((currentPage * entriesPerPage)) + entriesPerPage); i++)
    {
     // Compute [x,y] of drawn entries
     if (entryActive != i)
        {
        entryX[i] = nX;
        entryY[i] = ((y + 4) + (48 + (tempI * (66))));
        tempEntryY[i] = entryY[i];
        }
     else
        {
        // Animation UP
        if (mode == 0)
        {
        entryX[i] = nX;
        entryY[i] = ((y + 4) + (48 + (tempI * (66))) - shiftY);
        
        for (j = 0; j < (((currentPage * entriesPerPage)) + entriesPerPage); j++)
        {
        if (j == entryActive) {continue;}
        entryAlpha[j] = lerp(entryAlpha[j], 0, 0.1);
        if (entryActive == 0) {entryAlpha[j] = 0;}
        }
        

        
        if (shiftY < (66*entryActive) - 2) {shiftY = lerp(shiftY, (66*entryActive), 0.1);}
        else
            {
             mode            = 1;
             shiftY          = (66*entryActive);             
             rectangleHeight = 0;
            }
        }
        // Animation DETAILS DOWN
        if (mode == 1)
        {
        entryX[i] = nX;
        entryY[i] = ((y + 4) + (48 + (tempI * (66))) - shiftY);
        
        if (rectangleHeight < (256 - 50)) {rectangleHeight = lerp(rectangleHeight, 256 - 48, 0.1);}
        else {mode = 2;}
        }
        
        // Animation TEXT UP
        if (mode == 2)
        {
        entryX[i] = nX;
        entryY[i] = ((y + 4) + (48 + (tempI * (66))) - shiftY);
 
        if (textAlpha < 1) {textAlpha = lerp(textAlpha, 1.1, 0.1);}
        else {mode = 3;}
       
        }
        
        // Animation WAIT FOR CLOSE
        if (mode == 3)
        {
        entryX[i] = nX;
        entryY[i] = ((y + 4) + (48 + (tempI * (66))) - shiftY);
        
        
        }
        
        // Animation TEXT DISSAPEAR
        if (mode == 4)
        {
        entryX[i] = nX;
        entryY[i] = ((y + 4) + (48 + (tempI * (66))) - shiftY);
        
        if (textAlpha > 0) {textAlpha = lerp(textAlpha, -0.1, 0.1);}
        else {mode = 5;}
        
        textAlpha = max(textAlpha, 0);
        } 

        // Animation DETAILS OFF
        if (mode == 5)
        {
        entryX[i] = nX;
        entryY[i] = ((y + 4) + (48 + (tempI * (66))) - shiftY);
        
        if (rectangleHeight > 0) {rectangleHeight = lerp(rectangleHeight, -4, 0.1);}
        else {mode = 6;}
        
        rectngleHeight = max(rectangleHeight, 0);
        
        } 
        
        // Animation END
        if (mode == 6)
        {
        entryX[i] = nX;
        entryY[i] = ((y + 4) + (48 + (tempI * (66))) - shiftY);
        
        for (j = 0; j < (((currentPage * entriesPerPage)) + entriesPerPage); j++)
        {
        if (j == entryActive) {continue;}
        entryAlpha[j] = lerp(entryAlpha[j], 1, 0.1);
        if (entryActive == 0) {entryAlpha[j] = 1;}
        }
              
        if (shiftY > 0) {shiftY = lerp(shiftY, 0, 0.1);}
        else
            {
             mode            = 0;
             entryActive     = -2;
            }
        }             
        }
     // tempVars
     drawName = "??????";
     drawRace = "??????";
     drawN    = "";
     
        
     // Draw frame
     clr(c_black, entryAlpha[i]);
     draw_sprite(sBestiar, 1, entryX[i], entryY[i]);
     
     if (unlocked[i]) 
        {
        draw_sprite(monster[i, bestiary_monster_sprite], 0, entryX[i] + 32, entryY[i] + 32); 
        drawName = monster[i, bestiary_monster_title];
        drawRace = monster[i, bestiary_monster_race];
        drawN    = "Poraženo: " + string(monster[i, bestiary_monster_killed]);
        
        if (rectangleHeight != -1 && i == entryActive)
            {
             draw_sprite_part(sBestiar, 5, 0, 0, 256, rectangleHeight, entryX[i], entryY[i] + 64);
            
             alg();
             clr(c_white, textAlpha);
             draw_set_font(fntPixelSmall);
             draw_text_colored(entryX[i] + 16, entryY[i] + 70, monster[i, bestiary_monster_text]);
             q = string_height(monster[i, bestiary_monster_text]);
             draw_set_font(fntPixelTiny);
             draw_text_colored(entryX[i] + 16, entryY[i] + 78 + q, monster[i, bestiary_monster_details]);
             
             }
        }
     alg();
     draw_set_font(fntPixel);
     clr(c_white, entryAlpha[i]);
     draw_text(entryX[i] + 72, entryY[i] + 4, drawName);
     clr(c_ltgray, entryAlpha[i]);
     draw_text(entryX[i] + 72, entryY[i] + 20, drawRace);
     draw_set_font(fntPixelSmall);
     clr(c_black, entryAlpha[i]);
     draw_text(entryX[i] + 72, entryY[i] + 40, drawN);
     
     if (mouse_in(entryX[i], entryX[i] + 256, entryY[i], entryY[i] + 64) && entryAlpha[i] >= 1)
        {
         hover = true;
         draw_sprite_ext(sBestiar, 7, entryX[i], entryY[i], 1, 1, 0, c_red, hoverA);
       
         if (mouse_check_button_pressed(mb_left) && entryActive == -2)
            {
             entryActive = i;
             shiftY = 0;
             shiftMaxY = 0;
             mode = 0;
            }
         if (mouse_check_button_pressed(mb_left) && mode == 3)
            {
             mode = 4;
            }
        } 

     tempI++;
    }

if (hover) {if (hoverA < 0.5) {hoverA = lerp(hoverA, 0.5, 0.1);}}
else {if (hoverA > 0) {hoverA = 0;}}
}
