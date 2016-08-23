/// scrTimerUpdate()

for (i = 0; i < array_length_2d(virtualTimer, 0); i++)
    {
     if (virtualTimer[i, 1] > 0 && virtualTimer[i, 0])
        {
         virtualTimer[i, 1]--;
        }
     if (virtualTimer[i, 1] == 0 && virtualTimer[i, 0])
        {
         virtualTimer[i, 0]    = false;
         virtualTimer[i, 1]    = -1;
         virtualTimerTicked[i] = true;
        }
    }
