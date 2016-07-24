#define scrTrailDraw
/// scrTrailDraw(trail, width1, width2, color1, color2, alpha1, alpha2)

var trail, w1, w2, c1, c2, a1, a2, traillenght, linewidth;
trail = -1;
w1    = 1;
w2    = 2;
c1    = c_black;
c2    = c_white;
a1    = 1;
a2    = 0;

if (argument_count > 0) {trail = argument[0];}
if (argument_count > 1) {w1    = argument[1];}
if (argument_count > 2) {w2    = argument[2];}
if (argument_count > 3) {c1    = argument[3];}
if (argument_count > 4) {c2    = argument[4];}
if (argument_count > 5) {a1    = argument[5];}
if (argument_count > 6) {a2    = argument[6];}

traillength = ds_grid_width(trail); 
linewidth   = w1;

for (i = (traillength - 2); i >= 0; i--)
{
    linewidth = (w1 * (traillength - 1 - i) / (traillength - 1) + w2 *(i+1) / (traillength - 1));
    clr(merge_color(c2, c1,(traillength - 1 - i) / (traillength - 1)), a1 * (traillength - 1 - i) / (traillength - 1) + a2 * (i + 1) / (traillength - 1));

    if ((ds_grid_get(trail, i, 0) != ds_grid_get(trail, i + 1, 0) || ds_grid_get(trail, i, 1) != ds_grid_get(trail, i + 1, 1)) && (ds_grid_get(trail, i, 0) != -1000 || ds_grid_get(trail, i, 1) != -1000) && (ds_grid_get(trail, i + 1, 0) != -1000 || ds_grid_get(trail, i + 1, 1) != -1000))
        {
        draw_line_width(ds_grid_get(trail, i, 0), ds_grid_get(trail, i, 1), ds_grid_get(trail, i + 1, 0), ds_grid_get(trail, i + 1, 1), linewidth);
        } 
}

#define scrTrailDrawWrapper
/// scrTrailDrawWrapper(addCurrentPos, applyDrift, applyScatter, drawTrail)

var ap, ad, as, dt;
ap = true;
ad = true;
as = true;
dt = true;

if (argument_count > 0)  {ap = argument[0];}
if (argument_count > 1)  {ad = argument[1];}
if (argument_count > 2)  {as = argument[2];}
if (argument_count > 3)  {dt = argument[3];}


if (ap) { scrTrailUpdate(trail, x, y); }
if (ad) { scrTrailDrift(trail, xd, yd); }
if (as) { scrTrailScatter(trail, xs, ys); }
if (dt) { scrTrailDraw(trail, w1, w2, c1, c2, a1, a2); }


    