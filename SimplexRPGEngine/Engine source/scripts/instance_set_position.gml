/// instance_set_position(x, y, instance)

var xx, yy, o;
xx = x;
yy = y;
o  = self;

if (argument_count > 0) {xx = argument[0];}
if (argument_count > 1) {yy = argument[1];}
if (argument_count > 2) {o  = argument[2];}

with(o) {x = xx; y = yy;}
