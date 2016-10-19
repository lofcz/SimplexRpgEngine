///scrGoreLight(x, y, solid)

var xx,yy,s,i;
xx  = x;
yy  = y;
s   = true;

if (argument_count > 0) {xx  = argument[0];}
if (argument_count > 1) {yy  = argument[1];}
if (argument_count > 2) {s   = argument[2];}

i = instance_create(xx, yy, oGore3);
i.isSolid = s;
