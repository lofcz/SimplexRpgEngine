/// @description Insert description here
// You can write your code in this editor

/// Draw self

if (fade) {image_alpha = lin(image_alpha, 0, 0.005);}
if (image_alpha <= 0) {instance_destroy();}

scrShaderDrawColor()

