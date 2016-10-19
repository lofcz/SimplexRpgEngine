///aStar_set_size(width, height)
/*
 * Sets the new width (amount of cells horizontally) and the height (amount of cells
 * vertically) of the grid.
 *
 * width:  The new width
 * height: The new height
 *
 * Returns: None
*/
if(instance_exists(obj_pathfinder))
{
    ds_grid_resize(obj_pathfinder.cells, argument0, argument1);
}

