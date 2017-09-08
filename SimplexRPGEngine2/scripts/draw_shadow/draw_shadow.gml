/// @function draw_shadow(x, y, r, alpha)
/// @desc Draws ground shadow, simulating 3D space
/// @arg {int} x x-pos
/// @arg {int} y y-pos
/// @arg {int} r Radius of shadow
/// @arg {int} alpha Draw alpha

var dx, dy, rx, ry, da; 
dx = x;
dy = y;
rx = 32;
da = 1;

if (argument_count > 0) {dx = argument[0];}
if (argument_count > 1) {dy = argument[1];}
if (argument_count > 2) {rx = argument[2];}
if (argument_count > 3) {da = argument[3];}

ry = rx / 2;

clr(c_black, min(0.7, da));
draw_ellipse(dx - rx, dy - ry, dx + rx, dy + ry, false);
clr();