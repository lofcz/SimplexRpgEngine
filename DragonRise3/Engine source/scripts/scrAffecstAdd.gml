/// scrAffecstAdd(affect, time, imageIndex, color, stackNumber)

var affect, time, iI, sN, index;
affect = "poison";
time   = 60;
iI     = 0;
color  = c_lime;
sN     = 1;

if (argument_count > 0) {affect = argument[0];}
if (argument_count > 1) {time   = argument[1];}
if (argument_count > 2) {iI     = argument[2];}
if (argument_count > 3) {color  = argument[3];}
if (argument_count > 4) {sN     = argument[4];}

if (ds_list_find_index(oPlayer.statusList, affect) = -1)
{
ds_list_add(oPlayer.statusList, affect);
ds_list_add(oPlayer.statusTimeList, time);
ds_list_add(oPlayer.statusSpriteList, iI);
ds_list_add(oPlayer.statusScaleList, 1.25);
ds_list_add(oPlayer.statusAlphaList, 0.05);
ds_list_add(oPlayer.statusMTimeList, time);
ds_list_add(oPlayer.statusColorList, color);
ds_list_add(oPlayer.statusNList, sN);
}
else
{
index = ds_list_find_index(oPlayer.statusList, affect);

oPlayer.statusTimeList[| index]  = time;
oPlayer.statusScaleList[| index] = 1.25;
oPlayer.statusMTimeList[| index] = time;
oPlayer.statusColorList[| index] = color;
oPlayer.statusNList[| index]    += sN;
}

