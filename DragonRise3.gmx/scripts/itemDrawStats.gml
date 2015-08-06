clr(c_white,1);
  draw_rectangle((parent).xx,(parent).yy,(parent).xx+(parent).width,(parent).yy+(parent).height,0);
clr(c_black,1);
 draw_rectangle((parent).xx,(parent).yy,(parent).xx+(parent).width,(parent).yy+(parent).height,1);
 
 draw_set_halign(fa_center);
 draw_set_valign(fa_middle);

  clr((parent).itm_info_color);
   draw_text((parent).xx+128,(parent).yy+16,(parent).itm_info_head);
   clr();

  

  
 draw_set_halign(fa_left);
 draw_set_valign(fa_top);

draw_text_colored((parent).xx+4,(parent).yy+24,(parent).itm_info_text);