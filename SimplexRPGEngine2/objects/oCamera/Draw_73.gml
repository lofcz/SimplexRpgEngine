/// @desc Move view

var tmp_spd = (distance_to_object(v_target) / v_n);
if (tmp_spd < 0) {tmp_spd = 0;}
       
if (distance_to_point(v_target.x, v_target.y) > 2)
{
    move_towards_point(v_target.x + lengthdir_x(32, direction), v_target.y + lengthdir_y(32, direction), tmp_spd);
}
else 
{
	speed = 0;
}

v_nullPosX = x - (v_viewSizeX / 2);
v_nullPosY = y - (v_viewSizeY / 2);

camera_set_view_pos(view_camera[0], v_nullPosX, v_nullPosY);