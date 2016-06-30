/// clr(color, alpha)

var color,alpha;

color = c_black;
alpha = 1;

if (argument_count > 0) {color = argument[0];}
if (argument_count > 1) {alpha = argument[1];}

draw_set_colour(color);
draw_set_alpha(alpha);
