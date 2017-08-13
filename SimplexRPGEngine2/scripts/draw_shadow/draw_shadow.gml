/// draw_shadow(x, y, rad, alpha)
var _x = argument0;
var _y = argument1;
var rx = argument2;
var ry = rx / 2;
draw_set_color(c_black);
draw_set_alpha(min(0.7, argument3));
draw_ellipse(_x - rx, _y - ry, _x + rx, _y + ry, false);
draw_set_color(c_white);
draw_set_alpha(1.0);