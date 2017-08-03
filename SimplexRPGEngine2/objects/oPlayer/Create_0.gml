/// @desc Set the player up

entityIni();

libPlayerIni();
cpBodyCanvasRegAnim(e_animations.valWalk, );

cpBodyCanvasRegAnim(e_animations.valWalk,   sBodyCanvasHumanWalk1, sBodyCanvasHair1,       sBodyCanvasArmor5,       0, 0, sBodyCanvasLegs2, 0, sBodyCanvasShoes1, 0, 0);
cpBodyCanvasRegAnim(e_animations.valSlash,  sBodyCanvasAttack1,    sBodyCanvasAttackHair1, sBodyCanvasAttackArmor1, 0, 0, 0, 0,             sBodyCanvasAttackShoes1, 0, 0);
cpBodyCanvasRegAnim(e_animations.valFire,   sBodyCanvasFire1,      sBodyCanvasFireHair1,   sBodyCanvasFireArmor1,   0, 0, 0, 0,             sBodyCanvasFireShoes1, 0, 0);
cpBodyCanvasRegAnim(e_animations.valDie,    sBodyCanvasDie1,       sBodyCanvasDieHair1,    sBodyCanvasDieArmor1,    0, 0, 0, 0,             sBodyCanvasDieShoes1, 0, 0);
cpBodyCanvasRegAnim(e_animations.valBash,   sBodyCanvasBash1,      sBodyCanvasBashHair1,   sBodyCanvasBashArmor1,   0, 0, 0, 0,             sBodyCanvasBashShoes1, 0, sCatchError, sBodyCanvasBashShield1);
cpBodyCanvasRegAnim(e_animations.valThrust, sBodyCanvasThrust1,    sBodyCanvasThrustHair1, sBodyCanvasThrustArmor1, 0, 0, 0, 0,             sBodyCanvasThrustShoes1, 0, 0);

instance_create_depth(x, y, 100, oCamera);
instance_create_depth(x, y, -100, oInventory);
instance_create_depth(x, y, -100, oHUD);
instance_create_depth(x, y, -200, oDrawHelperAbove);

v_collisionMain = [x, y, x, y];
v_collisionLegs = [x, y, x, y];