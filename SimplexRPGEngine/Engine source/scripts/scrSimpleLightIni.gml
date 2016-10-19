/// scrSimpleLightIni(sprite, index, scale, color, alpha, rotation)

sprite = sBasicLight;
index  = 0;
scale  = 1;
color  = c_white;
alpha  = 1;
rot    = 0;

if (argument_count > 0) {sprite = argument[0];}
if (argument_count > 1) {index  = argument[1];}
if (argument_count > 2) {scale  = argument[2];}
if (argument_count > 3) {color  = argument[3];}
if (argument_count > 4) {alpha  = argument[4];}
if (argument_count > 5) {rot    = argument[5];}
