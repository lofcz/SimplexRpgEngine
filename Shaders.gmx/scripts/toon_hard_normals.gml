/*
toon_hard_normals()
Don't worry about this script, it is only used by the toon_primitive_end_hard script

Written by TheSnidr
www.thesnidr.com
*/
var g, h, j, i, cx, cy, cz, c;
g = triangleGrid;
h = ds_grid_height(g)
for (j = 0; j < h - 2; j += 3)
{
    i = j
    xx[0] = ds_grid_get(g, 0, i)
    yy[0] = ds_grid_get(g, 1, i)
    zz[0] = ds_grid_get(g, 2, i)
    nx[0] = ds_grid_get(g, 3, i)
    ny[0] = ds_grid_get(g, 4, i)
    nz[0] = ds_grid_get(g, 5, i)
    
    i ++
    xx[1] = ds_grid_get(g, 0, i)
    yy[1] = ds_grid_get(g, 1, i)
    zz[1] = ds_grid_get(g, 2, i)
    nx[1] = ds_grid_get(g, 3, i)
    ny[1] = ds_grid_get(g, 4, i)
    nz[1] = ds_grid_get(g, 5, i)
    
    i ++
    xx[2] = ds_grid_get(g, 0, i)
    yy[2] = ds_grid_get(g, 1, i)
    zz[2] = ds_grid_get(g, 2, i)
    nx[2] = ds_grid_get(g, 3, i)
    ny[2] = ds_grid_get(g, 4, i)
    nz[2] = ds_grid_get(g, 5, i)
    
    cx = (yy[1] - yy[0]) * (zz[2] - zz[0]) - (yy[2] - yy[0]) * (zz[1] - zz[0])
    cy = (zz[1] - zz[0]) * (xx[2] - xx[0]) - (zz[2] - zz[0]) * (xx[1] - xx[0])
    cz = (xx[1] - xx[0]) * (yy[2] - yy[0]) - (xx[2] - xx[0]) * (yy[1] - yy[0])
    c = max(point_distance_3d(0, 0, 0, cx, cy, cz), 0.0001)
    cx /= c
    cy /= c
    cz /= c
    ds_grid_set(g, 8, j, cx)
    ds_grid_set(g, 9, j, cy)
    ds_grid_set(g, 10, j, cz)
    ds_grid_set(g, 8, j + 1, cx)
    ds_grid_set(g, 9, j + 1, cy)
    ds_grid_set(g, 10, j + 1, cz)
    ds_grid_set(g, 8, j + 2, cx)
    ds_grid_set(g, 9, j + 2, cy)
    ds_grid_set(g, 10, j + 2, cz) 
}