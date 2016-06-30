/// scrCutsceneToggle(obj, forceAction)

var obj, fA;
obj = self;
fA  = -1;

if (argument_count > 0) {obj = argument[0];}
if (argument_count > 1) {fA  = argument[1];}

if (fA == -1) {obj.timeline_running = !obj.timeline_running;}
else if (fA == cutsceneState.csRunning) {obj.timeline_running = true;}
else if (fA == cutsceneState.csPaused)  {obj.timeline_running = false;}
