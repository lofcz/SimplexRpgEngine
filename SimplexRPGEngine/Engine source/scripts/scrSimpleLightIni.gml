/// scrSimpleLightIni(sprite, index, scale, color, alpha, rotation, pulseSize, pulseSpeed)

sprite   = sBasicLight;
index    = 0;
scale    = 1;
color    = c_white;
alpha    = 1;
rot      = 0;
pSize    = 1;
pMode    = 0;
pMaxSize = 0;
pSpd     = 0.002;

if (argument_count > 0) {sprite   = argument[0];}
if (argument_count > 1) {index    = argument[1];}
if (argument_count > 2) {scale    = argument[2];}
if (argument_count > 3) {color    = argument[3];}
if (argument_count > 4) {alpha    = argument[4];}
if (argument_count > 5) {rot      = argument[5];}
if (argument_count > 6) {pMaxSize = argument[6];}
if (argument_count > 7) {pSpd   = argument[7];}

pSSize = (max(sprite_get_width(sprite), sprite_get_height(sprite)) * scale); 
