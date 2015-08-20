///scrGoreLight(x,y)

var xx,yy;
xx  = x;
yy  = y;


if (argument_count > 0) {xx  = argument[0];}
if (argument_count > 1) {yy  = argument[1];}


instance_create(xx,yy,oGore3);