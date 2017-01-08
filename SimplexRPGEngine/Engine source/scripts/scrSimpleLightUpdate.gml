/// scrSimpleLightUpdate(sprite, index, scale, color, alpha, rotation, pulseSize, pulseSpeed)

var s, i, S, c, a, r, ps, pS;
s  = -1;
i  = -1;
S  = -1;
c  = -1;
a  = -1;
r  = -1;
ps = -1;
pS = -1;

if (argument_count > 0) {s  = argument[0];}
if (argument_count > 1) {i  = argument[1];}
if (argument_count > 2) {S  = argument[2];}
if (argument_count > 3) {c  = argument[3];}
if (argument_count > 4) {a  = argument[4];}
if (argument_count > 5) {r  = argument[5];}
if (argument_count > 6) {ps = argument[6];}
if (argument_count > 7) {pS = argument[7];}

if (s  != -1) {sprite   = s;}
if (i  != -1) {index    = i;}
if (S  != -1) {scale    = S;}
if (c  != -1) {color    = c;}
if (a  != -1) {alpha    = a;}
if (r  != -1) {rotation = r;}
if (ps != -1) {pSize    = ps;}
if (pS != -1) {pSpd     = pS;}



