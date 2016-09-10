/// scrMinimapAddWaypoint(id, x, y, hoverText, symbol, color, imageIndex)

var in, xx, yy, ht, normalizedX, normalizedY, s, c, ii;
in = 0;
xx = x;
yy = y;
ht = "Sample text";
s  = "x";
c  = c_white;
ii = -1;

if (argument_count > 0) {in = argument[0];}
if (argument_count > 1) {xx = argument[1];}
if (argument_count > 2) {yy = argument[2];}
if (argument_count > 3) {ht = argument[3];}
if (argument_count > 4) {s  = argument[4];}
if (argument_count > 5) {c  = argument[5];}
if (argument_count > 6) {ii = argument[6];}

normalizedX = (xx * (oMinimap.width / room_width));
normalizedY = (yy * (oMinimap.height / room_height));

ds_list_add(oMinimap.pointList, in);
ds_list_add(oMinimap.pointListX, xx);
ds_list_add(oMinimap.pointListY, yy);
ds_list_add(oMinimap.pointListText, ht);
ds_list_add(oMinimap.pointListSymbol, s);
ds_list_add(oMinimap.pointListColor, c);
ds_list_add(oMinimap.pointListSprite, ii);
