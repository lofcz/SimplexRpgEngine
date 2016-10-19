/// scrAffectsGetStacks(affect)

var affect;
affect = "poison";

if (argument_count > 0) {affect = argument[0];}

if (ds_list_find_index(oPlayer.statusList, affect) != -1)
{
index = ds_list_find_index(oPlayer.statusList, affect);
return oPlayer.statusNList[| index];
}
else
{
return -1;
}
