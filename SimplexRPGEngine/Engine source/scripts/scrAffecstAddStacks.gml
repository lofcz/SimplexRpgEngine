/// scrAffecstAddStacks(affect, stackNumber, relative, resetTime)

var affect, sN, relative, rT;
affect = "poison";
sN     = 1;
rel    = true;
rT     = true;

if (argument_count > 0) {affect = argument[0];}
if (argument_count > 1) {sN     = argument[1];}
if (argument_count > 2) {rel    = argument[2];}
if (argument_count > 3) {rT     = argument[3];}

if (ds_list_find_index(oPlayer.statusList, affect) != -1)
{
index = ds_list_find_index(oPlayer.statusList, affect);

if (rel) {oPlayer.statusNList[| index] += sN; }
else {oPlayer.statusNList[| index] = sN;}
if (rT) {oPlayer.statusTimeList[| index] = oPlayer.statusMTimeList[| index];}

return true;
}
else
{
return false;
}

