/// scrCutsceneStart()

for (i = 0; i < global.tempThreads; i++)
    {
     global.cutsceneOwner[i].timeline_running  = true;
     global.cutsceneOwner[i].timeline_speed    = 1;
     global.cutsceneOwner[i].timeline_position = 0;
    }
