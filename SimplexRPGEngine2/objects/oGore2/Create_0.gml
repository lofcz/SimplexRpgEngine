/// @description Insert description here
// You can write your code in this editor

/// Set up

speed        = random(10) + 5;
friction     = 0.3;
direction    = random(360); 
image_angle  = random(360); 
image_single = random(image_number - 1);
image_xscale = random(1); 
image_yscale = image_xscale;
fade         = false; 
alarm[0]     = 150;
alarm[1]     = 3;
scrShaderPrepareColor();
