///aStar_heuristic_cost(fromX, fromY, toX, toY)
/*
 * Checks the heuristic cost from one point to another
 *
 * fromX: The start x coordinate
 * fromY: The start y coordinate
 * toX:   The end x coordinate
 * toY:   the end y coordinate
 *
 * Returns: The heuristic cost from one point to another
*/
var dx = abs(argument0 - argument2);
var dy = abs(argument1 - argument3);
return (dx + dy) * 10;

