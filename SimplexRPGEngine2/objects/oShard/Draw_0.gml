/// @description Insert description here
// You can write your code in this editor

if (image_alpha <= 0.05) {instance_destroy()}
draw_sprite_part_ext(sprite_index, -1, _x, _y, _w, _h, x, y - z, 1, 1, c_white, image_alpha);

if (speed <= 1) {image_alpha = lerp(image_alpha, 0, 0.1);}

if (z > 0) 
   {
    z += zspeed;
    zspeed += zgravity;
    }

if (z < 0) 
   {
    z       = -z;
    zspeed = abs(zspeed) * 0.2 - 0.7;
    
    if (zspeed < 1) 
       {
        z      = 0;
        zspeed = 0;
       }
    }
