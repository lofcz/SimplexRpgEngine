/// @description Insert description here
// You can write your code in this editor

/// Set up

speed      = random_range(1, 3); 
direction  = random(360); 
friction   = 0.1;
actAsSolid = false;
z          = irandom_range(20, 40);
zspeed     = irandom_range(1, 2);
zgravity   = -random_range(0.3, 0.4);
mode = 0;
life = 2;
color = c_white;
c = choose(make_color_rgb(205,133,63), make_color_rgb(210,105,30), make_color_rgb(139,69,19));
n = choose(0.2, 0.4, 0.6, 0.7);

alarm[0] = 1;
image_speed = 0;