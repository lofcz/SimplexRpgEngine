///draw_ball(x,y,color);

var backsavealpha=draw_get_alpha();

draw_set_alpha(0.1);
draw_circle_color(argument0,argument1,15.5,make_colour_rgb(1,1,1),make_colour_rgb(1,1,1),1);
draw_set_alpha(0.2);
draw_circle_color(argument0,argument1,15.4,make_colour_rgb(1,1,1),make_colour_rgb(1,1,1),1);
draw_set_alpha(0.3);
draw_circle_color(argument0,argument1,15.3,make_colour_rgb(1,1,1),make_colour_rgb(1,1,1),1);
draw_set_alpha(0.4);
draw_circle_color(argument0,argument1,15.2,make_colour_rgb(1,1,1),make_colour_rgb(1,1,1),1);
draw_set_alpha(0.5);
draw_circle_color(argument0,argument1,15.1,make_colour_rgb(1,1,1),make_colour_rgb(1,1,1),1);
draw_set_alpha(1);
draw_circle_color(argument0,argument1,15,argument2,make_colour_rgb(1,1,1),0);
draw_circle_color(argument0-4,argument1-4,5,c_white,argument2,0);

draw_set_alpha(backsavealpha);

return(true);