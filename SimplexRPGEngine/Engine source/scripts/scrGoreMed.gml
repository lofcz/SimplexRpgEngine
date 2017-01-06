/// scrGoreMed(x, y, sideNum, solid, color)

var xx,yy,num,s,i,k,c,r,g,b;
num = 3;
xx  = x;
yy  = y;
s   = true;
c   = c_red;

if (argument_count > 0) {xx  = argument[0];}
if (argument_count > 1) {yy  = argument[1];}
if (argument_count > 2) {num = argument[2];}
if (argument_count > 3) {s   = argument[3];}
if (argument_count > 4) {c   = argument[4];}

r = (color_get_red(c) / 255);
b = (color_get_blue(c) / 255);
g = (color_get_green(c) / 255);

repeat(num) {i = instance_create(xx,yy,oGore2); i.isSolid = s; i.s_r = r; i.s_b = b; i.s_g = g;}
k = instance_create(xx,yy,oGore4);
k.isSolid = s;
k.s_g = g;
k.s_r = r; 
k.s_b = b; 

