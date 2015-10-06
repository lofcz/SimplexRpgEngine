/*
toon_primitive_end_smooth(model)
If you've defined your vertices with toon_primitive_add_vertex, you should use this to
end the primitive. It generates both smooth and hard normals. This script is slow.

Written by TheSnidr
www.thesnidr.com
*/
var m, g, h, nMap, j, i, str, cx, cy, cz, c, key, list, n, avgX, avgY, avgZ, xx, yy, zz, tx, ty, nx, ny, nz, nx2, ny2, nz2, l;
m = argument0
g = triangleGrid;
h = ds_grid_height(g)
nMap = ds_map_create()
for (j = 0; j < h; j += 3)
{
    xx[0] = ds_grid_get(g, 0, j)
    yy[0] = ds_grid_get(g, 1, j)
    zz[0] = ds_grid_get(g, 2, j)
    xx[1] = ds_grid_get(g, 0, j + 1)
    yy[1] = ds_grid_get(g, 1, j + 1)
    zz[1] = ds_grid_get(g, 2, j + 1)
    xx[2] = ds_grid_get(g, 0, j + 2)
    yy[2] = ds_grid_get(g, 1, j + 2)
    zz[2] = ds_grid_get(g, 2, j + 2)
    
    for (i = 0; i < 3; i ++){
        str = string(round(xx[i] * 1000)) + "|" + string(round(yy[i] * 1000)) + "|" + string(round(zz[i] * 1000))
        if !ds_map_exists(nMap, str){
            ds_map_add(nMap, str, ds_list_create())}
        ds_list_add(ds_map_find_value(nMap, str), j + i)}
    
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

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//Average the normals
key = ds_map_find_first(nMap)
while is_string(key)
{
    list = ds_map_find_value(nMap, key) //A list over the triangles that have at least one point with the same coordinate
    n = ds_list_size(list)
    avgX = 0
    avgY = 0
    avgZ = 0
    for (u = 0; u < n; u ++)
    {
        triangle = ds_list_find_value(list, u)  //The index of one of the vertices
        avgX += ds_grid_get(g, 8, triangle)
        avgY += ds_grid_get(g, 9, triangle)
        avgZ += ds_grid_get(g, 10, triangle)
    }
    l = max(point_distance_3d(0, 0, 0, avgX, avgY, avgZ), 0.0001)
    ds_list_clear(list)
    ds_list_add(list, avgX / l)
    ds_list_add(list, avgY / l)
    ds_list_add(list, avgZ / l)
    
    key = ds_map_find_next(nMap, key)
}

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//Save the normals to the model grid and create model
d3d_model_primitive_begin(m, pr_trianglelist)
for (j = 0; j < h; j += 1)
{
    xx = ds_grid_get(g, 0, j)
    yy = ds_grid_get(g, 1, j)
    zz = ds_grid_get(g, 2, j)
    tx = ds_grid_get(g, 6, j)
    ty = ds_grid_get(g, 7, j)
    nx2 = ds_grid_get(g, 8, j)
    ny2 = ds_grid_get(g, 9, j)
    nz2 = ds_grid_get(g, 10, j)
    str = string(round(xx * 1000)) + "|" + string(round(yy * 1000)) + "|" + string(round(zz * 1000))
    list = ds_map_find_value(nMap, str)
    nx = ds_list_find_value(list, 0)
    ny = ds_list_find_value(list, 1)
    nz = ds_list_find_value(list, 2)
    
    d3d_model_vertex_normal_texture_color(m, xx, yy, zz, ds_list_find_value(list, 0), ds_list_find_value(list, 1), ds_list_find_value(list, 2), tx, ty, make_color_rgb((nx2 + 1) * 127.5, (ny2 + 1) * 127.5, (nz2 + 1) * 127.5), 1)
}
d3d_model_primitive_end(m)
ds_grid_destroy(g)

size = ds_map_size(nMap)
key = ds_map_find_first(nMap)
repeat size
{
    ds_list_destroy(ds_map_find_value(nMap, key))
    key = ds_map_find_next(nMap, key)
}
ds_map_destroy(nMap)