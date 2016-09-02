///aStar_init(maxWidth, maxHeight, cellSize, allowDiagonalMovement, allowCuttingBlockedCorners)
/*
 * Initialized the path finder.
 *
 * maxWidth:                   amount of cells in x
 * maxHeight:                  amount of cells in y
 * cellSize:                   the size of each cell
 * allowDiagonalMovement:      if the pathfinder is allowed to move diagonally
 * allowCuttingBlockedCorners: if the pathfinder is allowed to cut blocked corners (read
 *                             more about this in aStar_get_cutting_blocked_corners)
 *
 * Returns: true if the pathfinder was initialized successfully, false otherwise.
*/

if(instance_exists(obj_pathfinder))
{
    show_message("Trying to initiate pathfinder, but is already initialized");
    return false;
}
var finder = instance_create(0, 0, obj_pathfinder);
var width = argument0, height = argument1, cellSize = argument2, cuttingCorners = argument3, cuttingBlockedCorners = argument4;
finder.cellSize = cellSize;
finder.cells = ds_grid_create(width, height);
finder.cuttingCorners = cuttingCorners;
finder.cuttingBlockedCorners = cuttingBlockedCorners;
return true;

