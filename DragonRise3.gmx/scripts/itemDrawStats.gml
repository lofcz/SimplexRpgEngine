//clr(c_white,1);
 // draw_rectangle((parent).xx,(parent).yy,(parent).xx+(parent).width,(parent).yy+(parent).height,0);
 
 
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
if (t_text_height > 0) {t_text_height -= 20;}

 
draw_sprite_stretched(sInfoboxTexture,0,(parent).xx,(parent).yy,(parent).width,(parent).height+t_text_height);
clr(c_black,1);
 draw_rectangle((parent).xx,(parent).yy,(parent).xx+(parent).width,(parent).yy+(parent).height+t_text_height,1);
 
scrCenterText();
clr((parent).itm_info_color);
draw_text((parent).xx+128,(parent).yy+16,(parent).itm_info_head);
clr();
scrCenterText(0);

draw_text_colored((parent).xx+4,(parent).yy+24,(parent).itm_info_text);
draw_text((parent).xx+4,(parent).yy+12+string_height((parent).itm_info_text),t_text);

