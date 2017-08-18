/// @function libPlayerHandleInput()
/// @desc Handles basic input

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
		if (keyboard_check_direct(vk_shift)) {v_currentAnimation = e_animations.valRun; oHUD.v_playerProperty[e_inventoryProperties.valSp] -= 0.3;}
		else {v_currentAnimation = e_animations.valWalk;}
		
		var tmp_keyW = keyboard_check(ord("W"));
		var tmp_keyS = keyboard_check(ord("S"));
		var tmp_keyA = keyboard_check(ord("A"));
		var tmp_keyD = keyboard_check(ord("D"));
		var tmp_keyAny = (tmp_keyW || tmp_keyS || tmp_keyA || tmp_keyD);
		
		
		if (tmp_keyAny)
		{
			v_speedReal = v_speed;
			image_speed = 0.25 + (tmp_finalSpeed / 100);	
			if (v_currentAnimation == e_animations.valRun) {image_speed *= 5; v_speedReal *= 2;}
			
			var tmp_inst, tmp_collPas, tmp_xShift, tmp_yShift, tmp_passed;
			tmp_collPas = true;
			tmp_xShift = 0;
			tmp_yShift = 0;
			tmp_passed = true;
				
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

if (v_lastDir == e_dirs.valW) {if (image_index < 0  || image_index > v_animationFrames[v_currentAnimation] - 0.1)  {image_index = 0; libPlayerEventAnimationEnd();}}
else if (v_lastDir == e_dirs.valS) {if (image_index < v_animationFrames[v_currentAnimation] * 2 || image_index > v_animationFrames[v_currentAnimation] * 3 - 0.1) {image_index = v_animationFrames[v_currentAnimation] * 2; libPlayerEventAnimationEnd();}}    
else if (v_lastDir == e_dirs.valA) {if (image_index < v_animationFrames[v_currentAnimation]  || image_index > v_animationFrames[v_currentAnimation] * 2 -0.1) {image_index = v_animationFrames[v_currentAnimation]; libPlayerEventAnimationEnd();}}    
else if (v_lastDir == e_dirs.valD) {if (image_index <  v_animationFrames[v_currentAnimation] * 3 || image_index > v_animationFrames[v_currentAnimation] * 4 - 0.1) {image_index = v_animationFrames[v_currentAnimation] * 3; libPlayerEventAnimationEnd();}}        

