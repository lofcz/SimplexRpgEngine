/// scrCutsceneAssign(id, thread)

(argument[0]).timeline_index = global.cutsceneThread[argument[1]];
global.cutsceneOwner[argument[1]] = argument[0];

