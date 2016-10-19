/// scrScreenFlash(text, duration, color)

var t, d, c, i;
t = "Sample text";
d = secToSteps(3);
c = c_white;

if (argument_count > 0) {t = argument[0];}
if (argument_count > 1) {d = argument[1];}
if (argument_count > 2) {c = argument[2];}

i = instance_create(x, y, oScreenFlash);
i.text = t;
i.d    = d;
i.c    = c;
