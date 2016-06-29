/// scrCutsceneMomentMove(thread, direction, x, y, spd)

with(global.cutsceneOwner[global.cutsceneArgument[global.index, 4]])
    {
     tempSpd   = spd;
     dir       = global.cutsceneArgument[global.index, 0];
     mood      = "cutscene";
     cutsceneX = global.cutsceneArgument[global.index, 1];
     cutsceneY = global.cutsceneArgument[global.index, 2];
     spd       = global.cutsceneArgument[global.index, 3];
    
      timeToPerform = ceil(distance_to_point(cutsceneX, cutsceneY) / spd);
    }
global.index++;
