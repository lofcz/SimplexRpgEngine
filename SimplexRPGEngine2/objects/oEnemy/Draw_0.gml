/// @description Insert description here
// You can write your code in this editor

if (v_alive)
{
		if (v_targetLastPosX != -1)
		{
			clr(-1, 0.4);
			draw_sprite(sBodyCanvasRun1, 0, v_targetLastPosX, v_targetLastPosY);
			clr();
		}

v_collisionLegs = [x - 16, y, x + 16, y + 24];
v_attackArea = [x - v_attackNote, y - v_attackNote, x + v_attackNote, y + v_attackNote];

if (v_mindState == "idle") {color = c_lime; 		v_attackNote = lerp(v_attackNote, 64, 0.1);} else if (v_mindState == "attack") {color = c_red; v_attackNote = lerp(v_attackNote, 256, 0.1);}
else if (v_mindState == "search") {color = c_orange; v_attackNote = lerp(v_attackNote, 256, 0.1);}
	//libUtilityDrawRect(v_attackArea, false, color);

if (v_action == "")
{
	v_action = "computeTarget";
}

if (v_action == "computeTarget")
{
	//move_snap(32, 32);
	if (libUtilityCheckCollisionRect(v_attackArea, oPlayer.v_collisionMain))
	{
		v_mindState = "attack";
	}
	else {if (v_mindState == "attack") {v_targetLastPosX = oPlayer.x; v_targetLastPosY = oPlayer.y; v_mindState = "search";} else {if (v_targetLastPosX = -1) {v_mindState = "idle";}} }

	
	if (distance_to_object(oPlayer) < 4)//distance_to_object(oPlayer) < 4
	{
		d = point_direction(x, y, oPlayer.x, oPlayer.y);

		if ((d > 0 && d < 45) || (d > 315 && d <= 360)) {v_dir = e_dirs.valD;}
		else if (d > 90 + 45 && d <= 180 + 45) {v_dir = e_dirs.valA;}
		else if (d >= 45 && d < 90 + 45) {v_dir = e_dirs.valW;}
		else {v_dir = e_dirs.valS;}		
		
		v_timer = 60;
		v_action = "attack";
		sprite_index = v_attackAnim;
		image_speed = 1;
		v_currentAnimation = 1;
		

		cpGoreBlood(oPlayer.x, oPlayer.y);
		oHUD.v_playerProperty[e_inventoryProperties.valHp] -= 15;
		
if (v_dir == e_dirs.valD) {if (image_index < v_animationFrames[v_currentAnimation] || image_index > v_animationFrames[v_currentAnimation] * 2 - 0.1) {image_index = v_animationFrames[v_currentAnimation];}}
if (v_dir == e_dirs.valA) {if (image_index < v_animationFrames[v_currentAnimation] * 3 || image_index > v_animationFrames[v_currentAnimation] * 4 - 0.1) {image_index = v_animationFrames[v_currentAnimation] * 3;}}
if (v_dir == e_dirs.valW) {if (image_index < v_animationFrames[v_currentAnimation] * 2 || image_index > v_animationFrames[v_currentAnimation] * 3 - 0.1) {image_index = v_animationFrames[v_currentAnimation] * 2;}}
if (v_dir == e_dirs.valS) {if (image_index < 0 || image_index > v_animationFrames[v_currentAnimation] - 0.1) {image_index = 0;}}

	}
	else
	{
		var tmp_targetX, tmp_targetY;
		
		if (v_mindState == "idle")
		{
			if (choose(1, 2) == 1) {tmp_targetX = choose(x + 32, x - 32); tmp_targetY = y;}
			else {tmp_targetY = choose(y - 64, y + 64); tmp_targetX = x;}

		}
		else if (v_mindState == "attack")
		{
			tmp_targetX = oPlayer.x;
			tmp_targetY = oPlayer.y;
		}
		else if (v_mindState == "search")
		{
			tmp_targetX = v_targetLastPosX;
			tmp_targetY = v_targetLastPosY;
		}		
		
		if (distance_to_point(v_targetLastPosX, v_targetLastPosY) < 32 && v_mindState == "search")
		{
			v_mindState = "idle";
			v_targetLastPosX = -1;
			v_targetLastPosY = -1;
		}
		

		
		if (v_action != "rest")
		{
			v_path = path_add();
			path_set_closed(v_path, false);

//show_message("");
		
			if (v_mindState != "idle") {v_path = libPathfindingAStar(x, y, tmp_targetX div 32 * 32, tmp_targetY div 32 * 32, 32, 0, false, parSolid, false, cellArray);}
			else
			{
				path_add_point(v_path, tmp_targetX, tmp_targetY, 100);
				path_add_point(v_path, tmp_targetX, tmp_targetY, 100);
				path_add_point(v_path, tmp_targetX, tmp_targetY, 100);
			}
			v_targetX = path_get_point_x(v_path, 2);
			v_targetY = path_get_point_y(v_path, 2);
			
			draw_circle(v_targetX, v_targetY, 16, false);
			v_action = "moveToTarget";
			draw_path(v_path, x, y, true);
			direction = 0;
			d = point_direction(x, y, v_targetX, v_targetY);

			if ((d >= 0 && d < 45) || (d > 315 && d <= 360)) {v_action = "moveRight";}
			else if (d > 90 + 45 && d <= 180 + 45) {v_action = "moveLeft";}
			else if (d >= 45 && d < 90 + 45) {v_action = "moveUp";}
			else {v_action = "moveDown";}
	//draw_path(v_path, x, y, 1);
			path_delete(v_path);
			v_counter = 32;
		}
	}
}
v_spd = 1;

if (v_action == "moveRight")
{
	if (!place_meeting(x + v_spd, y, oPlayer))
	{
	x += v_spd;
	v_counter -= v_spd;
	if (v_counter <= 0) {		if (v_mindState != "idle")
		{
			v_action = "computeTarget";
		}
		else {v_action = choose("rest", "computeTarget", "computeTarget");}}
	v_dir = e_dirs.valD;
	image_speed = 0.6;
	}
	else
	{
		if (v_mindState != "idle")
		{
			v_action = "computeTarget";
		}
		else {v_action = "rest";}
	}
}
if (v_action == "moveLeft")
{
	if (!place_meeting(x - v_spd, y, oPlayer))
	{
	x -= v_spd;
	v_counter -= v_spd;
	if (v_counter <= 0) {		if (v_mindState != "idle")
		{
			v_action = "computeTarget";
		}
		else {v_action = choose("rest", "computeTarget", "computeTarget");}}
	image_speed = 0.6;
	v_dir = e_dirs.valA;
	}
	else
	{
		if (v_mindState != "idle")
		{
			v_action = "computeTarget";
		}
		else {v_action = "rest";}
	}
}

if (v_action == "moveUp")
{
	if (!place_meeting(x, y - v_spd, oPlayer))
	{
	y -= v_spd;
	v_counter -= v_spd;
	if (v_counter <= 0) {		if (v_mindState != "idle")
		{
			v_action = "computeTarget";
		}
		else {v_action = choose("rest", "computeTarget", "computeTarget");}}
	image_speed = 0.6;
	v_dir = e_dirs.valW;
	}
	else
	{
		if (v_mindState != "idle")
		{
			v_action = "computeTarget";
		}
		else {v_action = "rest";}
	}	
}

if (v_action == "moveDown")
{
	if (!place_meeting(x, y + v_spd, oPlayer))
	{
	y += v_spd;
	v_counter -= v_spd;
	if (v_counter <= 0) {		if (v_mindState != "idle")
		{
			v_action = "computeTarget";
		}
		else {v_action = choose("rest", "computeTarget", "computeTarget");}}
	image_speed = 0.6;
	v_dir = e_dirs.valS;
	}
	else
	{
		if (v_mindState != "idle")
		{
			v_action = "computeTarget";
		}
		else {v_action = "rest";}
	}	

}

if (v_action == "freeze")
{
	image_speed = 0;
	draw_text(x, y - 32, "OH IM DEAD FCK ME HERO PLZZ");
	
	d = point_direction(x, y, oPlayer.x, oPlayer.y);

	if ((d > 0 && d < 45) || (d > 315 && d <= 360)) {v_dir = e_dirs.valD;}
	else if (d > 90 + 45 && d <= 180 + 45) {v_dir = e_dirs.valA;}
	else if (d >= 45 && d < 90 + 45) {v_dir = e_dirs.valW}
	else {v_dir = e_dirs.valS;}		
	
	if (v_timer > 0)
	{
		v_timer--;
	}
	else
	{
		v_action = "computeTarget";
	}
}

if (v_action == "rest")
{
	image_speed = 0;
	draw_text(x, y - 32, "IM SLEEPING DONT GIVE A FCK ABOUT ME");
	
	if (v_dir == e_dirs.valD) {image_index = v_animationFrames[v_currentAnimation];}
	if (v_dir == e_dirs.valA) {image_index = v_animationFrames[v_currentAnimation] * 3;}
	if (v_dir == e_dirs.valW) {image_index = v_animationFrames[v_currentAnimation] * 2;}
	if (v_dir == e_dirs.valS) {image_index = 0;}

	

	if (v_timer > 0)
	{
		v_timer--;
	}
	if (v_timer <= 0 || libUtilityCheckCollisionRect(v_attackArea, oPlayer.v_collisionMain))
	{
		v_action = "computeTarget";
		v_timer = 60;
	}
}

if (v_action == "attack")
{
if (v_dir == e_dirs.valD) {if (image_index < v_animationFrames[v_currentAnimation] || image_index > v_animationFrames[v_currentAnimation] * 2 - 0.1) {sprite_index = v_moveAnim; v_currentAnimation = 0; v_action = "computeTarget";}}
if (v_dir == e_dirs.valA) {if (image_index < v_animationFrames[v_currentAnimation] * 3 || image_index > v_animationFrames[v_currentAnimation] * 4 - 0.1) {sprite_index = v_moveAnim; v_currentAnimation = 0; v_action = "computeTarget";}}
if (v_dir == e_dirs.valW) {if (image_index < v_animationFrames[v_currentAnimation] * 2 || image_index > v_animationFrames[v_currentAnimation] * 3 - 0.1) {sprite_index = v_moveAnim; v_currentAnimation = 0; v_action = "computeTarget";}}
if (v_dir == e_dirs.valS) {if (image_index < 0 || image_index > v_animationFrames[v_currentAnimation] - 0.1) {sprite_index = v_moveAnim; v_currentAnimation = 0; v_action = "computeTarget";}}
	
}


if (v_dir == e_dirs.valD) {if (image_index < v_animationFrames[v_currentAnimation] || image_index > v_animationFrames[v_currentAnimation] * 2 - 0.1) {image_index = v_animationFrames[v_currentAnimation];}}
if (v_dir == e_dirs.valA) {if (image_index < v_animationFrames[v_currentAnimation] * 3 || image_index > v_animationFrames[v_currentAnimation] * 4 - 0.1) {image_index = v_animationFrames[v_currentAnimation] * 3;}}
if (v_dir == e_dirs.valW) {if (image_index < v_animationFrames[v_currentAnimation] * 2 || image_index > v_animationFrames[v_currentAnimation] * 3 - 0.1) {image_index = v_animationFrames[v_currentAnimation] * 2;}}
if (v_dir == e_dirs.valS) {if (image_index < 0 || image_index > v_animationFrames[v_currentAnimation] - 0.1) {image_index = 0;}}

draw_text(x, y - 48, "HP: " + string(v_properties[e_inventoryProperties.valHp]));
}

//draw_circle(v_targetX, v_targetY, 4, false);
//draw_circle(x, y, 4, false);
//draw_text(x, y + 32, d);
	//draw_line(x , y, v_targetX, v_targetY);

//libUtilityDrawRect(v_collisionLegs);
event_inherited();

if (v_spriteRest != -1)
{
	x = v_restX;
	y = v_restY;
	v_canCollide = false;
	
	draw_sprite_ext(v_spriteRest, 0, v_restX, v_restY, 1, 1, v_restRot, c_white, v_restAlpha);
	v_restX = lerp(v_restX, v_restStartX - 32, 0.1);
	v_restX2 = lerp(v_restX2, 32, 0.1);
	v_restRot = lin(v_restRot, 80, 2);
	v_restAlpha = lin(v_restAlpha, 0, 0.01);
	
	//if (irandom(10) == 2 && v_restRot < 70) {cpGoreFull();}
	if (v_restAlpha <= 0) {instance_destroy(); sprite_delete(v_spriteRest); sprite_delete(v_sprite); v_spriteRest = -1;}
	else
	{
	draw_sprite_ext(sprite_index, 0, v_restStartX + v_restX2, v_restY, 1, 1, -v_restRot, c_white, v_restAlpha);
}
}
else
{
	draw_self();
	
	if (v_action != "attack")
	{
		draw_sprite(v_weaponSprite, image_index, x, y);
	}
}

