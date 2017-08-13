/// @desc [Simplex description line]

//event_inherited();

var vz = z + lengthdir_x(1, image_index / image_number * 360);
draw_shadow(x, y, 6 / (1 + vz / 20), qqa);
if (z <= 0) {image_speed = lerp(image_speed, 0, 0.1); if (image_speed < 0.1) {if (image_index < h) {image_index+=0.5;} if (image_index > h) {image_index-=0.5;} image_speed = 0; image_speed = 0;} qqa = lerp(qqa, 0, 0.1); if (image_angle < 30) {image_angle++;}}
draw_sprite_ext(sprite_index, image_index, x, y - z, image_xscale, image_yscale, f*image_angle, image_blend, image_alpha);


event_inherited();