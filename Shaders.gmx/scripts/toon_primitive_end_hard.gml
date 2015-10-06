/*
toon_primitive_end_hard(model)
If you've defined your own smooth normals with toon_primitive_add_vertex_normal, you can
use this to only create the hard normals. This is a lot faster than generating smooth normals

Written by TheSnidr
www.thesnidr.com
*/
var m, g, h, j, i, xx, yy, zz, nx, ny, nz, tx, ty, nx2, ny2, nz2;
m = argument0
g = triangleGrid
h = ds_grid_height(g)
toon_hard_normals()
d3d_model_primitive_begin(m, pr_trianglelist)
for (var j = 0; j < h-2; j += 3)
{
    i = j
    xx[0] = ds_grid_get(g, 0, i)
    yy[0] = ds_grid_get(g, 1, i)
    zz[0] = ds_grid_get(g, 2, i)
    nx[0] = ds_grid_get(g, 3, i)
    ny[0] = ds_grid_get(g, 4, i)
    nz[0] = ds_grid_get(g, 5, i)
    tx[0] = ds_grid_get(g, 6, i)
    ty[0] = ds_grid_get(g, 7, i)
    
    i ++
    xx[1] = ds_grid_get(g, 0, i)
    yy[1] = ds_grid_get(g, 1, i)
    zz[1] = ds_grid_get(g, 2, i)
    nx[1] = ds_grid_get(g, 3, i)
    ny[1] = ds_grid_get(g, 4, i)
    nz[1] = ds_grid_get(g, 5, i)
    tx[1] = ds_grid_get(g, 6, i)
    ty[1] = ds_grid_get(g, 7, i)
    
    i ++
    xx[2] = ds_grid_get(g, 0, i)
    yy[2] = ds_grid_get(g, 1, i)
    zz[2] = ds_grid_get(g, 2, i)
    nx[2] = ds_grid_get(g, 3, i)
    ny[2] = ds_grid_get(g, 4, i)
    nz[2] = ds_grid_get(g, 5, i)
    tx[2] = ds_grid_get(g, 6, i)
    ty[2] = ds_grid_get(g, 7, i)
    
    nx2 = ds_grid_get(g, 8, i)
    ny2 = ds_grid_get(g, 9, i)
    nz2 = ds_grid_get(g, 10, i)
    
    for (k = 0; k < 3; k ++)
    {
        d3d_model_vertex_normal_texture_color(m, xx[k], yy[k], zz[k], nx[k], ny[k], nz[k], tx[k], ty[k], make_color_rgb((nx2 + 1) * 127.5, (ny2 + 1) * 127.5, (nz2 + 1) * 127.5), 1)
    }
}
d3d_model_primitive_end(m)
ds_grid_destroy(g)