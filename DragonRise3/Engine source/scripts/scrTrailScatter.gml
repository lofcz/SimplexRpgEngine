/// scrTrailScatter(trail, xscatter, yscatter)

var trail, xdrift, ydrift, traillenght;
trail  = -1;
xs     = 1;
ys     = 1;

if (argument_count > 0) {trail  = argument[0];}
if (argument_count > 1) {xs     = argument[1];}
if (argument_count > 2) {ys     = argument[2];}

traillength = ds_grid_width(trail);

for (i = 0; i < traillength; i++)
{
    if (ds_grid_get(trail, i, 0)!=-1000 || ds_grid_get(trail, i, 1)!=-1000)
    {
        ds_grid_set(trail, i, 0, (ds_grid_get(trail, i, 0) + (0.5 * xs - random(xs))));
        ds_grid_set(trail, i, 1, (ds_grid_get(trail,i,1) + (0.5 * ys - random(ys))));
    }
}
