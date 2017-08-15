/// @description Insert description here
// You can write your code in this editor

/// Set up

image_angle = random(360);
image_index = random(image_number - 1); 
image_alpha = 0.9; 
image_speed = 0;
alarm[0]    = random(50) + 10; 
fade        = false;
scrShaderPrepareColor();

depth = 2;