///aStar_get_height()
/*
 * Gives the height (amount of cells vertically) of the grid
 *
 * Returns: The amount of cells vertically, or undefined if the pathfinder is not
 *          initialized
*/
if(instance_exists(obj_pathfinder))
{
    return ds_grid_height(obj_pathfinder.cells);
}
return undefined;

