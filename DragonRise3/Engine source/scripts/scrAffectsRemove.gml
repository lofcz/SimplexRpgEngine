/// scrAffectsRemove(affect, stacks)

var affect, stacks;
affect = "poison";
stacks = -1;

if (argument_count > 0) {affect = argument[0];}
if (argument_count > 0) {stacks = argument[1];}


if (stacks != -1)
{
         pos = ds_list_find_index(oPlayer.statusList, affect);
         val = real(oPlayer.statusNList[| pos]) - stacks;
         oPlayer.statusNList[| pos] = real(val);
         if (val <= 0) {stacks = -1}
}
if (stacks = -1)
{
         pos = ds_list_find_index(oPlayer.statusList, affect);
         ds_list_delete(oPlayer.statusList, pos);
         ds_list_delete(oPlayer.statusTimeList, pos);
         ds_list_delete(oPlayer.statusSpriteList, pos);
         ds_list_delete(oPlayer.statusScaleList, pos);   
         ds_list_delete(oPlayer.statusAlphaList, pos); 
         ds_list_delete(oPlayer.statusMTimeList, pos); 
         ds_list_delete(oPlayer.statusColorList, pos);
         ds_list_delete(oPlayer.statusNList, pos);  
}
