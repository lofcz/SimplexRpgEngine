/// scrLockpickingAddTumblerCombination(tumbler, index, combination)

var tumber, index, text;
tumbler = 0;
index   = 0;
text    = "";

if (argument_count > 0) {tumbler = argument[0];}
if (argument_count > 1) {index   = argument[1];}
if (argument_count > 2) {text    = argument[2];}

oLockpickingScreen.itemUpCombination[tumbler, index] = text;
