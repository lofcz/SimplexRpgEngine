///aStar_get_node_with_lowest_cost(openList, fCostGrid, gCostGrid)
/*
 * Gives the node with the lowest fCost. If multiple nodes have the same fCost, the one
 * with the lowest gCost is returned.
 *
 * openList:  The list of nodes to choose from
 * fCostGrid: The grid of fCosts
 * gCostGrid: The grid of gCosts
 *
 * Returns: The index of the node in the open list
*/
var open = argument0;
var fCost = argument1;
var gCost = argument2;
var lowest = -1;
var lowestCost = -1;
var lowestPosition = 0;
for(var i = 0; i < ds_list_size(open); i ++)
{
    //If we have no lowest node yet
    if(lowest == -1)
    {
        lowest = i;
        lowestPosition = ds_list_find_value(open, i);
        lowestCost = ds_grid_get(fCost, position_get_x(lowestPosition), position_get_y(lowestPosition));
    }
    else
    {
        //Check if this node's fCost is lower than the lowest node
        var position = ds_list_find_value(open, i);
        var cost = ds_grid_get(fCost, position_get_x(position), position_get_y(position));
        if(cost < lowestCost)
        {
            lowest = i;
            lowestPosition = position;
            lowestCost = cost;
        }
        //If the fCost is the same, check the gCost
        if(cost == lowestCost)
        {
            var g = ds_grid_get(gCost, position_get_x(position), position_get_y(position));
            var lowestG = ds_grid_get(gCost, position_get_x(lowestPosition), position_get_y(lowestPosition));
            if(g < lowestG)
            {
                lowest = i;
                lowestPosition = position;
                lowestCost = cost;
            }
        }
    }
}
return lowest;

