/// scrShopDraw()

isBusy = true;

var xx, yy;
xx = x + 32; //view_xview + 288;
yy = y - 80;//view_yview + 36;
tX = 0;
tY = 0;

clr(c_black, 0.4);
draw_roundrect(x - 96, y - 80, x + 30, y - 8, false);
clr();
draw_roundrect(x - 96, y - 80, x + 30, y - 8, true);

if (thumbnailImage != -1)
    {
     draw_sprite(sTestItem, thumbnailImage, x - (64 - 16), y - 80);
    }

if (thumbnailPrice != -1)
    {
     fnt(fntPixelSmall);
     clr(c_white);
     priceText = "";
     discount = (100 - ((thumbnailPrice / thumbnailOriginalPrice) * 100));

     if (discount > 0) {priceText = " (" + scrColorflag(c_yellow) + "-" + string(discount) + "%" + scrEndColorflag() + ")";}

     draw_text_colored(x - 90, y - 48, "Cena: " + string(thumbnailPrice) + priceText);
     
     
     if (slotFlag[hoverSlot] == "") {draw_text( x - 90, y - 32, "Skladem: " + string(thumbnailCount));}
     else if (slotFlag[hoverSlot] == "+") {draw_text_colored(x - 90, y - 32, "Skladem: " + scrColorflag(c_lime) + string(thumbnailCount) + scrEndColorflag() + " ");}
     else if (slotFlag[hoverSlot] == "-") {draw_text_colored(x - 90, y - 32, "Skladem: " + scrColorflag(c_red) + string(thumbnailCount) + scrEndColorflag() + " ");}
    }
    
for (i = 0; i < slots; i++)
    {
     color = c_black;       
     if ((item[i]).vlastnost[vlastnost_cena] < (item[i]).vlastnost[vlastnost_originalniCena]) {color = c_lime;}
     
     if (mouse_in(xx + tX, xx + tX + 24, yy + tY, yy + tY + 24))
        {
         color = c_yellow;    
         hoverSlot = i;    
        }
        
     clr(color, 0.2);
     draw_roundrect(xx + tX, yy + tY, xx + tX + 23, yy + tY + 23, false);
     clr();
     draw_roundrect(xx + tX, yy + tY, xx + tX + 23, yy + tY + 23, true);
    
     tX += 24;
     if (tX >= 120) {tX = 0; tY += 24;}
    }
    
thumbnailImage = -1;
thumbnailPrice = -1;
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
