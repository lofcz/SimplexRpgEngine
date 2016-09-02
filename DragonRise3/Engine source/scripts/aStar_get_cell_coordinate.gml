///aStar_get_cell_coordinate(coordinate)
/*
 * Calculates the cell-coordinate from world-coordinates.
 *
 * coordinate: The world coordinate (not a position, just a number like 270 or 4192)
 *
 * Returns: The cell-coordinate
*/
var size = aStar_get_cell_size();
return floor((argument0 - argument0 mod size) / size)

