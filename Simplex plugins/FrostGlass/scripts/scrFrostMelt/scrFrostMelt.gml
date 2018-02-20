/// @function scrFrostMelt(sprite, index, x, y)
/// @desc Used to start melting

var s, i, xx, yy;
s = argument0;
i = argument1;
xx = argument2;
yy = argument3;

if (!surface_exists(ss)) {ss = surface_create(w, h);}
if (!surface_exists(sss)) {sss = surface_create(w, h);}

surface_set_target(ss);
	if (mouse_check_button(mb_left))
	{
		draw_set_alpha(1);
		gpu_set_blendmode(bm_add);
		shader_set(shdFrostHelper);
		draw_sprite(s, i, xx, yy);
		shader_reset();
		gpu_set_blendmode(bm_normal);
		draw_set_alpha(1);
	}
surface_reset_target();