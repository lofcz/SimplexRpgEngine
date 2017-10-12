/// @desc Set the player up

entityIni();

v_animationFrames[e_animations.valWalk] = 6;
v_animationFrames[e_animations.valSlash] = 6;
v_animationFrames[e_animations.valFire] = 6;
v_animationFrames[e_animations.valDie] = 3;
v_animationFrames[e_animations.valBash] = 6;
v_animationFrames[e_animations.valThrust] = 6;
v_animationFrames[e_animations.valRun] = 8;

libPlayerIni();

cpBodyCanvasRegAnim(e_animations.valWalk,   sBodyCanvasHumanWalk1, sBodyCanvasHair1,       sBodyCanvasArmor5,       0, 0, sBodyCanvasLegs2, 0, sBodyCanvasShoes1, 0, 0, 0, 0);
cpBodyCanvasRegAnim(e_animations.valSlash,  sBodyCanvasAttack1,    sBodyCanvasAttackHair1, sBodyCanvasAttackArmor1, 0, 0, 0, 0,             sBodyCanvasAttackShoes1, 0, 0);
cpBodyCanvasRegAnim(e_animations.valFire,   sBodyCanvasFire1,      sBodyCanvasFireHair1,   sBodyCanvasFireArmor1,   0, 0, 0, 0,             sBodyCanvasFireShoes1, 0, 0);
cpBodyCanvasRegAnim(e_animations.valDie,    sBodyCanvasDie1,       sBodyCanvasDieHair1,    sBodyCanvasDieArmor1,    0, 0, 0, 0,             sBodyCanvasDieShoes1, 0, 0);
cpBodyCanvasRegAnim(e_animations.valBash,   sBodyCanvasBash1,      sBodyCanvasBashHair1,   sBodyCanvasBashArmor1,   0, 0, 0, 0,             sBodyCanvasBashShoes1, 0, sCatchError, sBodyCanvasBashShield1);
cpBodyCanvasRegAnim(e_animations.valThrust, sBodyCanvasThrust1,    sBodyCanvasThrustHair1, sBodyCanvasThrustArmor1, 0, 0, 0, 0,             sBodyCanvasThrustShoes1, 0, 0);
cpBodyCanvasRegAnim(e_animations.valRun,   sBodyCanvasRun1, sBodyCanvasRunHair1,       sBodyCanvasRunArmor1,       sBodyCanvasRunHood1, sBodyCanvasRunHood1, sBodyCanvasRunLegs1, 0, sBodyCanvasRunShoes1, sBodyCanvasRunHands1, 0);

instance_create_depth(x, y, 100, oCamera);
instance_create_depth(x, y, -30000, oInventory);
instance_create_depth(x, y, -31000, oHUD);
instance_create_depth(x, y, -31000, oDrawHelperAbove);
instance_create_depth(x, y, -31000, oStateLog);
instance_create_depth(x, y, -31000, oStatusMenu);
instance_create_depth(x, y, -9000, oTreeController);

v_collisionMain = [x, y, x, y];
v_collisionLegs = [x, y, x, y];

v_lerpMode = 0;
v_actualLerp = 0;

//some = 4;

