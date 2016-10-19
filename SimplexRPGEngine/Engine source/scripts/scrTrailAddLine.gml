/// scrTrailAddLine(trail, x1, y1, x2, y2, verticlesToAdd)

var traillength, trail, wavg, x1, y1, x2, y2, vta
trail = -1;
x1    = x;
y1    = y;
x2    = x + 100;
y2    = y + 100;
vta   = 64;

if (argument_count > 0) {trail = argument[0];}
if (argument_count > 1) {x1    = argument[1];}
if (argument_count > 2) {y1    = argument[2];}
if (argument_count > 3) {x2    = argument[2];}
if (argument_count > 4) {y2    = argument[3];}
if (argument_count > 5) {vta   = argument[5];}

traillength = ds_grid_width(trail);

for (i = (traillength - 1); i >= vta; i--)
{
    ds_grid_set(trail, i, 0, ds_grid_get(trail,i-vta,0));
    ds_grid_set(trail, i, 1, ds_grid_get(trail,i-vta,1));
}

for (i = (vta - 1); i >= 0; i--)
{
    wavg = (i / (trail - 1));
    ds_grid_set(trail, i, 0, x1 * wavg + y1 * (1 - wavg));
    ds_grid_set(trail, i, 1, x2 * wavg + y2 * (1 - wavg));
}
