///aStar_set_blocked(x, y, blocked)
/*
 * Makes the given cell blocked/unblocked.
 *
 * x:       The x-coordinate, in cell-coordinates, not world coordinates
 * y:       The y-coordinate, in cell-coordinates, not world coordinates
 * blocked: if the cell should be blocked (true) or not (false)
 *
 * Returns: None
*/
if(instance_exists(obj_pathfinder))
{
    if(argument0 >= 0 && argument0 < ds_grid_width(obj_pathfinder.cells) && argument1 >= 0 && argument1 < ds_grid_height(obj_pathfinder.cells))
        ds_grid_set(obj_pathfinder.cells, argument0, argument1, argument2);
}

