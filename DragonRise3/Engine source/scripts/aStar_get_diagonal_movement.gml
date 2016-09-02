///aStar_get_diagonal_movement()
/*
 * Checks if the pathfinder can move diagonally
 *
 * Returns: true if moving diagonally is allowed, false otherwise, or undefined if the 
 *          pathfinder is not initialized.
*/
if(instance_exists(obj_pathfinder))
    return obj_pathfinder.cuttingCorners;
return undefined;

