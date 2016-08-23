/// scrTimerEnable(timer, enabled)

var t, e;
t = 0;
e = true;

if (argument_count > 0) {t = argument[0];}
if (argument_count > 1) {e = argument[1];}

virtualTimer[t, 0] = e;
