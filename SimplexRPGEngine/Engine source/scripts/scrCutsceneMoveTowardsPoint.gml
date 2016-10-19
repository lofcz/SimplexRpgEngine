/// scrCutsceneMoveTowardsPoint(obj, x, y, spd)

var obj,xx,yy,s;
obj = self;
xx  = x;
yy  = y;
s   = 3;

if (argument_count > 0) {obj = argument[0];}
if (argument_count > 1) {xx  = argument[1];}
if (argument_count > 2) {yy  = argument[2];}
if (argument_count > 3) {s   = argument[3];}

obj.mood      = "cutscene";
obj.cutsceneX = xx;
obj.cutsceneY = yy;
obj.spd       = s;

if (floor(xx) > floor(x)) {dir = "d";}
else if (floor(xx) < floor(x)) {dir = "a";}
else if (floor(yy) > floor(y)) {dir = "s";}
else if (floor(yy) < floor(y)) {dir = "w";}
 
