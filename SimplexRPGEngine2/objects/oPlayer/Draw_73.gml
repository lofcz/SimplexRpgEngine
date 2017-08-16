/// @description Insert description here
// You can write your code in this editor

if (v_currentAnimation == e_animations.valWalk || v_currentAnimation == e_animations.valRun)
{
		// If we hold weapon, attack
		if (mouse_check_button_pressed(mb_left) && !oHUD.v_mouseClickedUI)
		{
			if (v_bci[v_currentAnimation, 4] != 0)
			{	
				var tmp_sX, tmp_sY;
				tmp_sX = x;
				tmp_sY = y;
				
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