/// scrShopDraw()

isBusy = true;

var xx, yy;
xx = x + 32-16; //view_xview + 288;
yy = y - 80-24;//view_yview + 36;
tX = 0;
tY = 0;

if (playerDir != oPlayer.dir) {shopActive = false; open = false;}

clr(c_black, 0.4);
draw_roundrect(x - 96 -16, y - 80 - 24, x + 30 - 16, y - 8 - 24, false);
clr();
draw_roundrect(x - 96 - 16, y - 80 - 24, x + 30 - 16, y - 8 - 24, true);

if (thumbnailImage != -1)
    {
     draw_sprite(sTestItem, thumbnailImage, x - (64 - 16) - 16, y - 80 - 24);
    }
else
    {
     // Draw shop info
     fnt(fntPixelTiny);
     clr(c_white);
     draw_text_colored(x - 92 - 16, y - 80 - 24, shopText);
     clr();
    }

if (thumbnailPrice != -1)
    {
     fnt(fntPixelSmall);
     clr(c_white);
     priceText = "";
     discount = (100 - ((thumbnailPrice / thumbnailOriginalPrice) * 100));

     if (discount > 0) {priceText = " (" + scrColorflag(c_yellow) + "-" + string(discount) + "%" + scrEndColorflag() + ")";}

     draw_text_colored(x - 90 - 16, y - 48 - 24, "Cena: " + string(thumbnailPrice) + priceText);
     
     if (thumbnailCount != -1)
     {
     if (slotFlag[hoverSlot] == "") {draw_text( x - 90 - 16, y - 32 - 24, "Skladem: " + string(thumbnailCount));}
     else if (slotFlag[hoverSlot] == "+") {draw_text_colored(x - 90-16, y - 32-24, "Skladem: " + scrColorflag(c_lime) + string(thumbnailCount) + scrEndColorflag() + " ");}
     else if (slotFlag[hoverSlot] == "-") {draw_text_colored(x - 90-16, y - 32-24, "Skladem: " + scrColorflag(c_red) + string(thumbnailCount) + scrEndColorflag() + " ");}
     }
    }
    
for (i = 0; i < slots; i++)
    {    
     color = c_black;   
     
     if (item[i] != -1)
     {   
     if ((item[i]).vlastnost[vlastnost_cena] < (item[i]).vlastnost[vlastnost_originalniCena]) {color = c_lime;}
     
     if (mouse_in(xx + tX, xx + tX + 24, yy + tY, yy + tY + 24))
        {
         color = c_yellow;    
         hoverSlot = i;    
        }
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

