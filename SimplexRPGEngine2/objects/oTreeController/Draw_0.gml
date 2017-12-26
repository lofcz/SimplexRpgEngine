/// @description Insert description here
// You can write your code in this editor


with(oTree)
{
	var _vx = camera_get_view_x(view_camera[0]);
	var _vy = camera_get_view_y(view_camera[0]);

	if (v_alive && u && point_in_rectangle(x, y, _vx - 64, _vy - 64, _vx + 64 + oCamera.v_viewSizeX, _vy + 64 + oCamera.v_viewSizeY))
	{
		draw_sprite_ext(sprite_index, image_index + 2, x, y + 12, 1, 1, sin(degtorad(time)) * 3, c_white, image_alpha);

		if (irandom_range(0, 120) == 4)
		{
			cpParticleLeafs(oTreeController.Sname, oTreeController.emitter1, x, y, choose(1, 1, 2));	
		}
	}
}