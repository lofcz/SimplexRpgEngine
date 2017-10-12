/// @description Insert description here
// You can write your code in this editor


with(oTree)
{
	draw_sprite_ext(sprite_index, image_index + 2, x, y + 12, 1, 1, sin(degtorad(time)) * 3, c_white, image_alpha);

	if (irandom_range(0, 120) == 4)
	{
		cpParticleLeafs(oTreeController.Sname, x, y, choose(1, 1, 2));	
	}
}