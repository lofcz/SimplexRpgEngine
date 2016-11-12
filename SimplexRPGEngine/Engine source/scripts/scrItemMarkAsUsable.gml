/// scrItemMarkAsUsable(recoverHp, recoverMp, recoverStamina, recoverShield)

var h, m, s, S;
h = 0;
m = 0;
s = 0;
S = 0;

if (argument_count > 0) {h = argument[0];}
if (argument_count > 1) {m = argument[1];}
if (argument_count > 2) {s = argument[2];}
if (argument_count > 3) {S = argument[3];}

vlastnost[vlastnost_healHp]      = h;
vlastnost[vlastnost_healMp]      = m;
vlastnost[vlastnost_healStamina] = s;
vlastnost[vlastnost_healShield]  = S;

