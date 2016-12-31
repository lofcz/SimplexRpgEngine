/// scrCollectibleUnlock(type, index)

var t, i;
i = 0;
t = 0;

if (argument_count > 0) {i = argument[0];}
if (argument_count > 1) {t = argument[1];}

oStatusMenu.collectibleUnlocked[t, i] = true;
