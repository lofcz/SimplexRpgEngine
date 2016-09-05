///scrGoreFull(x, y, side_num, color, solid)

var xx,yy,num,red,blue,green,i,j,k,s;
num = 3;
xx  = x;
yy  = y;
color = c_white;
s = true;

if (argument_count > 0) {xx    = argument[0];}
if (argument_count > 1) {yy    = argument[1];}
if (argument_count > 2) {num   = argument[2];}
if (argument_count > 3) {color = argument[3];}
if (argument_count > 4) {s     = argument[4];}

red = color_get_red(color)/255;
blue = color_get_blue(color)/255;
green = color_get_green(color)/255;

repeat(num) {i = instance_create(xx-random(5)+random(5),yy-random(5)+random(5),oGore2); i.s_r = red; i.s_b = blue; i.isSolid = s; i.s_g = green;}

j = instance_create(xx-random(5)+random(5),yy-random(5)+random(5),oGore4); j.s_r = red; j.isSolid = s; j.s_b = blue; j.s_g = green;
k = instance_create(xx-random(5)+random(5),yy-random(5)+random(5),oGore3); k.s_r = red; k.isSolid = s; k.s_b = blue; k.s_g = green;
