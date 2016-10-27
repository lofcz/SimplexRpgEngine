#define scrDice
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

#define scrDiceGetValue
/// scrDiceGetValue(min, max, luckToGuaranteeMax, randomizeValue)

var mi, ma, l, rv, v;
mi = 0;
ma = 10;
l  = 40;
rv = -1;

if (argument_count > 0) {mi = argument[0];}
if (argument_count > 1) {ma = argument[1];}
if (argument_count > 2) {l  = argument[2];}
if (argument_count > 3) {rv = argument[3];}

v  = irandom_range(mi, ma);
v += (ma / (((apiPlayerGetPropertyValue(vlastnost_stesti) + 1) / l) * 100) / 10);

if (rv != -1) {rv += irandom_range(-rv, rv);}
v = round(clamp(v, mi, ma));

return (v);
