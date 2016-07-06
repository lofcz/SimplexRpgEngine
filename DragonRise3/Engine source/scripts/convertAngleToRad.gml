/// convertAngleToRad(angle)

var angle;
angle = 0;

if (argument_count > 0) {angle = argument[0];}

return min(((pi / 180) * angle), 2 * pi);
