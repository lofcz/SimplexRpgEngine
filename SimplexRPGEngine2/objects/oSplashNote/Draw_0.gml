/// @description Insert description here
// You can write your code in this editor

if (mode != "combat") {image_alpha -= spd;}
else {image_alpha -= max(spd-(spd/5),0.01);}

if (image_alpha <= 0) {instance_destroy();}
p += 0.02;

if (p < 0.9) {y -= (1-p);}
else {y -= 0.1;}


if (scale < 1.3) {scale += 0.02;}

draw_set_font(font);
draw_set_color(color);
draw_set_alpha(image_alpha);

if (mode = "normal") {draw_text_colored(x-(string_width(text) / 2),y -yy + 8,text, -1, font, color);}
if (mode = "combat") {alg("center"); draw_text_transformed(x-(string_width(text)/2),y-(string_height(text)/2),text,scale,scale,0); alg();}

if (sprite > 0) 
   {
   if (a < sprite_get_number(sprite)) {a += ani;} else {a = 0;}
   draw_sprite(sprite,a,x+(string_width(text)/2) + 16,y + 16);
  
   }
draw_set_color(c_black);
draw_set_alpha(1);
alg();