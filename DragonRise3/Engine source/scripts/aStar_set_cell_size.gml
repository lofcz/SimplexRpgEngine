///aStar_set_cell_size(size)
/*
 * Sets the size of a cell.
 *
 * size: The new size of each cell.
 *
 * Returns: none
*/
if(instance_exists(obj_pathfinder))
    obj_pathfinder.cellSize = argument0;

