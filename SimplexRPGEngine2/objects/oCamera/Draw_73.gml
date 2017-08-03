/// @desc Move view

/*
var tmp_spd = (distance_to_object(v_target) / v_n);
if (tmp_spd < 0) {tmp_spd = 0;}
       
if (distance_to_point(v_target.x, v_target.y) > 4)
{
    move_towards_point(v_target.x, v_target.y, tmp_spd);
}
else 
{
	speed = 0;
}
*/

if (distance_to_point(v_target.x, v_target.y) > 2)
{
	x = lerp(x, v_target.x, 0.1);
	y = lerp(y, v_target.y, 0.1);
}

v_nullPosX = x - (v_viewSizeX / 2);
v_nullPosY = y - (v_viewSizeY / 2);

camera_set_view_pos(view_camera[0], v_nullPosX, v_nullPosY);