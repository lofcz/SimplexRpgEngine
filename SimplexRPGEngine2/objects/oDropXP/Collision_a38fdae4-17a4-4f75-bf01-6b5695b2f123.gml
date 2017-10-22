/// @description Insert description here
// You can write your code in this editor

/*
if (v_alive && z <= 0)
{
	depth = oPlayer.depth - 50;
	v_alive = false;

	cpSplashMessage("+ " + string(5) + " Xp", c_lime, -1, 0, 0.4, x, y - 32);
}
else
{
	if (v_alive)
	{
		
	}
}*/

if (z < 50)
{
	z += 10;
	speed += 2;
	direction = point_direction(oPlayer.x, oPlayer.y, x, y);
}