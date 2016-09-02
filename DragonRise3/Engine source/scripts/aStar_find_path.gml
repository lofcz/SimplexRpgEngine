///aStar_find_path(startX, startY, endX, endY)
/*
 * Finds a path between two points. The position should be in cell-coordinates.
 * If you are unsure of how to calculate that, you can use aStar_get_cell_coordinate.
 *
 * startX: The x position of the start
 * startY: The y position of the start
 * endX:   The x position of the end
 * endY:   The y position of the end
 *
 * Returns: The path from start to end, or undefined if there is no path
*/
if(!instance_exists(obj_pathfinder))
{
    show_message("Path finder has not been initialized!");
    return undefined;
}
var startX = argument0, startY = argument1, endX = argument2, endY = argument3;

var path = path_add();
if(ds_grid_get(obj_pathfinder.cells, endX, endY) == true)
{
    return undefined;
}
if(startX == endX && startY == endY)
{
    return undefined;
}
var width = ds_grid_width(obj_pathfinder.cells), height = ds_grid_height(obj_pathfinder.cells);
var closed = ds_list_create();

for(var i = 0; i < ds_grid_width(obj_pathfinder.cells); i ++)
{
    for(var j = 0; j < ds_grid_height(obj_pathfinder.cells); j ++)
    {
        if(ds_grid_get(obj_pathfinder.cells, i, j))
        {
            ds_list_add(closed, position_create(i, j));
        }
    }
}

var open = ds_list_create();
ds_list_add(open, position_create(startX, startY));

var cameFrom = ds_grid_create(width, height);

ds_grid_clear(cameFrom, -1);

var gCost = ds_grid_create(width, height);
var fCost = ds_grid_create(width, height);

ds_grid_clear(gCost, 2147483647);
ds_grid_set(gCost, startX, startY, 0);

ds_grid_clear(fCost, 2147483647);
ds_grid_set(fCost, startX, startY, aStar_heuristic_cost(startX, startY, endX, endY));

while(ds_list_size(open) > 0)
{
    var lowestX, lowestY;
    var nodeIndex = aStar_get_node_with_lowest_cost(open, fCost, gCost);
    var position = ds_list_find_value(open, nodeIndex);
    lowestX = position_get_x(position);
    lowestY = position_get_y(position);
    if(lowestX == endX && lowestY == endY)
    {
        var cellSize = obj_pathfinder.cellSize;
        path_add_point(path, lowestX * cellSize, lowestY * cellSize, 100);
        while(ds_grid_get(cameFrom, lowestX, lowestY) != -1)
        {
            var nextPosition = ds_grid_get(cameFrom, lowestX, lowestY);
            lowestX = position_get_x(nextPosition);
            lowestY = position_get_y(nextPosition);
            path_add_point(path, lowestX * cellSize, lowestY * cellSize, 100);
        }
        path_reverse(path);
        return path;
    }
    
    ds_list_delete(open, nodeIndex);
    ds_list_add(closed, position);
    for(var i = 0; i < 8; i ++)
    {
        var neighborPosition = aStar_get_neighbor_position(position, i);
        if(neighborPosition == undefined)
            continue;
            
        var neighborX = position_get_x(neighborPosition);
        var neighborY = position_get_y(neighborPosition);
        
        if(ds_list_find_index(closed, neighborPosition) != -1)
            continue;
        var tentativeG = ds_grid_get(gCost, lowestX, lowestY) + aStar_heuristic_cost(lowestX, lowestY, neighborX, neighborY);
        if(ds_list_find_index(open, neighborPosition) == -1)
            ds_list_add(open, neighborPosition);
        else if(tentativeG >= ds_grid_get(gCost, lowestX, lowestY))
            continue;
        
        ds_grid_set(cameFrom, neighborX, neighborY, position);
        ds_grid_set(gCost, neighborX, neighborY, tentativeG);
        ds_grid_set(fCost, neighborX, neighborY, tentativeG + aStar_heuristic_cost(neighborX, neighborY, endX, endY));
    }
}
return undefined;

