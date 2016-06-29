/// scrCutscenePrepare(threads, steps)

var threads;
threads = 1;

if (argument_count > 0) {threads = argument[0];}

for (i = 0; i < threads; i++)
    {
    global.cutsceneThread[i] = timeline_add();
    global.cutsceneOwner[i]  = 0;
    } 
    
global.tempThreads  = threads;
global.cutsceneTime = argument[1];
global.index        = 0;
global.helper       = -1;

instance_create(x, y, oCutscene);

    
