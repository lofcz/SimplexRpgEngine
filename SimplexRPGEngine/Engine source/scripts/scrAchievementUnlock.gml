/// scrAchievementUnlock(id)

var idd, inst;
idd = 0;

if (argument_count > 0) {idd = argument[0];}

if (!oHUD.achievemnets[idd, 4])
{
oHUD.achievemnets[idd, 4] = true;
inst = instance_create(view_xview, view_yview, oAchievement);
inst.header = oHUD.achievemnets[idd, 0];
inst.text = oHUD.achievemnets[idd, 1];
inst.index = oHUD.achievemnets[idd, 2];
inst.medalType = oHUD.achievemnets[idd, 3];
}
