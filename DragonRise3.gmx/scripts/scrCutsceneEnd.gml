/// scrCutsceneEnd()

for (i = 0; i < global.tempThreads; i++)
    {
     timeline_delete(global.cutsceneThread[i]);
    }
global.index  = 0;
global.helper = -1;

