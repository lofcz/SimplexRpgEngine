/// @function cpQuestsRegister(name, description, reward, difficulty, fraction, questType)
/// @desc Registers new quest into the system
/// @arg {string} name Quest name
/// @arg {string} description Quest description
/// @arg {string} reward Quest reward
/// @arg {string} difficulty In range 1 to 10
/// @arg {string} fraction Quest fraction
/// @arg {e_questType} questType Type of the quest

enum e_questType
{
	valMain,
	valSide,
	valSpecial,
	valHidden,
	valDLC
}

var tmp_n, tmp_d, tmp_r, tmp_D, tmp_f, tmp_q;
tmp_n = "Quest name";
tmp_d = "Quest description";
tmp_r = "???";
tmp_D = 4;
tmp_f = "CORE";
tmp_q = e_questType.valMain;

if (argument_count > 0) {tmp_n = argument[0];}
if (argument_count > 1) {tmp_d = argument[1];}
if (argument_count > 2) {tmp_r = argument[2];}
if (argument_count > 3) {tmp_D = argument[3];}
if (argument_count > 4) {tmp_f = argument[4];}
if (argument_count > 5) {tmp_q = argument[5];}


// <name, description, reward, difficulty, fraction, questType, active>
oHUD.v_playerQuests[v_questIndex, 0] = tmp_n;
oHUD.v_playerQuests[v_questIndex, 1] = tmp_d;
oHUD.v_playerQuests[v_questIndex, 2] = tmp_r;
oHUD.v_playerQuests[v_questIndex, 3] = tmp_D;
oHUD.v_playerQuests[v_questIndex, 4] = tmp_f;
oHUD.v_playerQuests[v_questIndex, 5] = tmp_q;
oHUD.v_playerQuests[v_questIndex, 6] = false;

// <name, completed?>
oHUD.v_playerQuestsObjectives[v_questIndex, 0] = "";
oHUD.v_playerQuestsObjectives[v_questIndex, 1] = false;



ds_list_add(oHUD.v_playerQuestsList, tmp_n, tmp_d, tmp_r, tmp_D, tmp_f, tmp_q, false); 

v_questAlpha[v_questIndex] = 0;
v_questDetail[v_questIndex] = false;
v_questSize[v_questIndex] = 0;
v_questIndex++;
