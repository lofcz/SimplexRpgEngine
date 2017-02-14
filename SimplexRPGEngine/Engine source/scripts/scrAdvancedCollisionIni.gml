///scrAdvancedCollisionIni(x, y, idd, unlocked, hitType, hp, tileLayer, isSecret, dropSprite, dropIndex)

xx       = x;
yy       = y-32;
idd      = "sampleID";
unlocked = 1;
hitType  = "";
hp       = 10;
tL       = 1000000;
indexer  = 0;
level    = -1;
level    = room;
text[0]  = "";
isSecret = false;
dropSprite = sEnvHelpTextures;
dropIndex  = 0;

if (argument_count > 0) {xx       = argument[0];}
if (argument_count > 1) {yy       = argument[1];}
if (argument_count > 2) {idd      = argument[2];}
if (argument_count > 3) {unlocked = argument[3];}
if (argument_count > 4) {hitType  = argument[4];}
if (argument_count > 5) {hp       = argument[5];}
if (argument_count > 6) {tL       = argument[6];}
if (argument_count > 7) {isSecret = argument[7];}
if (argument_count > 8) {dropSprite = argument[8];}
if (argument_count > 9) {dropIndex  = argument[9];}

