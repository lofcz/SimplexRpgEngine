/// @description Insert description here
// You can write your code in this editor

event_inherited();
draw_self();

if (!v_alive)
{
	cpGoreShards(sprite_index, image_index, 32, 4);
	repeat(irandom_range(1, 3))
	{
		instance_create_layer(x, y, "Items", oDropXP);	
	}
	instance_destroy();
}