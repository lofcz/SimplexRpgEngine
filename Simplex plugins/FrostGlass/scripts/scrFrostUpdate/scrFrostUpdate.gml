/// @function scrFrostUpdate()
/// @desc Updates the frost system

surface_set_target(sss);
	shader_set(shdFrost);
	shader_set_uniform_f(shader_get_uniform(shdFrost, "Quality"), v_frostQuality);
	shader_set_uniform_f(shader_get_uniform(shdFrost, "Directions"), v_frostBlur);
	shader_set_uniform_f(shader_get_uniform(shdFrost, "size"), v_frostWidth, v_frostHeight, v_frostQuality);
	
	draw_sprite(v_frostSprite, 0, 0, 0);
	shader_reset();

	gpu_set_blendmode(bm_subtract);
	draw_surface(ss, 0, 0);
	gpu_set_blendmode(bm_normal);
surface_reset_target();