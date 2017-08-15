/// @description Insert description here
// You can write your code in this editor


image_angle += (speed / 2);
if (fade) {image_alpha = lin(image_alpha, 0, 0.02);} 
if (image_alpha <= 0) {instance_destroy();} 

scrShaderDrawColor()

depth = -1;