/// scrTimerIni(timersNumber, timer1Time.., timer1Enabled..)

var n;
n = 1;

if (argument_count > 0) {n = argument[0];}

virtualTimer[n, 0]    = false;
virtualTimer[n, 1]    = 0;
virtualTimerTicked[n] = false;

for (i = 1; i < 16; i += 2)
    {
     if (argument_count > i)
        {
         virtualTimer[n, 0] = argument[i];
         virtualTimer[n, 1] = argument[i+1];     
        }
     else {break;}
    }
