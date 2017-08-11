/// @description Insert description here
// You can write your code in this editor

v_collisionLegs = [x - 16, y, x + 16, y + 24];

if (v_action == "")
{
	v_action = "computeTarget";
}

if (v_action == "computeTarget")
{
	//move_snap(32, 32);
	
	if (distance_to_object(oPlayer) < 32)
	{
		d = point_direction(x, y, oPlayer.x, oPlayer.y);

		if ((d > 0 && d < 45) || (d > 315 && d <= 360)) {image_index = 8;}
		else if (d > 90 + 45 && d <= 180 + 45) {image_index = 4;}
		else if (d >= 45 && d < 90 + 45) {image_index = 12;}
		else {image_index = 0;}		
		
		v_timer = 60;
		v_action = "freeze";
	}
	else
	{
		var tmp_grid;
		v_path = path_add();
		path_set_closed(v_path, false);
	
		v_path = libPathfindingAStar(x, y, oPlayer.x, oPlayer.y, 32, 0, false, parSolid, false);
		v_targetX = path_get_point_x(v_path, 2);
		v_targetY = path_get_point_y(v_path, 2);
		v_action = "moveToTarget";
		draw_path(v_path, x, y, true);
		direction = 0;
		d = point_direction(x, y, v_targetX, v_targetY);
			draw_text(x, y -32, d);
	


		if ((d > 0 && d < 45) || (d > 315 && d <= 360)) {v_action = "moveRight";}
		else if (d > 90 + 45 && d <= 180 + 45) {v_action = "moveLeft";}
		else if (d >= 45 && d < 90 + 45) {v_action = "moveUp";}
		else {v_action = "moveDown";}
	
		path_delete(v_path);
		v_counter = 32;
	}
}
v_spd = 1;

if (v_action == "moveRight")
{
	if (!place_meeting(x + v_spd, y, oPlayer))
	{
	x += v_spd;
	v_counter -= v_spd;
	if (v_counter <= 0) {v_action = "computeTarget";}
	v_dir = e_dirs.valD;
	image_speed = 0.3;
	}
	else
	{
		v_action = "computeTarget";
	}
}
if (v_action == "moveLeft")
{
	if (!place_meeting(x - v_spd, y, oPlayer))
	{
	x -= v_spd;
	v_counter -= v_spd;
	if (v_counter <= 0) {v_action = "computeTarget";}
	image_speed = 0.3;
	v_dir = e_dirs.valA;
	}
	else
	{
		v_action = "computeTarget";
	}
}

if (v_action == "moveUp")
{
	if (!place_meeting(x, y - v_spd, oPlayer))
	{
	y -= v_spd;
	v_counter -= v_spd;
	if (v_counter <= 0) {v_action = "computeTarget";}
	image_speed = 0.3;
	v_dir = e_dirs.valW;
	}
	else
	{
		v_action = "computeTarget";
	}	
}

if (v_action == "moveDown")
{
	if (!place_meeting(x, y + v_spd, oPlayer))
	{
	y += v_spd;
	v_counter -= v_spd;
	if (v_counter <= 0) {v_action = "computeTarget";}
	image_speed = 0.3;
	v_dir = e_dirs.valS;
	}
	else
	{
		v_action = "computeTarget";
	}	

}

if (v_action == "freeze")
{
	image_speed = 0;
	draw_text(x, y - 32, "OH IM DEAD FCK ME HERO PLZZ");
	
	d = point_direction(x, y, oPlayer.x, oPlayer.y);

	if ((d > 0 && d < 45) || (d > 315 && d <= 360)) {v_dir = e_dirs.valD; image_index = 8;}
	else if (d > 90 + 45 && d <= 180 + 45) {image_index = 4; v_dir = e_dirs.valA;}
	else if (d >= 45 && d < 90 + 45) {image_index = 12; v_dir = e_dirs.valW}
	else {image_index = 0; v_dir = e_dirs.valS;}		
	
	if (v_timer > 0)
	{
		v_timer--;
	}
	else
	{
		v_action = "computeTarget";
	}
}

if (v_dir == e_dirs.valD) {if (image_index < 8 || image_index > 12 - 0.1) {image_index = 8;}}
if (v_dir == e_dirs.valA) {if (image_index < 4 || image_index > 8 - 0.1) {image_index = 4;}}
if (v_dir == e_dirs.valW) {if (image_index < 12 || image_index > 16 - 0.1) {image_index = 12;}}
if (v_dir == e_dirs.valS) {if (image_index < 0 || image_index > 4 - 0.1) {image_index = 0;}}

draw_text(x, y - 48, "HP: " + string(v_properties[e_inventoryProperties.valHp]));

draw_self();
draw_circle(v_targetX, v_targetY, 4, false);
draw_circle(x, y, 4, false);
draw_text(x, y + 32, d);
	draw_line(x , y, v_targetX, v_targetY);

//libUtilityDrawRect(v_collisionLegs);
event_inherited();