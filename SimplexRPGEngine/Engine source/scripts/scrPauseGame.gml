/// scrPauseGame(activeObject)

var ao;
ao = -1;

if (argument_count > 0) {ao = argument[0];}

global.temp = ao;
instance_create(x, y, oPause);
