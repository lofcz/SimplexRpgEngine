///aStar_get_cutting_blocked_corners()
/*
 * Checks if the pathfinder can cut blocked corners (move diagonally and go between two
 * blocked cells)
 *
 * P = Player, G = Goal, X = Blocked.
 * If cuttingBlockedCorners is true, the player can reach the goal. If cuttingBlockedCorners
 * is false, the player cannot reach the goal since it cannot cross blocked corners.
 *    ________
 *   | |X| | |
 *   |P| | |X|
 *   |_|_|X|G|
 *
 * Returns: true if cutting blocked corners is allowed, false otherwise, or undefined if the 
 *          pathfinder is not initialized.
*/
if(instance_exists(obj_pathfinder))
    return obj_pathfinder.cuttingBlockedCorners;
return undefined;

