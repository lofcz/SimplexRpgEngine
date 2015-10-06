/*
toon_primitive_add_vertex(x, y, z, xtex, ytex)

Written by TheSnidr
www.thesnidr.com
*/
var v;
v = vertices
ds_grid_resize(triangleGrid, 11, v + 1)
//(x, y, z)
ds_grid_set(triangleGrid, 0, v, argument0)
ds_grid_set(triangleGrid, 1, v, argument1)
ds_grid_set(triangleGrid, 2, v, argument2)
//(xtex, ytex)
ds_grid_set(triangleGrid, 6, v, argument3)
ds_grid_set(triangleGrid, 7, v, argument4)
vertices += 1