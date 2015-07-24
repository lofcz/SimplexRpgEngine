clr(c_white,1);
  draw_rectangle(xx,yy,xx+width,yy+height,0);
clr(c_black,1);
 draw_rectangle(xx,yy,xx+width,yy+height,1);
 
 draw_set_halign(fa_center);
 draw_set_valign(fa_middle);

  clr(itm_info_color);
   draw_text(xx+128,yy+16,itm_info_head);
   clr();

  

  
 draw_set_halign(fa_left);
 draw_set_valign(fa_top);

draw_text_colored(xx+4,yy+24,itm_info_text);