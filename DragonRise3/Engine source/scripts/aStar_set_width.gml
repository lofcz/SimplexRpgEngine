///aStar_set_width(width)
/*
 * Sets the new width (amount of cells horizontally) of the grid.
 *
 * width: The new width
 *
 * Returns: None
*/
if(instance_exists(obj_pathfinder))
{
    ds_grid_resize(obj_pathfinder.cells, argument0, ds_grid_height(obj_pathfinder.cells));
}

