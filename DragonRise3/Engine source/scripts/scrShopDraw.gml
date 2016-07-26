/// scrShopDraw()

isBusy = true;

var xx, yy;
xx = (x - (((slotsPerRow / 2) * 36) - 16)); //view_xview + 288;
yy = (y - (rows * 36 + 16));//view_yview + 36;
tX = 0;
tY = 0;

for (i = 0; i < slots; i++)
    {     
     draw_sprite(sSlotTexture, 0, xx + tX , yy + tY );
     clr(c_black);
     draw_rectangle(xx + tX, yy + tY, xx + tX + 32, yy + tY + 32, true);
     draw_sprite(sSlotOutline, 0, xx + tX, yy + tY);
     
     if (slot[i, 0] != -1) {draw_sprite(sTestItem, slot[i, 0] - 1, xx + tX + 1, yy + tY + 1);}
     
     if (mouse_in(xx + tX, xx + tX + 32, yy + tY,  yy + tY + 32))
        {
         clr(c_yellow, 0.4);
         draw_rectangle(xx + tX, yy + tY, xx + tX + 32, yy + tY + 32, false);
         clr();
        }
     
     tX += 36;
     if (tX >= (slotsPerRow * 36)) {tX = 0; tY += 36;}                    
    }
