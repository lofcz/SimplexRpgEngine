/// scrDice(chance%, playerLuckModifier, maxLuckBonus%)

var chance, pLM, mLB;
chance = 50;
pLM    = 0;
mLB    = 100;

if (argument_count > 0) {chance = argument[0];}
if (argument_count > 1) {pLM    = argument[1];}
if (argument_count > 2) {mLB    = argument[2];}

if (irandom(100) > (100 - (chance + min(pLM * oPlayer.vlastnost[vlastnost_stesti], mLB)))) {return 1;}
return 0;
