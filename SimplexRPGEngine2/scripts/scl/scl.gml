/// @description  scl(xscale, yscale)
/// @function  scl
/// @param xscale
/// @param  yscale

var xs, ys;
xs = 1;
ys = 1;

if (argument_count > 0) {xs = argument[0];}
if (argument_count > 1) {ys = argument[1];}

image_xscale = xs;
image_yscale = ys;
