/// scrShopDraw()

isBusy = true;

var xx, yy;
xx = x + 32; //view_xview + 288;
yy = y - 80;//view_yview + 36;
tX = 0;
tY = 0;

clr(c_black, 0.4);
draw_roundrect(x - 96, y - 80, x + 32, y - 8, false);
clr();
draw_roundrect(x - 96, y - 80, x + 32, y - 8, true);

for (i = 0; i < (5 * 3); i++)
    {
     color = c_black;
     if (mouse_in(xx + tX, xx + tX + 24, yy + tY, yy + tY + 24))
        {
         color = c_yellow;
        }
        
     clr(color, 0.2);
     draw_roundrect(xx + tX, yy + tY, xx + tX + 23, yy + tY + 23, false);
     clr();
     draw_roundrect(xx + tX, yy + tY, xx + tX + 23, yy + tY + 23, true);
    
     tX += 24;
     if (tX >= 120) {tX = 0; tY += 24;}
    }
/*
for (i = 0; i < slots; i++)
    {     
     draw_sprite(sSlotTextureHD, 0, xx + tX , yy + tY );
     clr(c_black);
     draw_rectangle(xx + tX, yy + tY, xx + tX + 48, yy + tY + 48, true);
     draw_sprite(sSlotOutlineHD, 0, xx + tX, yy + tY);
     
     if (slot[i, 0] != -1) {draw_sprite(sTestItem, slot[i, 0] - 1, xx + tX + 1, yy + tY + 1);}
     
     if (mouse_in(xx + tX, xx + tX + 48, yy + tY,  yy + tY + 48))
        {
         clr(c_yellow, 0.4);
         draw_rectangle(xx + tX, yy + tY, xx + tX + 48, yy + tY + 48, false);
         clr();
        }
     
     tX += 48 ;
     if (tX >= (slotsPerRow * 48)) {tX = 0; tY += 48;}                    
    }
