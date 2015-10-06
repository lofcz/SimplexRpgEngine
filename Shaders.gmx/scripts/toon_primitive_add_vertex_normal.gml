/*
toon_primitive_add_vertex_normal(x, y, z, nx, ny, nz, xtex, ytex)
If you want to define the normals yourself and only create the hard normals, 
use this. HARD NORMALS MUST BE CREATED!

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
//(nx, ny, nz)
ds_grid_set(triangleGrid, 3, v, argument3)
ds_grid_set(triangleGrid, 4, v, argument4)
ds_grid_set(triangleGrid, 5, v, argument5)
//(xtex, ytex)
ds_grid_set(triangleGrid, 6, v, argument6)
ds_grid_set(triangleGrid, 7, v, argument7)
//(nx2, ny2, nz2)
ds_grid_set(triangleGrid, 8, v, argument3)
ds_grid_set(triangleGrid, 9, v, argument4)
ds_grid_set(triangleGrid, 10, v, argument5)
vertices += 1