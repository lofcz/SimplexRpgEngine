///aStar_set_diagonal_movement(diagonalMovement)
/*
 * Sets if the pathfinder are allowed to move diagonally or not.
 *
 * diagonalMovement: if the pathfinder should be able to move diagonally
 *
 * Returns: None
*/
if(instance_exists(obj_pathfinder))
    obj_pathfinder.cuttingCorners = argument0;

