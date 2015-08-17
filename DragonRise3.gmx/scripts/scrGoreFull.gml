///scrGoreFull(x,y,side_num,color)

var xx,yy,num,red,blue,green,i,j,k;
num = 3;
xx  = x;
yy  = y;
color = c_white;

if (argument_count > 0) {xx    = argument[0];}
if (argument_count > 1) {yy    = argument[1];}
if (argument_count > 2) {num   = argument[2];}
if (argument_count > 3) {color = argument[3];}

red = color_get_red(color)/255;
blue = color_get_blue(color)/255;
green = color_get_green(color)/255;

repeat(num) {i = instance_create(xx,yy,oGore2); i.s_r = red; i.s_b = blue; i.s_g = green;}

j = instance_create(xx,yy,oGore4); j.s_r = red; j.s_b = blue; j.s_g = green;
k = instance_create(xx,yy,oGore3); k.s_r = red; k.s_b = blue; k.s_g = green;