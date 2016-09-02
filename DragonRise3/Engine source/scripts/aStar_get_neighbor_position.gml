///aStar_get_neighbor_position(position, i)
/*
 * Gives a neighbor of the cell at the given position.
 *
 * position: The position of the cell
 * i:        The neighbor (0-7), going counter clockwise starting from the right
 *
 * Returns: The position of the neighbor, or undefined if the neighbor does not exists
*/
var position = argument0, i = argument1;
var positionX = position_get_x(position);
var positionY = position_get_y(position);
var width = ds_grid_width(obj_pathfinder.cells);
var height = ds_grid_height(obj_pathfinder.cells);

if(i == 0)
{
    if(positionX + 1 < width && positionY < height)
        return position_create(positionX + 1, positionY    );
    return undefined;
}
if(i == 1 && aStar_get_diagonal_movement())
{
    if(!aStar_get_cutting_blocked_corners() && (aStar_get_blocked(positionX + 1, positionY) || aStar_get_blocked(positionX, positionY - 1)))
        return undefined;
    if(positionX + 1 < width && positionY - 1 >= 0)
        return position_create(positionX + 1, positionY - 1);
    return undefined;
}
if(i == 2)
{
    if(positionX < width && positionY - 1 >= 0)
        return position_create(positionX, positionY -1);
    return undefined;
}
if(i == 3 && aStar_get_diagonal_movement())
{
    if(!aStar_get_cutting_blocked_corners() && (aStar_get_blocked(positionX - 1, positionY) || aStar_get_blocked(positionX, positionY - 1)))
        return undefined;
    if(positionX - 1 >= 0 && positionY - 1 >= 0)
        return position_create(positionX - 1, positionY - 1);
    return undefined;
}
if(i == 4)
{
    if(positionX - 1 >= 0 && positionY < height)
        return position_create(positionX - 1, positionY    );
    return undefined;
}
if(i == 5 && aStar_get_diagonal_movement())
{
    if(!aStar_get_cutting_blocked_corners() && (aStar_get_blocked(positionX - 1, positionY) || aStar_get_blocked(positionX, positionY + 1)))
        return undefined;
    if(positionX - 1 >= 0 && positionY + 1 < height)
        return position_create(positionX - 1, positionY + 1);
    return undefined;
}
if(i == 6)
{
    if(positionX < width && positionY + 1 < height)
        return position_create(positionX, positionY + 1);
    return undefined;
}
if(i == 7 && aStar_get_diagonal_movement())
{
    if(!aStar_get_cutting_blocked_corners() && (aStar_get_blocked(positionX + 1, positionY) || aStar_get_blocked(positionX, positionY + 1)))
        return undefined;
    if(positionX + 1 < width && positionY + 1 < height)
        return position_create(positionX + 1, positionY + 1);
    return undefined;
}

return undefined;

