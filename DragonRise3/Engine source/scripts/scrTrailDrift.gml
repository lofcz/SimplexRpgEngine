/// scrTrailDrift(trail, xdrift, ydrift)

var trail, xdrift, ydrift, traillenght;
trail  = -1;
xdrift = 1;
ydrift = 1;

if (argument_count > 0) {trail  = argument[0];}
if (argument_count > 1) {xdrift = argument[1];}
if (argument_count > 2) {ydrift = argument[2];}

traillength = ds_grid_width(trail);

for (i = 0; i < traillength; i++)
{
    if (ds_grid_get(trail, i, 0)!= -1000 || ds_grid_get(trail, i, 1) != -1000)
    {
        ds_grid_set(trail, i, 0, (ds_grid_get(trail,i,0) + xdrift));
        ds_grid_set(trail, i, 1, (ds_grid_get(trail,i,1) + ydrift));
    }
}
