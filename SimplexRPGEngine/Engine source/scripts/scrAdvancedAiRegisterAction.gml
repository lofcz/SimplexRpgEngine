#define scrAdvancedAiRegisterAction
/// scrAdvancedAiRegisterAction(actionKey, actionType, chanceToCast%, manaToCast, minLevelToCast)

enum aiActionEnum
{
 actionBasic, actionAbility, actionRewrite, actionCheck
}

var mt, ct, mt, ml, ak;
mt = aiActionEnum.actionBasic;
ct = -1;
mc = -1;
ml = -1;
ak = "myAction";

if (argument_count > 0) {ak = argument[0];}
if (argument_count > 1) {mt = argument[1];}
if (argument_count > 2) {ct = argument[2];}
if (argument_count > 3) {mc = argument[3];}
if (argument_count > 4) {ml = argument[4];}

ds_list_add(actionList, tempIndex, ak, mt, ct, mc, ml);
tempIndex++;




#define scrAdvancedAiGetAction
/// scrAdvancedAiGetAction(index / key)

var index, array, i;
index = 0;

if (argument_count > 0) {index = argument[0];}

if (is_string(index)) {i = ds_list_find_index(actionList, index) div 6 * 6}
else {i = (index * 6);}

for (var j = 0; j < 6; j++)
    {
     array[j] = actionList[| i + j];
    }
    
return array;