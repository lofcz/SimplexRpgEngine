/// @description Insert description here
// You can write your code in this editor

image_angle = direction;

if (fade)
   {
    if (image_alpha >= 0){image_alpha = lin(image_alpha, 0, 0.1);}
    else {instance_destroy()}   
   }

scrShaderDrawColor()
