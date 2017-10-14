/// @description Insert description here
// You can write your code in this editor

event_inherited();
draw_self();

if (!v_alive)
{
	cpGoreShards(sprite_index, image_index, 32, 4);
	instance_destroy();
}