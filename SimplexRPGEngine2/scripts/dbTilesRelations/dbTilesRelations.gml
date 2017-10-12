/// dbTilesRelations(index, x, y)

var xx, yy, index, array;
index = argument0;
xx = argument1;
yy = argument2;

array[0] = -1;

if (index == sprite291)
{
	if (point_in_rectangle(xx, yy, 0, 416, 31, 447))
	{
		array[0] = 1;
		array[1] = 0;
	}
}

return array;