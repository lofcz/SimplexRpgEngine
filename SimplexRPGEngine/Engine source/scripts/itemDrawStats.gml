/// itemDrawStats()

fnt(fntPixelSmall);
offset = 24;
t_text = "";

for(a = 0; a < celkem_vlastnosti; a++)
      {
       if ((parent).vlastnost[a] > 0)
          {
           switch(a)
                    {
                     case(vlastnost_poskozeni):
                         {
                           t_text += "#Poškození: "+string((parent).vlastnost[a]);
                           break;                                                                   
                         }
                     case(vlastnost_max_zivot):
                         {
                           t_text += "#Život: "+string((parent).vlastnost[a]);
                           break;                                                                   
                         }
 
                    
                    }                    
          }      
      }
t_text_height = string_height(t_text);
t_text_height += offset; 
draw_sprite_stretched(sInfoboxTexture,0,(parent).xx,(parent).yy,max(256, string_width((parent).itm_info_text) + 16, string_width((parent).itm_info_head) + 16),(parent).height+t_text_height);


draw_set_font(fntPixel);
scrCenterText();
clr((parent).itm_info_color);
countText = "";

if ((parent).itm_number > 1) {countText = " (x" + string((parent).itm_number) + ")";}
draw_text_colored((parent).xx+128,(parent).yy+16,"" + string((parent).itm_info_head));
draw_set_font(fntPixelTiny);
draw_text((parent).xx+128 + string_width((parent).itm_info_head) + string_width(countText) / 2 - 16, (parent).yy+20, countText);
clr();
scrCenterText(0);

draw_set_font(fntPixelSmall);
draw_text_colored((parent).xx+6,(parent).yy+24,(parent).itm_info_text);
draw_text((parent).xx+6,(parent).yy+12+string_height((parent).itm_info_text),t_text);
