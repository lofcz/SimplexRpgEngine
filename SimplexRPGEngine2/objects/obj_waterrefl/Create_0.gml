/// @description 
//------YOU MAY TWEAK THESE VARIABLES----------------------
//Water waves
//You will need to tweak these vars by trial-and-error to find the best settings
//that suit your liking.
global.wave_speed = 0.5; //Speed of the wave animation
global.wave_size = 1; //Size of the waves, horizontally
global.wave_frequency = 1; //Frequency; How much waves are created in a time

global.vertical_wave_size = 1 //Size of the vertical waves
global.vertical_wave_frequency = 2; //Frequency of the vertical waves

//Blur
global.water_blur = true; //Whether to blur the reflections
global.water_blur_power = 3; //Blur power, if blur enabled

//Water other
global.water_blend = c_white; //Blend color for the reflections
							 //Change to c_white if you want no blending
//--------END----------------------------------------------
#region internal
global.refl_insts = ds_list_create();
global.refl_offsets = ds_list_create();

global.water_insts = ds_list_create();
global.water_tile = -1;

global.camera_used = false;
global.water_detection = false;

delayed_create = true;
v_reflOffset = 0;

resolution = shader_get_uniform(shdPerlinNoise, "iResolution");
time       = shader_get_uniform(shdPerlinNoise, "time"); 
strenght   = shader_get_uniform(shdPerlinNoise, "strenght"); 

strenghtVal = 5;
timeOffset = 0;
timeVal = 0;

//shader
uni_uvs = shader_get_uniform(sh_refl, "uvs");
uni_time = shader_get_uniform(sh_refl, "time");
uni_texel = shader_get_uniform(sh_refl, "texel");

uni_slow = shader_get_uniform(sh_refl, "slow");
uni_amount = shader_get_uniform(sh_refl, "amount");
uni_waves = shader_get_uniform(sh_refl, "waves");
uni_y_amount = shader_get_uniform(sh_refl, "y_amount");
uni_y_waves = shader_get_uniform(sh_refl, "y_waves");

uni_offset = shader_get_uniform(sh_refl, "offset");

uni_detect = shader_get_uniform(sh_refl, "detect");
uni_blur = shader_get_uniform(sh_refl, "blur");
uni_blur_power = shader_get_uniform(sh_refl, "blur_radius");
//uni_dest_surf = shader_get_uniform(sh_refl, "dest_surf");
//uni_dest_pos = shader_get_uniform(sh_refl, "dest_pos");
//uni_spr_size = shader_get_uniform(sh_refl, "spr_size");
//uni_surf_size = shader_get_uniform(sh_refl, "surf_size");
#endregion

alarm[0] = 10;
c = false;


		w = camera_get_view_width(view_camera);
		h = camera_get_view_height(view_camera);


	global.refl_surf = surface_create(w, h);