/// inventoryDrawOptionbox()

optionnumber         = 0;
max_width            = 0;
height               = 32;
width                = 32;
min_x                = x;
min_y                = y;
max_x                = x;
max_y                = y;
hover_xx             = hover_xx + (view_xview - h_dec_x);               
hover_yy             = hover_yy + (view_yview - h_dec_y);                                                                                                   
h_dec_x              = view_xview;
h_dec_y              = view_yview;   
mouseInStarRectangle = false;                                                                                                                                                                                                                                                                           

fnt(fntPixelSmall);                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    //draw_text(hover_xx,hover_yy,hover_iddd);
for(a = 0; a < 10; a++)
    {
     if (slot_option[hover_idd, a] != "")
        {
         optionnumber++;
         height += 16;
   
         if (string_width(slot_option[hover_idd, a]) > max_width) {max_width = real(string_width(slot_option[hover_idd, a]));}
        }
     else {break;}
    }
    
width += max_width;

if (optionnumber > 0)
    {
     clr(c_white);
     draw_sprite_stretched(sSlotTexture, 4, hover_xx + 16, hover_yy + 16, width + 4, height - 32);
     clr(c_black);
     draw_rectangle(hover_xx + 16, hover_yy + 16, hover_xx + width + 20, hover_yy + height - 16, true);
     
     for(a = 0; a < optionnumber; a++)
        {
         clr(c_black, 1);
         
         if (slot_option[hover_idd,a] != star_text) {draw_text(hover_xx + 20, hover_yy + (a * 16) + 16, slot_option[hover_idd, a]);}
         else 
            {
             draw_text(hover_xx + 20, hover_yy + (a * 16) + 16, star_text);
            }

     mY = hover_yy + (a * 16) + 29;              
     if (mouse_x > hover_xx + 20 + width - 1 && mYes) {mY += 48;}

     if (mouse_in(hover_xx - 3, hover_xx + 1700 + width, hover_yy + (a * 16) + 16, mY))    
        {  
         if (slot_option[hover_idd, a] == star_text)
            {         
             maxStarTextWidth = 20 + max(string_width(starText[0]), string_width(starText[1]), string_width(starText[2]));
            
             draw_sprite_stretched(sSlotTexture,4,hover_xx+20+width,hover_yy+(a*16)+16,maxStarTextWidth,16*3);
             draw_rectangle(hover_xx+20+width, hover_yy+(a*16)+16, hover_xx+20+width+maxStarTextWidth,hover_yy+((a+3)*16)+16, true);           
            
             tempYes = false;
             
             for (j = 0; j < 3; j++)
                {
                 draw_text(hover_xx+20+width+3, hover_yy+(a*16)+(16+j*16), starText[j]);
                
                 if (mouse_in(hover_xx+20+width-1, hover_xx+20+width+maxStarTextWidth, hover_yy+(a*16)+16+(j*16), hover_yy+(a*16)+16+(j*16)+16+1))
                    {
                     mouseInStarRectangle = true;
                     clr(c_yellow,0.4);
                     draw_rectangle(hover_xx+20+width,hover_yy+(a*16)+16+(j*16),hover_xx+20+width+maxStarTextWidth,hover_yy+(a*16)+16+(j*16)+16,false);
                     draw_rectangle(hover_xx+20,hover_yy+(a*16)+16,hover_xx+20+width,hover_yy+(a*16)+32,0);
                     clr();
                     mYes = true;
                     tempYes = true;
                     
                     if (mouse_check_button_pressed(mb_left))
                        {
                         if (j == 0)
                            {
                             slot[hover_idd,inv_item_star] = 1;
                            }
                         if (j == 1)
                            {
                             slot[hover_idd,inv_item_star] = 2;
                            }
                         if (j == 2)
                            {
                             slot[hover_idd,inv_item_star] = 0;
                            }
                         proceed = 0;
                        }
                    }
                }
                
             if (!tempYes) {mYes = false;}
            }

         if (mouse_x > hover_xx-3 && mouse_x < hover_xx+20+width && mouse_y > hover_yy+(a*16)+16 && mouse_y < hover_yy+(a*16)+28+2)
            {
            clr(c_yellow,0.4);
            draw_rectangle(hover_xx+20,hover_yy+(a*16)+16,hover_xx+20+width,hover_yy+(a*16)+32,0);
            clr();
         

            if (mouse_check_button_pressed(mb_left))
               {
                if (slot_option[hover_idd,a] = close_text)
                   {
                    proceed = 0;
                   }
                 else if (slot_option[hover_idd,a] = drop_text)
                    {     
                    proceed  = 0;        
                    inventoryDrop(hover_idd);
                    }
                  else if (slot_option[hover_idd,a] = star_text)
                    {     
   
                    }
                  else 
                    {                                                                               
                     inventoryAction(slot[hover_idd,inv_id],a);
                    }
               }            
            }
        }
    }
    
     min_x = hover_xx;
     min_y = hover_yy;
     max_x = hover_xx+20+width;
     max_y = hover_yy+(optionnumber*16)+16;
    
     if (mouseInStarRectangle) {max_x += 150;}
    }

return mouseInStarRectangle;
