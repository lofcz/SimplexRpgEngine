/// inventoryDrawOptionbox()

optionnumber = 0
max_width    = 0;
height       = 32;
width        = 32;

min_x = x;
min_y = y;
max_x = x;
max_y = y;

hover_xx = hover_xx + (view_xview-h_dec_x)                   //(hover_x / 32) + x;
hover_yy = hover_yy + (view_yview-h_dec_y)                       //(hover_y / 32) + y;                                                                                         

  h_dec_x = view_xview;
        h_dec_y = view_yview;                                                                                                                                                                                                                                                                                    

draw_set_font(fntPixelSmall);
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    //draw_text(hover_xx,hover_yy,hover_iddd);
for(a=0 a<10 a++)
{
if (slot_option[hover_idd,a] != "")
   {
   optionnumber ++;
   height += 16;
   
   if (string_width(slot_option[hover_idd,a]) > max_width) {max_width = real(string_width(slot_option[hover_idd,a]))}
   }
   else {break;}
}
width += max_width;

if (optionnumber > 0)
{
clr(c_white);
//draw_rectangle(hover_xx+16,hover_yy+16,hover_xx+width+20,hover_yy+height-16,0);
draw_sprite_stretched(sSlotTexture,4,hover_xx+16,hover_yy+16,width+4,height-32);
clr(c_black);
draw_rectangle(hover_xx+16,hover_yy+16,hover_xx+width+20,hover_yy+height-16,1);
for(a=0 a<optionnumber a++)
        {
          clr(c_black,1);
         if (slot_option[hover_idd,a] != star_text) {draw_text(hover_xx+4+16,hover_yy+(a*16)+16,slot_option[hover_idd,a]);}
         else 
              {
               if (slot[hover_idd,inv_item_star]) {draw_text(hover_xx+4+16,hover_yy+(a*16)+16,star_text2);}
               else {draw_text(hover_xx+4+16,hover_yy+(a*16)+16,star_text);}

              }
         if (mouse_x > hover_xx-20 && mouse_x < hover_xx+20+width && mouse_y > hover_yy+(a*16)+16 && mouse_y < hover_yy+(a*16)+28)
            {
            clr(c_yellow,0.4);
            draw_rectangle(hover_xx+20,hover_yy+(a*16)+16,hover_xx+20+width,hover_yy+(a*16)+32,0);
            clr(c_black,1);

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
                    proceed  = 0;        
                    slot[hover_idd,inv_item_star] = !slot[hover_idd,inv_item_star];
                    }

                else 
                {                                                                                 //show_message(slot[hover_idd,inv_id]);
                inventoryAction(slot[hover_idd,inv_id],a);
                }
               }
            
            }
        }
            min_x = hover_xx;
            min_y = hover_yy;
            max_x = hover_xx+20+width;
            max_y = hover_yy+(optionnumber*16)+16;                                                     
            
           // clr(c_red,0.2);
           // draw_rectangle(min_x,min_y,max_x,max_y,0);   
           // clr(); 
}
