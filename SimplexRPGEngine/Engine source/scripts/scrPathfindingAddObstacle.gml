/// scrPathfindingAddObstacle(x, y)

var xx, yy;
xx = argument[0];
yy = argument[1];


areaMap[(topX - xx) / 32, (topY - yy) / 32] = 1;
