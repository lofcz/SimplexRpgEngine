/// scrAchievementRegister(id, header, text, spriteIndex, medalType)

var idd, h, t, s, mT;
idd = 0;
h   = "Sample header";
t   = "Sample text";
s   = 0;
mT  = medalEnum.bronze;

if (argument_count > 0) {idd = argument[0];}
if (argument_count > 1) {h   = argument[1];}
if (argument_count > 2) {t   = argument[2];}
if (argument_count > 3) {s   = argument[3];}
if (argument_count > 4) {mT  = argument[4];}


oHUD.achievemnets[idd, 0] = h;
oHUD.achievemnets[idd, 1] = t;
oHUD.achievemnets[idd, 2] = s;
oHUD.achievemnets[idd, 3] = mT;
oHUD.achievemnets[idd, 4] = false;

