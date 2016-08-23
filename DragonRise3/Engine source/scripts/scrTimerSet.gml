/// scrTimerSet(timer, time, enable)

var t, tt, e;
t  = 0;
tt = 1;
e  = true;

if (argument_count > 0) {t  = argument[0];}
if (argument_count > 1) {tt = argument[1];}
if (argument_count > 2) {e  = argument[2];}

virtualTimer[t, 0] = e;
virtualTimer[t, 1] = tt;
