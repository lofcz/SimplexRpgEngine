/// @function libPlayerIni()
/// @desc Player variables

enum e_dirs
{
	valW, valS, valA, valD
}

#macro mcAnimations 7

enum e_animations
{
	valWalk, valSlash, valFire, valDie, valBash, valThrust, valRun
}

enum e_animationSlots
{
	valBody, valHair, valArmor, valShoulders, valHead, valLegs, valBelt, valShoes, valHands, valRing, valNecklace, valWeapon1, valWeapon2
}

image_speed = 0;

v_dir = e_dirs.valS;
v_lastDir = v_dir;
v_speed = 5;
v_canMove = [true, true, true, true, true, true, true];
v_bci[6, 17] = 0;
v_bci[0, 17] = 0;
v_bciDef[6, 17] = 0;
v_bciDef[0, 17] = 0;
v_bciSpeed = [0.4, 0.4, 0.4, 0.2, 0.2, 0.2, 0.4];
v_currentAnimation = e_animations.valWalk;
v_speedReal = 0;