/// scrAddAffect(affect, time, imageIndex)

var affect, time, iI;
affect = "poison";
time   = 60;
iI     = 0;

if (argument_count > 0) {affect = argument[0];}
if (argument_count > 1) {time   = argument[1];}
if (argument_count > 2) {iI     = argument[2];}

ds_list_add(oPlayer.statusList, affect);
ds_list_add(oPlayer.statusTimeList, time);
ds_list_add(oPlayer.statusSpriteList, iI);

