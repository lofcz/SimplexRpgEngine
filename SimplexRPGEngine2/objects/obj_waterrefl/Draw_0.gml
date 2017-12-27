/// @description 

if (c)
{
surface_set_target(global.refl_surf);

//Draw water
var cam_x = camera_get_view_x(view_camera);
var cam_y = camera_get_view_y(view_camera);

//Objects
for(var i=0; i<ds_list_size(global.water_insts); i++){
	with(global.water_insts[|i]){
		var xx = x;
		var yy = y;
		
		if (global.camera_used){
			xx -= cam_x;
			yy -= cam_y;
		}
		
		draw_sprite_ext(sprite_index, image_index, xx, yy, image_xscale, image_yscale,
			image_angle, image_blend, image_alpha);
	}
}

//Tile
if (global.water_detection) shader_set(sh_land_detect);

draw_tilemap(water_tilemap, 0 - (cam_x*global.camera_used), 0 - (cam_y*global.camera_used));

if (global.water_detection) shader_reset();

//Refl
gpu_set_blendmode_ext(bm_dest_alpha, bm_inv_src_alpha);

//Draw priorty
var prior = ds_priority_create();

for(var i=0; i<ds_list_size(global.refl_insts); i++)
{
	var inst = global.refl_insts[|i];
	
	if (instance_exists(inst)) {ds_priority_add(prior, inst, inst.depth);}
	else {ds_list_delete(global.refl_insts, i);}
}

//for(var i=ds_priority_size(prior)-1; i>=0; i--){
while(ds_priority_size(prior)>0){
	var inst = ds_priority_delete_max(prior);

	with(inst){
		
		//show_message(inst.object_index);
		
		
		//position
		var xx = x;
		var yy = y;
		
		if (global.camera_used){
			xx -= cam_x;
			yy -= cam_y;
		}
		
		var sh = sprite_height - sprite_yoffset;
		
		yy += (sh-v_reflOffset)*2;
		
		//draw
		shader_set(sh_refl);
		
		if (v_reflSprite == -1)
		{
			var uvs = sprite_get_uvs(sprite_index, image_index + v_reflIndex); 
			var tex = sprite_get_texture(sprite_index, image_index + v_reflIndex);
		}
		else
		{
			var uvs = sprite_get_uvs(v_reflSprite, v_reflImageIndex + v_reflIndex);
			var tex = sprite_get_texture(v_reflSprite, v_reflImageIndex + v_reflIndex);			
		}
		
		shader_set_uniform_f(other.uni_uvs, uvs[0], uvs[1], uvs[2]-uvs[0], uvs[3]-uvs[1]);
		shader_set_uniform_f(other.uni_time, current_time);
		shader_set_uniform_f(other.uni_texel, texture_get_texel_width(tex), texture_get_texel_height(tex));
		
		shader_set_uniform_f(other.uni_slow, 100/global.wave_speed);
		shader_set_uniform_f(other.uni_amount, 4 * global.wave_size);
		shader_set_uniform_f(other.uni_waves, 20 * global.wave_frequency);
		shader_set_uniform_f(other.uni_y_amount, 2 * global.vertical_wave_size);
		shader_set_uniform_f(other.uni_y_waves, 20 * global.vertical_wave_frequency);
		
		shader_set_uniform_f(other.uni_offset, v_reflOffset/10);
		
		shader_set_uniform_f(other.uni_detect, global.water_detection);
		shader_set_uniform_f(other.uni_blur, global.water_blur);
		shader_set_uniform_f(other.uni_blur_power, global.water_blur_power);
		
		//dest
		//var texS = surface_get_texture(global.refl_surf);
		//var surfW = surface_get_width(global.refl_surf);
		//var surfH = surface_get_height(global.refl_surf);
		
		//texture_set_stage(other.uni_dest_surf, texS);
		//shader_set_uniform_f(other.uni_dest_pos, xx - sprite_xoffset, yy - sh);
		//shader_set_uniform_f(other.uni_spr_size, sprite_width, sprite_height);
		//shader_set_uniform_f(other.uni_surf_size, surfW, surfH);
		
		draw_sprite_ext(sprite_index, image_index - 1, xx, yy, image_xscale, -image_yscale,
			image_angle, global.water_blend, image_alpha);
			
		shader_reset();
	}
}
//}

ds_priority_destroy(prior);

gpu_set_blendmode(bm_normal);

timeVal += 0.02;


surface_reset_target();

//Draw surface
draw_surface(global.refl_surf, cam_x*global.camera_used, cam_y*global.camera_used);
}