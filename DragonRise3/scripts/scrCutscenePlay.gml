/// scrCutscenePlay(obj, cutscene, loop, cutsceneSpeed)

var obj, cutscene, loop, cs;
obj      = self;
cutscene = -1;
loop     = false;
cs       = 1;

if (argument_count > 0) {obj      = argument[0];}
if (argument_count > 1) {cutscene = argument[1];}
if (argument_count > 2) {loop     = argument[2];}
if (argument_count > 3) {cs       = argument[3];}


obj.timeline_index   = cutscene;
obj.timeline_loop    = loop;
obj.timeline_speed   = cs;
obj.timeline_running = true;
