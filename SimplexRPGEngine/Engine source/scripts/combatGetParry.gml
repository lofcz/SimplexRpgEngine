#define combatGetParry
/// combatGetParry()

if (oPlayerCombat.attackMode == "parry") {return true;}
return false;


#define combatGetBash
/// combatGetBash()

if (oPlayer.currentAnimation == animationEnum.bash) {return true;}
return false;