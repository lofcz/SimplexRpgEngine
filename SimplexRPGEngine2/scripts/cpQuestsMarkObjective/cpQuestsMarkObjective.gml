/// @function cpQuestsMarkObjective(quest, objectiveIndex, completed?)
/// @desc Sets wheather is provided objective completed
/// @arg {e_quests} quest Quest index
/// @arg {int} objectiveIndex Index of objective
/// @arg {bool} completed? Is objective completed?

var tmp_q, tmp_i, tmp_c;
tmp_q = e_quests.valFuckOff;
tmp_i = 0;
tmp_c = true;

if (argument_count > 0) {tmp_q = argument[0];}
if (argument_count > 1) {tmp_i = argument[1];}
if (argument_count > 2) {tmp_c = argument[2];}

oHUD.v_playerQuestsObjectives[tmp_q, (4 * tmp_i) + 3] = tmp_c;
return true;
