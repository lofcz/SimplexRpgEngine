/// @function cpQuestsStart(name)
/// @desc Starts target quest
/// @arg {string} name Quest name

var tmp_n;
tmp_n = "";

if (argument_count > 0) {tmp_n = argument[0];}

for (var i = 0; i < ds_list_size(oHUD.v_playerQuestsList); i += oHUD.v_questLenght)
{
	if (oHUD.v_playerQuestsList[| i] == tmp_n) 
	{
		oHUD.v_playerQuestsList[| i + 6] = true;	
		return true;
	}
}

return false;