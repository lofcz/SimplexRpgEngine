/// @desc [Simplex description line]


if (scale < 1.3) {scale += 0.02;}

draw_set_font(font);
draw_set_color(color);
draw_set_alpha(image_alpha);
if (mode = "normal") {draw_text(x-(string_width(text) / 2),y -yy,text);}

if (sprite > 0) 
   {
	   if (a < sprite_get_number(sprite)) {a += ani;} else {a = 0;}
	   draw_sprite(sprite,a,x+(string_width(text)/2) + 16,y + 8);
  
   }
draw_set_color(c_black);
draw_set_alpha(1);
