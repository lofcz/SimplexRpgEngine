/// scrTrailCreate(length, x, y)

var trail, lenght, xx, yy;
lenght = 64;
xx     = x;
yy     = y;

if (argument_count > 0) {lenght = argument[0];}
if (argument_count > 1) {xx     = argument[1];}
if (argument_count > 2) {yy     = argument[2];}

trail = ds_grid_create(lenght, 2);

for (i = 0; i < lenght; i++)
{
    ds_grid_add(trail, i, 0, xx);
    ds_grid_add(trail, i, 1, yy);
}

return (trail); 
