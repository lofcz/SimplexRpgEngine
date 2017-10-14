/// @description Insert description here
// You can write your code in this editor

var tmp_canMove = !mathArrayContains(v_canMove, 0);
var tmp_finalSpeed = v_speed;
var tmp_suppresEvent = false;

if (v_currentAnimation == e_animations.valRun) {tmp_finalSpeed *= 1.5}


/*
var lay_id = layer_get_id("tIce");
var map_id = layer_tilemap_get_id(lay_id);
var data = tilemap_get_at_pixel(map_id, x, y);*/

if (tmp_canMove)
{
	if (v_currentAnimation == e_animations.valWalk || v_currentAnimation == e_animations.valRun)
	{
		if (keyboard_check_direct(vk_shift)) {v_currentAnimation = e_animations.valRun; if (x != xprevious && y != yprevious) {oHUD.v_playerProperty[e_inventoryProperties.valSp] -= 0.3; oHUD.v_delaySP = oHUD.v_playerProperty[e_inventoryProperties.valSpRegenDelay]; oHUD.v_tickSP = -1;}}
		else {v_currentAnimation = e_animations.valWalk;}
		
		var tmp_keyW = key_check(ord("W"));
		var tmp_keyS = key_check(ord("S"));
		var tmp_keyA = key_check(ord("A"));
		var tmp_keyD = key_check(ord("D"));
		var tmp_keyAny = (tmp_keyW || tmp_keyS || tmp_keyA || tmp_keyD);
		
		var tmp_inst, tmp_collPas, tmp_xShift, tmp_yShift, tmp_passed;
		tmp_collPas = true;
		tmp_xShift = 0;
		tmp_yShift = 0;
		tmp_passed = true;
		
		v_localMotion = (v_speedReal / (v_speed * oHUD.v_l));
		if (tmp_keyAny)
		{
			v_speedReal = lerp(v_speedReal, v_speed * oHUD.v_l, 0.3);
			image_speed = 0.25 + (tmp_finalSpeed / 100) * oHUD.v_l;	
			if (v_currentAnimation == e_animations.valRun) {image_speed *= 5; v_speedReal *= 2;}
				
			if (tmp_keyW) {v_dir = e_dirs.valW; direction = 90; tmp_yShift = -v_speedReal;}
			else if (tmp_keyS) {v_dir = e_dirs.valS; direction = 270; tmp_yShift = v_speedReal;}
			else if (tmp_keyA) {v_dir = e_dirs.valA; direction = 180; tmp_xShift = -v_speedReal;}
			else if (tmp_keyD) {v_dir = e_dirs.valD; direction = 0; tmp_xShift = v_speedReal;}
			
			v_lastDir = v_dir;							
			v_list = instance_position_list(x + tmp_xShift, y + tmp_yShift, parGameObject);
			
			if (v_list != noone)
			{
				for (var i = 0; i < ds_list_size(v_list); i++)
				{
					tmp_inst = v_list[| i];
					if (tmp_inst == id) {tmp_inst = noone;}
				
					if (tmp_inst != noone)
					{
						if (tmp_inst.v_canCollide)
						{
							if (!libUtilityIsCollisionUndefined(tmp_inst.v_collisionLegs))
							{
								if (libUtilityCollisionInCollision(tmp_inst.v_collisionLegs, libUtilityBuildCollision(v_collisionLegs, tmp_xShift, tmp_yShift)))
								{
									tmp_passed = false;
								}
							}
							else
							{
								if (libUtilityCollisionInCollision(tmp_inst.v_collisionMain, libUtilityBuildCollision(v_collisionLegs, tmp_xShift, tmp_yShift)))
								{
									tmp_passed = false;
								}					
							}
						}
					}
				}
			}
			
			if (tmp_passed)
			{
				y += tmp_yShift;
				x += tmp_xShift;
				
				v_lastShiftX = tmp_xShift;
				v_lastShiftY = tmp_yShift;
			}

			if (v_list != noone)
			{
				ds_list_destroy(v_list);
			}
		}
		else
		{
			v_currentAnimation = e_animations.valWalk;
			image_speed = 0;
			speed = 0;
			image_index = 12;
			v_speedReal = lerp(v_speedReal, 0, 0.30);
			fg = instance_nearest(x, y, oEnemy);					
		}						
	}
	
	if (v_currentAnimation == e_animations.valSlash)
	{	
		image_speed = 0.25;
	}
}


if (v_currentAnimation == e_animations.valWalk || v_currentAnimation == e_animations.valRun)
{
		// If we hold weapon, attack
		var tmp_canAttack;
		tmp_canAttack = false;
		
		if (oHUD.v_playerProperty[e_inventoryProperties.valSp] >= 30) {tmp_canAttack = true;}
		
		if (mouse_check_button_pressed(mb_left) && !oHUD.v_mouseClickedUI && tmp_canAttack)
		{
			if (v_bci[v_currentAnimation, 4] != 0)
			{	
				var tmp_sX, tmp_sY;
				tmp_sX = x;
				tmp_sY = y;
				oHUD.v_playerProperty[e_inventoryProperties.valSp] -= 30;
				oHUD.v_delaySP = oHUD.v_playerProperty[e_inventoryProperties.valSpRegenDelay]; 
				oHUD.v_tickSP = -1;				
				
				v_currentAnimation = e_animations.valSlash;
				speed = 0;
				if (v_lastDir == e_dirs.valW) {image_index = 0.1; tmp_sY = y - 64; tmp_sX -= 24}
				if (v_lastDir == e_dirs.valS) {image_index = v_animationFrames[v_currentAnimation] * 2 + 0.1; tmp_sY = y + 48 tmp_sX -= 24}
				if (v_lastDir == e_dirs.valA) {image_index = v_animationFrames[v_currentAnimation] + 0.1; tmp_sX = x - 76;}
				if (v_lastDir == e_dirs.valD) {image_index = v_animationFrames[v_currentAnimation] * 3 + 0.1; tmp_sX += 18;}
				
				var tmp_inst = instance_create_depth(tmp_sX, tmp_sY, depth - 100, oAttackMask);
				tmp_inst.v_dir = v_dir;
			}
		}
}