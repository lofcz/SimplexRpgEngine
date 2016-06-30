/// daynightDraw()

image_alpha = fase-0.1;

if (to = 1)
   {
   image_alpha = fase-0.3;
   } 

if (image_alpha > 0.7)
   {
  image_alpha = 0.7;
   }
   
redr = ((red/255))*239;
redg = ((red/255))*92;
redb = ((red/255))*50;
col  = make_color_rgb(redr,redg,50);

draw_set_alpha(image_alpha);
draw_set_color(col);
draw_rectangle(view_xview-1,view_yview-1,view_xview+view_wview+1,view_yview+view_hview+1,0);
draw_set_alpha(1);
draw_set_color(c_white);
