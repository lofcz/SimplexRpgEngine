/// scrTrailUpdate(trail, x, y)

var traillength, trail, xx, yy;
trail = -1;
xx    = x;
yy    = y;

if (argument_count > 0) {trail = argument[0];}
if (argument_count > 1) {xx    = argument[1];}
if (argument_count > 2) {yy    = argument[2];}

traillength = ds_grid_width(trail);

for (i = (traillength - 1); i > 0; i--)
{
    ds_grid_set(trail, i, 0, ds_grid_get(trail,i-1,0));
    ds_grid_set(trail, i, 1, ds_grid_get(trail,i-1,1));
}

ds_grid_set(trail,0,0,xx);
ds_grid_set(trail,0,1,yy);
