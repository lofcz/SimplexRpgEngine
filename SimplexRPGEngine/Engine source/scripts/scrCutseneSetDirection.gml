/// scrCutseneSetDirection(obj, direction)

var dir, o;
dir = "s";
o   = self;

if (argument_count > 0) {o   = argument[0];}
if (argument_count > 1) {dir = argument[1];}

o.dir        = dir;
o.isStanding = true;
o.mood       = "cutscene";

