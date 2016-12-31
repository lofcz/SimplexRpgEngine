/// scrArray2DTo1D(x, y, ylenght)

var xx, yy, yl;
xx = 0;
yy = 0;
yl = 1;

if (argument_count > 0) {xx = argument[0];}
if (argument_count > 1) {yy = argument[1];}
if (argument_count > 2) {yl = argument[2];}

return (xx + (yy * yl)); 
