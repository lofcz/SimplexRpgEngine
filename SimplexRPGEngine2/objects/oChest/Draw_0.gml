/// @desc [Simplex description line]

if (libUtilityCheckCollisionRect(v_collisionInteraction, oPlayer.v_collisionLegs))
{
	if (keyboard_check_pressed(ord("E")) && oPlayer.v_lastDir == e_dirs.valW)
	{
		if (!v_openMode)
		{
			v_openMode = 1;
			v_playAnimation = 1;
			image_speed = 0.4;
		}
		else
		{
			v_openMode = 0;
		}
	}
	
	if (oPlayer.v_lastDir == e_dirs.valW) {v_actionAlpha = lin(v_actionAlpha, 1, 0.1);} 
	else {v_actionAlpha = lin(v_actionAlpha, 0, 0.1);}
}
else
{
	v_openMode = 0;
	v_actionAlpha = lin(v_actionAlpha, 0, 0.1);
}

if (!v_openMode)
{
	image_speed = -0.4;
	v_fadeAlpha = lin(v_fadeAlpha, 0, 0.1);
}
else
{
	v_fadeAlpha = lin(v_fadeAlpha, 1, 0.1);
}

if (v_actionAlpha > 0.05)
{
	if (oPlayer.v_lastDir == e_dirs.valW)
	{
		var tmp_string;
		if (v_openMode && libUtilityCheckCollisionRect(v_collisionMain, oPlayer.v_collisionLegs)) {tmp_string = __("close");}
		else {tmp_string = __("open");}
		v_lastString = tmp_string;
	}
}
else
{
	v_openMode = 0;
}

clr();
draw_self();

if (v_lerpMode == 0) {v_actualLerp = lin(v_actualLerp, 0.01, 0.00005); if (v_actualLerp >= 0.003) {v_lerpMode = 1;}}
if (v_lerpMode == 1) {v_actualLerp = lin(v_actualLerp, 0, 0.00005); if (v_actualLerp <= 0.0003) {v_lerpMode = 0;}}
event_inherited();
