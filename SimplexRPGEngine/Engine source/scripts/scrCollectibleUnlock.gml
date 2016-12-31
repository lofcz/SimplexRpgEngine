/// scrCollectibleUnlock(type, index)

var t, i;
i = 0;
t = 0;

if (argument_count > 0) {t = argument[0];}
if (argument_count > 1) {i = argument[1];}

oStatusMenu.collectibleUnlocked[t, i] = true;
