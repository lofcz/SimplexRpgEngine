///scrGoreLight(x, y, solid, color)

var xx,yy,s,i,c,r,g,b;
xx  = x;
yy  = y;
s   = true;
c   = c_red;

if (argument_count > 0) {xx  = argument[0];}
if (argument_count > 1) {yy  = argument[1];}
if (argument_count > 2) {s   = argument[2];}
if (argument_count > 3) {c   = argument[3];}

r = (color_get_red(c) / 255);
b = (color_get_blue(c) / 255);
g = (color_get_green(c) / 255);

i = instance_create(xx, yy, oGore3);
i.isSolid = s;
i.s_r = r; 
i.s_b = b; 
i.s_g = g;
