/// scrSimpleLightUpdate(index, sprite, index, scale, color, alpha, rotation, pulseSize, pulseSpeed)

var I, s, i, S, c, a, r, ps, pS;
I  = 0;
s  = -1;
i  = -1;
S  = -1;
c  = -1;
a  = -1;
r  = -1;
ps = -1;
pS = -1;

if (argument_count > 0) {I  = argument[0];}
if (argument_count > 1) {s  = argument[1];}
if (argument_count > 2) {i  = argument[2];}
if (argument_count > 3) {S  = argument[3];}
if (argument_count > 4) {c  = argument[4];}
if (argument_count > 5) {a  = argument[5];}
if (argument_count > 6) {r  = argument[6];}
if (argument_count > 7) {ps = argument[7];}
if (argument_count > 8) {pS = argument[8];}

if (s  != -1) {slSprite[I]   = s;}
if (i  != -1) {slIndex[I]    = i;}
if (S  != -1) {slScale[I]    = S;}
if (c  != -1) {slColor[I]    = c;}
if (a  != -1) {slAlpha[I]    = a;}
if (r  != -1) {slRot[I]      = r;}
if (ps != -1) {slPSize[I]    = ps;}
if (pS != -1) {slPSpd[I]     = pS;}



