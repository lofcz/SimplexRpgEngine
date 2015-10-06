/*
toon_smooth_normals()
Don't worry about this script, it's not used for anything right now

Written by TheSnidr
www.thesnidr.com
*/
var g, h, nMap, j, xx, yy, zz, avgX, avgY, avgZ, key, list, n, l;
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
        
    cross_product(xx[1] - xx[0], yy[1] - yy[0], zz[1] - zz[0], xx[2] - xx[0], yy[2] - yy[0], zz[2] - zz[0])
    normalize(returnX, returnY, returnZ)
    ds_grid_set(g, 8, j, returnX)
    ds_grid_set(g, 9, j, returnY)
    ds_grid_set(g, 10, j, returnZ)
    ds_grid_set(g, 8, j + 1, returnX)
    ds_grid_set(g, 9, j + 1, returnY)
    ds_grid_set(g, 10, j + 1, returnZ)
    ds_grid_set(g, 8, j + 2, returnX)
    ds_grid_set(g, 9, j + 2, returnY)
    ds_grid_set(g, 10, j + 2, returnZ) 
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
//Save the normals to the model grid
for (j = 0; j < h; j += 1)
{
    xx = ds_grid_get(g, 0, j)
    yy = ds_grid_get(g, 1, j)
    zz = ds_grid_get(g, 2, j)
    
    str = string(round(xx * 1000)) + "|" + string(round(yy * 1000)) + "|" + string(round(zz * 1000))
    list = ds_map_find_value(nMap, str)
    ds_grid_set(g, 3, j, ds_list_find_value(list, 0))
    ds_grid_set(g, 4, j, ds_list_find_value(list, 1))
    ds_grid_set(g, 5, j, ds_list_find_value(list, 2))
}