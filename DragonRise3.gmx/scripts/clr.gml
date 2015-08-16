/// clr(colour,alpha)        clr()

colour = c_black;
alpha  = 1;

if (argument_count > 0) {colour = argument[0];}
if (argument_count > 1) {alpha  = argument[1];}

draw_set_colour(colour);
draw_set_alpha(alpha);