var i;
var (trail) = argument0; // name of trail
var (w1) = argument1; // inner width
var (w2) = argument2; // outer width
var (c1) = argument3; // inner color
var (c2) = argument4; // outer color
var (a1) = argument5; // inner alpha
var (a2) = argument6; // outer alpha
var (traillength) = ds_grid_width(trail); // length of trail
var (linewidth) = w1; // width of current section of trail

// draw lines connecting all trail coordinates
for(i=traillength-2; i>=0; i-=1)
{
    linewidth = w1*(traillength-1-i)/(traillength-1) + w2*(i+1)/(traillength-1); // set the width as the average of w1 and w2 weighted by the position in the trail
    draw_set_color(merge_color(c2,c1,(traillength-1-i)/(traillength-1))); // set the color as the average of c1 and c2 weighted by the position in the trail
    draw_set_alpha(a1*(traillength-1-i)/(traillength-1) + a2*(i+1)/(traillength-1)); // set the transparency as the average of a1 and a2 weighted by the position in the trail

    if ((ds_grid_get(trail,i,0)!=ds_grid_get(trail,i+1,0) or ds_grid_get(trail,i,1)!=ds_grid_get(trail,i+1,1)) and (ds_grid_get(trail,i,0)!=-1000 or ds_grid_get(trail,i,1)!=-1000) and (ds_grid_get(trail,i+1,0)!=-1000 or ds_grid_get(trail,i+1,1)!=-1000)) // make sure that the either the x coordinates or the y coordinates are different, and that trail is not at (-1000,-1000) (which is how I demark trail "positions" not to be drawn)
        {draw_line_width(ds_grid_get(trail,i,0),ds_grid_get(trail,i,1),ds_grid_get(trail,i+1,0),ds_grid_get(trail,i+1,1),linewidth);} // draw the line over the section of trail
}