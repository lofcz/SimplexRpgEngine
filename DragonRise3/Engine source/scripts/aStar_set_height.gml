///aStar_set_height(height)
/*
 * Sets the new height (amount of cells vertically) of the grid.
 *
 * height: The new height
 *
 * Returns: None
*/
if(instance_exists(obj_pathfinder))
{
    ds_grid_resize(obj_pathfinder.cells, ds_grid_width(obj_pathfinder.cells), argument0);
}

