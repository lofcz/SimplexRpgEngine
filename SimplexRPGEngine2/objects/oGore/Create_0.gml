/// @description Set blood up

v_format = 10;
g_Bloodlist = ds_list_create();
g_subList = ds_list_create();
channel_mask = shader_get_uniform(shdColor, "f_ChannelMask");

for (var i = 0; i < v_fragments; i++)
{
	// <x, y, direction, speed, friction, alpha, scale, live, listIndex, imageIndex>
	ds_list_add(g_Bloodlist, x, y, random_range(v_dirMin, v_dirMax), random(2) + 6, 0.3, 1, random(1), 150, i, random(image_number - 1));	
}