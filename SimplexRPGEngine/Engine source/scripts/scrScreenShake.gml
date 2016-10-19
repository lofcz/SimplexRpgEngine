/// scrScreenShake(power, fadeAmount)

var p, f;
p = 10;
f = 0.2;

if (argument_count > 0) {p = argument[0];}
if (argument_count > 1) {f = argument[1];}

oCamera.screenShake = p;
oCamera.screenShakeFade = f;
