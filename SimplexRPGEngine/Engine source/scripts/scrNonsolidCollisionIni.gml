/// scrNonsolidCollisionIni(x, y, id, unlocked, hitType, hp, tileLayer, allowOnHitDrops, isSecret, isAnimated, animationFrames, animationXOf, animationYOf, animatonSize, animationSpd, animationBcg)

xx              = x;
yy              = y-32;
idd             = "sampleID";
unlocked        = 1;
hitType         = "";
hp              = -1;
tL              = 1000000;
indexer         = 0;
level           = -1;
level           = room;
text[0]         = "";
allowRandomDrop = false;
isSecret        = false;
isAnim          = false;

if (argument_count > 0)  {xx       = argument[0];}
if (argument_count > 1)  {yy       = argument[1];}
if (argument_count > 2)  {idd      = argument[2];}
if (argument_count > 3)  {unlocked = argument[3];}
if (argument_count > 4)  {hitType  = argument[4];}
if (argument_count > 5)  {hp       = argument[5];}
if (argument_count > 6)  {tL       = argument[6];}
if (argument_count > 7)  {allowRandomDrop = argument[7];}
if (argument_count > 8)  {isSecret = argument[8];}
if (argument_count > 9)  {isAnim   = argument[9];}
if (argument_count > 10) {animFrames = argument[10];}
if (argument_count > 11) {animXOf = argument[11];}
if (argument_count > 12) {animYOf = argument[12];}
if (argument_count > 13) {animSize = argument[13];}
if (argument_count > 14) {animSpd = argument[14];}
if (argument_count > 15) {animBcg = argument[15];}

if (isAnim) {ds_list_add(oOptimize.activeList2, id);}

