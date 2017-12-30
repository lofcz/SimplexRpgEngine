/// @desc [Simplex description line]
/*
if (v_timer > 0) {v_timer--;} else {if (ds_queue_size(g_queue) > 0) {a = ds_queue_dequeue(g_queue); ds_list_add(g_list, a, 0 - ((ds_list_size(g_list) - 3) / 3) * 10, 100); v_timer = 50;}}

surface_set_target(v_surf);
draw_clear_alpha(c_white, 0);

//draw_rectangle(0, 0, 600, 400,  false);
prime = -1;
for (var i = 0; i < ds_list_size(g_list); i += 3)
{
	clr();
	fnt(fntPixelSmall);
	draw_text_colored(10, 200 - g_list[| i + 1], g_list[| i], -1, fntPixel, c_white);

	if (g_list[| i + 2] > 0) {g_list[| i + 2]--;}
	else
	{
		g_list[| i + 1]++;
	}
	
	if (200 + i * 20 - g_list[| i + 1] < 70) {prime = i;}
}

if (prime != -1)
{
ds_list_delete(g_list, prime); ds_list_delete(g_list, prime); ds_list_delete(g_list, prime);
}

gpu_set_blendmode(bm_subtract);
xx = 0;
for (var i = 0; i < 50; i++)
{
	clr(-1, 1 - (i / 50));
	draw_rectangle(0, 120 + xx, 600, 120 + xx, false);
	clr();
	xx += 1;
}

gpu_set_blendmode(bm_normal);

surface_reset_target();
x = oCamera.v_nullPosX;
y = oCamera.v_nullPosY + 450;

draw_surface_part(v_surf, 0, 100, 400, 50, x, y); 