var (traillength) = ds_grid_width(argument0);
var i, wavg;

// set the points at the end of the trail to ones further up on the trail
for(i=traillength-1; i>=argument5; i-=1)
{
    ds_grid_set(argument0,i,0,ds_grid_get(argument0,i-argument5,0));
    ds_grid_set(argument0,i,1,ds_grid_get(argument0,i-argument5,1));
}

// set the points to be strung across the line
for (i=argument5-1; i>=0; i-=1)
{
    wavg = i/(argument5-1); // goes from 1 to 0
    ds_grid_set(argument0,i,0,argument1*wavg+argument3*(1-wavg));
    ds_grid_set(argument0,i,1,argument2*wavg+argument4*(1-wavg));
}