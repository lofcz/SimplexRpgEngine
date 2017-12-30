/// @function cpAchievementsDB(achievement)
/// @desc Procs target achievement
/// @arg {e_achievements} achievement Achievement index

var tmp_index;
tmp_index = e_achievements.valAchievement1;

if (argument_count > 0) {tmp_index = argument[0];}

#region Database

if (tmp_index == e_achievements.valAchievement1)
{
	oHUD.v_playerProperty[e_inventoryProperties.valMaxHp] += 10;
}

#endregion