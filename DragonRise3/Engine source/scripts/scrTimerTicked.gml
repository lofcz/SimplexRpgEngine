/// scrTimerTicked(timer)

var t;
t = 0;

if (argument_count > 0) {t = argument[0];}

if (virtualTimerTicked[t]) {return true;}
return false;
