/// scrTrailDestroy(trail)

var trail;
trail = -1;

if (argument_count > 0) {trail = argument[0];}

ds_grid_destroy(trail);
