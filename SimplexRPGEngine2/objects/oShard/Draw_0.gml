/// @description Insert description here
// You can write your code in this editor

if (image_alpha <= 0.05) {instance_destroy()}

shader_set(shdColor);
m = c_white;
shader_set_uniform_f(shader_get_uniform(shdColor, "f_ChannelMask"), color_get_red(m) / 255, color_get_green(m) / 255, color_get_blue(m) / 255, 1);
draw_sprite_part_ext(sprite_index, -1, _x, _y, _w, _h, x, y - z, 1, 1, c_white, image_alpha);
shader_reset();

if (speed <= 1 && mode == 0) {image_alpha = lerp(image_alpha, 0, 0.1);}
if (mode == 1) {if (speed < 1) {if (life <= 0) {image_alpha = lerp(image_alpha, 0, 0.1);} else {life--;}}}

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
