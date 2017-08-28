/// @description Render pseudoinstances via lists

var tmp_flagEnd, tmp_counter;
tmp_flagEnd = true;
tmp_counter = 0;

// Process each virtual instance
for (var i = 0; i < ds_list_size(g_Bloodlist); i += v_format)
{	
	// We need to trace entire movement to spawn blood properly	
	for (var k = 0; k < g_Bloodlist[| i + 3]; k++)
	{
		g_Bloodlist[| i] += lengthdir_x(1, g_Bloodlist[| i + 2]); // edit x
		g_Bloodlist[| i + 1] += lengthdir_y(1, g_Bloodlist[| i + 2]); // edit y

	    if(tmp_counter == 8 || k == g_Bloodlist[| i + 3] - 1) {tmp_counter = 0; ds_list_add(g_subList, g_Bloodlist[| i], g_Bloodlist[| i + 1], random(360), random(10) + 5, 0.3, 1 - (k / (g_Bloodlist[| i + 3] - 1)) * 0.5, random(1), 120 - (k / (g_Bloodlist[| i + 3] - 1)) * 50 , g_Bloodlist[| i + 8], random(sprite_get_number(sGore2) - 1));}
		tmp_counter++;
	}

	g_Bloodlist[| i + 3] = max(0, g_Bloodlist[| i + 3] - g_Bloodlist[| i + 4]); // edit speed
	
	if (g_Bloodlist[| i + 7] > 0) {g_Bloodlist[| i + 7]--;} else {g_Bloodlist[| i + 5] = lin(g_Bloodlist[| i + 5], 0, 0.1);} // dec life and if it's <= 0 fade
	
    shader_set(shdColor);
    shader_set_uniform_f(channel_mask, v_redChannel, v_greenChannel, v_blueChannel, 1);
	draw_sprite_ext(sGore3, g_Bloodlist[| i + 9], g_Bloodlist[| i], g_Bloodlist[| i + 1], g_Bloodlist[| i + 6], g_Bloodlist[| i + 6], 0, c_white, g_Bloodlist[| i + 5]);
	shader_reset();
	
	// Update each subinstance
	if (g_Bloodlist[| i + 5] > 0)
	{
		for (var k = 0; k < ds_list_size(g_subList) - (v_format + 1); k += (v_format))
		{
			if (g_subList[| k + 8] == g_Bloodlist[| i + 8])
			{
			    shader_set(shdColor);
				shader_set_uniform_f(channel_mask, v_redChannel, v_greenChannel, v_blueChannel, 1);
				draw_sprite_ext(sGore2, g_subList[| k + 9], g_subList[| k],  g_subList[| k + 1], 1, 1, 0, c_white, g_subList[| k + 5]);
				shader_reset();
				
				if (g_subList[| k + 7] > 0) {g_subList[| k + 7]--;} else {g_subList[| k + 5] = lin(g_subList[| k + 5], 0, 0.1);} // dec life and if it's <= 0 fade
				
			}
		}
	}

	// if not visible anymore delete pseudoinstance
	if (g_Bloodlist[| i + 5] <= 0)
	{
		for (var j = 0; j < v_format; j++)
		{
			ds_list_delete(g_Bloodlist, i + j);
		}	
		
		for (var k = 0; k < ds_list_size(g_subList) - (v_format + 1); k += (v_format))
		{
			if (g_subList[| k + 8] == g_Bloodlist[| i + 8])
			{
				for (var j = 0; j < v_format; j++)
				{
					ds_list_delete(g_subList, i + j);
				}	
			}
		}			
	}
	else
	{
		tmp_flagEnd = false;
	}
		
}

if (tmp_flagEnd)
{
	ds_list_destroy(g_Bloodlist);
	ds_list_destroy(g_subList);
	instance_destroy();
}

