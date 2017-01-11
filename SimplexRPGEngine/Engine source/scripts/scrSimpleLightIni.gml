/// scrSimpleLightIni(index, sprite, imageIndex, scale, color, alpha, rotation, pulseSize, pulseSpeed)

var index;
index = 0;

if (argument_count > 0) {index = argument[0];}
else
{
slSprite[index]   = sBasicLight;
slIndex[index]    = 0;
slScale[index]    = 1;
slColor[index]    = c_white;
slAlpha[index]    = 1;
slRot[index]      = 0;
slPSize[index]    = 1;
slPMode[index]    = 0;
slPMaxSize[index] = 0;
slPSpd[index]     = 0.002;
}

if (argument_count > 1) {slSprite[index]   = argument[1];}
if (argument_count > 2) {slIndex[index]    = argument[2];}
if (argument_count > 3) {slScale[index]    = argument[3];}
if (argument_count > 4) {slColor[index]    = argument[4];}
if (argument_count > 5) {slAlpha[index]    = argument[5];}
if (argument_count > 6) {slRot[index]      = argument[6];}
if (argument_count > 7) {slPMaxSize[index] = argument[7]; slPSize[index] = 1; slPMode[index] = 0;}
if (argument_count > 8) {slPSpd[index]     = argument[8];}
