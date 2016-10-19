/// scrThrowItem(imageIndex, speed, speedMax, damage, x, y)

var ii, s, sm, d, i, xx, yy;
ii = 0;
s  = 3;
sm = 8;
d  = 10;
xx = oPlayer.x;
yy = oPlayer.y;

if (argument_count > 0) {ii = argument[0];}
if (argument_count > 1) {s  = argument[1];}
if (argument_count > 2) {sm = argument[2];}
if (argument_count > 3) {d  = argument[3];}

i = instance_create(xx, yy, oThrowableItem);
i.speed       = s;
i.maxSpeed    = sm;
i.damage      = d;
i.image_index = ii;

