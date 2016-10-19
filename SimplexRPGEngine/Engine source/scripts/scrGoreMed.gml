///scrGoreMed(x, y, sideNum, solid)

var xx,yy,num,s,i,k;
num = 3;
xx  = x;
yy  = y;
s   = true;

if (argument_count > 0) {xx  = argument[0];}
if (argument_count > 1) {yy  = argument[1];}
if (argument_count > 2) {num = argument[2];}
if (argument_count > 3) {s   = argument[3];}

repeat(num) {i = instance_create(xx,yy,oGore2); i.isSolid = s}
k = instance_create(xx,yy,oGore4);
k.isSolid = s;
