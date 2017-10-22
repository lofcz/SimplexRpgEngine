/// @description Insert description here
// You can write your code in this editor

event_inherited();

time++;

if (v_sprite != -1)
{
	
	if (v_fallDirection == sSwingRight) {xx = lerp(xx, 32, 0.1); 	yy = lerp(yy, 8, 0.1); if (r < 45) {r = lerp(r, 45, 0.1);}}
	if (v_fallDirection == sSwingLeft) {xx = lerp(xx, -32, 0.1); 	yy = lerp(yy, 8, 0.1); if (r > -45) {r = lerp(r, -45, 0.1);}}
	if (v_fallDirection == sSwingUp) {yy = lerp(yy, -32, 0.1); xx = lerp(xx, 8, 0.1); scale = lerp(scale, 0.95, 0.1);}
	if (v_fallDirection == sSwingDown) {yy = lerp(yy, 32, 0.1); xx = lerp(xx, -8, 0.1); scale = lerp(scale, 1.05, 0.1);}

	if (v_fallDirection != sSwingDown) {draw_sprite_ext(v_spriteRest, 0, x + xx, y + 8 + yy, scale, scale, -r, c_white, a);}
	
	if (abs(xx) > 31 || abs(yy) > 31) {a = lerp(a, 0, 0.1); if (a >= 0.9 && u) {u = false; v_alive = true; v_properties[e_inventoryProperties.valHp] = 5;}}
	if (!v_alive && !u) {image_alpha = lerp(image_alpha, 0, 0.1); if (image_alpha < 0.05) {instance_destroy();}}
}

if (sprite_exists(kk)) {draw_sprite_ext(kk, image_index + 1, x, y, 1, 1, image_angle, c_white, image_alpha);}

if (v_sprite != -1)
{
	if (sprite_exists(v_spriteRest))
	{
		if (v_fallDirection == sSwingDown) {draw_sprite_ext(v_spriteRest, 0, x + xx, y + 8 + yy, scale, scale, -r, c_white, a);}
	}
}