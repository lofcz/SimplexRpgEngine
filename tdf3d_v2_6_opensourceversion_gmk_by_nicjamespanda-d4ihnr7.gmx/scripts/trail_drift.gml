var (traillength) = ds_grid_width(argument0);
var i;

for(i=0; i<traillength; i+=1)
{
    if (ds_grid_get(argument0,i,0)!=-1000 or ds_grid_get(argument0,i,1)!=-1000)
    {
        ds_grid_set(argument0,i,0,ds_grid_get(argument0,i,0)+argument1);
        ds_grid_set(argument0,i,1,ds_grid_get(argument0,i,1)+argument2);
    }
}