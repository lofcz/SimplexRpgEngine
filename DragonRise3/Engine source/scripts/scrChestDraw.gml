/// scrChestDraw()

if (animate == 1)
   {
    image_speed = animate_speed;
    if (s_b > 0) {s_b -= 0.05;}
   }
if (animate == 2)
   {
    image_speed = -animate_speed;
   }
if (animate == 0)
   {
    image_speed = 0;
   }

if (open)
   {
   xx = x-slots_row*16
   yy = y-slots_row*32-24;
   
    for(a=0; a<slots; a++)
             {
           
             // draw_rectangle_colour(xx,yy,xx+32,yy+32,c_gray,c_gray,c_gray,c_gray,0);
              draw_sprite(sSlotTexture,3,xx,yy);
              draw_rectangle_colour(xx,yy,xx+31,yy+31,0,c_black,c_black,c_black,1);

              if (mouse_x > xx && mouse_x < xx+32 && mouse_y > yy && mouse_y < yy+32)
                    {
                     draw_sprite_ext(sSlotTexture, 6, xx, yy, 1, 1, 0, c_white, 0.4);
                     
                       if (oInventory.drag && mouse_check_button_released(mb_left) && fill[a] = 0)
                        {
                         oInventory.pre_switch = 1;
                         oInventory.drop_xx = xx;
                         oInventory.drop_yy = yy;
                                                                                   //show_message(oInventory.h_c);
                         instance = instance_create(xx,yy,oBasicItem);   
                         fill[a] = 1;
                         scrCreateItem();   
                                                                                                                                                                                               
                         with(oInventory)
                         {
                         drag = 0;
                         drag_controll = 0;

                         for (a = 0; a<inv_atributes_total; a++)
                         {
                         if(scrInventoryParseString())
                            {
                            slot[h_c,a] = 0;
                            }
                         else {slot[h_c,a] = "";}  
                   
                         if (a = inv_sprite) {slot[h_c,a] = sFreeSlot;}    
                          } 

                      draw_item_mouse = 0;
           
                                      for (b = 0; b<10; b++)
                                      {
                                      switch_option[0,b] = "";                
                                      }
                      }                                      
                         
                    
                    
                    
                    
                    
                    
                    
                         
                        }

                    }
                            draw_sprite(sSlotTexture, 5, xx, yy);

              xx += 32;
              if (xx >= x+(slots_row*16))
                 {
                  yy += 32;
                  xx = x-slots_row*16;
                 }
             }
   }
   else
       {
            if (instance_number(oPlayer) > 0)
               {
                if (distance_to_object(oPlayer) < open_dis && text == 1)
                   {
                     if (text_alpha < 1) {text_alpha += 0.05;}
                   }
                   else {if (text_alpha > 0) {text_alpha -= 0.05;}}
   
                        draw_set_halign(fa_center);
                        draw_set_valign(fa_middle);

                     draw_set_font(fntRetroBig);
                     
                     if (unlocked)
                     {
                    // draw_text_colour(x,y-32,open_key,c_black,c_black,c_black,c_black,text_alpha);
                     
draw_set_font(fntPixel);
scrCenterText();
draw_set_alpha(text_alpha/2);
draw_roundrect_colour_ext(x-string_width("E")/2-10,y-string_height("E")/2-32,x+string_width("E")/2+10,y+string_height("E")/2+4-32,20,20,c_black,c_black,0);
draw_set_alpha(text_alpha);
draw_set_color(c_white);
draw_text(x,y-32,"E");
draw_set_alpha(1);
scrCenterText(0);

                     }
                     else 
                        {
draw_set_font(fntPixel);
scrCenterText();
draw_set_alpha(text_alpha/2);
draw_roundrect_colour_ext(x-string_width("Zamčeno")/2-10,y-string_height("E")/2-32,x+string_width("Zamčeno")/2+10,y+string_height("E")/2+4-32,20,20,c_black,c_black,0);
draw_set_alpha(text_alpha);
draw_set_color(c_white);
draw_text(x,y-32,"Zamčeno");
draw_set_alpha(1);
scrCenterText(0);
                        if (keyboard_check_pressed(ord("E")) && distance_to_object(oPlayer) < open_dis && text = 1) {apiPlayerReverseState(); if (instance_number(oLockpickingScreen) == 0 && inventoryNumber(itemEnum.itemLockpick) > 0) {scrLockpickingIni(tumblers); for(j = 0; j < combinations; j++) { scrLockpickingAddTumblerCombination(c[j, 0], c[j, 1], c[j, 2]);}} else {if (apiPlayerGetSpeechSize() == 0) {apiPlayerSay("Potřebuji paklíč");}}}

                         }
                     
                      draw_set_halign(fa_left);
                      draw_set_valign(fa_top);

                      draw_set_font(fntText);

           }
       }
