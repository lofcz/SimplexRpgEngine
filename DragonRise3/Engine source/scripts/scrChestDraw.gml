/// scrChestDraw()

if (animate == 1)
   {
    image_speed = animate_speed;
    s_b         = lin(s_b, 0, -0.05);
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
   xx = (x - (slots_row * 16));
   yy = (y - (slots_row * 32) - 24);
   
   for (a = 0; a < slots; a++)
        {
         draw_sprite(sSlotTexture,3,xx,yy);
         draw_rectangle_colour(xx,yy,xx+31,yy+31,0,c_black,c_black,c_black,1);

         if (mouse_in(xx, xx + 32, yy, yy + 32))
            {
             draw_sprite_ext(sSlotTexture, 6, xx, yy, 1, 1, 0, c_white, 0.4);
                     
             if (oInventory.drag && mouse_check_button_released(mb_left) && fill[a] == 0)
                {
                 oInventory.pre_switch = 1;
                 oInventory.drop_xx    = xx;
                 oInventory.drop_yy    = yy;

                 var instance = instance_create(xx, yy, oBasicItem);   
                 fill[a] = 1;
                 scrCreateItem();   
                                                                                                                                                                                               
                 with(oInventory)
                    {
                     drag          = 0;
                     drag_controll = 0;

                     for (a = 0; a < inv_atributes_total; a++)
                         {
                          if (scrInventoryParseString())
                             {
                              slot[h_c,a] = 0;
                             }
                          else {slot[h_c,a] = "";}  
                   
                           if (a = inv_sprite) {slot[h_c,a] = sFreeSlot;}    
                          } 

                      draw_item_mouse = 0;
           
                      for (b = 0; b < 10; b++)
                        {
                        switch_option[0, b] = "";                
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
             if (distance_to_object(oPlayer) < open_dis && text)
                {
                 text_alpha = lin(text_alpha, 1, 0.05);
                }
             else 
                {
                 text_alpha = lin(text_alpha, 0, -0.05);
                }
             
             if (unlocked)
                {
                 alg("center", fntPixel);
                 clr(c_black, (text_alpha / 2));
                 draw_roundrect_colour_ext(x - string_width("E") / 2 - 10,y-string_height("E")/2-32,x+string_width("E")/2+10,y+string_height("E")/2+4-32,20,20,c_black,c_black,0);
                 clr(c_white, text_alpha);
                 draw_text(x, (y - 32), "E");
                 clr();
                 alg();
                }
             else 
                {
                 alg("center", fntPixel);
                 clr(c_black, (text_alpha / 2));
                 draw_roundrect_colour_ext(x-string_width("Zamčeno")/2-10,y-string_height("E")/2-32,x+string_width("Zamčeno")/2+10,y+string_height("E")/2+4-32,20,20,c_black,c_black,0);
                 clr(c_white, text_alpha);
                 draw_text(x, (y - 32), "Zamčeno");
                 clr();
                 alg();
                        
                 if (keyboard_check_pressed(ord("E")) && distance_to_object(oPlayer) < open_dis && text) {apiPlayerReverseState(); if (instance_number(oLockpickingScreen) == 0 && inventoryNumber(itemEnum.itemLockpick) > 0) {scrLockpickingIni(tumblers); for(j = 0; j < combinations; j++) { scrLockpickingAddTumblerCombination(c[j, 0], c[j, 1], c[j, 2]);}} else {if (apiPlayerGetSpeechSize() == 0) {apiPlayerSay("Potřebuji paklíč");}}}
                }
           }
       }
