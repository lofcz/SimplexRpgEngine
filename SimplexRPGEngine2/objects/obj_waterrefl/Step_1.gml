/// @description Delayed Create
if (!delayed_create) exit;

//Surface
var w, h;

if (global.camera_used){
	w = camera_get_view_width(view_camera);
	h = camera_get_view_height(view_camera);
}
else{
	w = room_width;
	h = room_height;
}

global.refl_surf = surface_create(w, h);

surface_set_target(global.refl_surf);
draw_clear_alpha(0, 0);
surface_reset_target();

//Tilemap
water_tilemap = layer_tilemap_get_id(global.water_tile);

//Reset
delayed_create = false;