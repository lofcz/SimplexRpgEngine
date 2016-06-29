/// scrTest()

show_message("" + string(name) + ": " + string(global.cutsceneArgument[global.index, 0]));
show_message("" + string(name) + ": " + string(global.cutsceneArgument[global.index, 1]));

with(global.cutsceneOwner[global.cutsceneArgument[global.index, 0]])
    {
    timeToPerform = 40;
    tempSpd = spd;
    }
global.index++;

