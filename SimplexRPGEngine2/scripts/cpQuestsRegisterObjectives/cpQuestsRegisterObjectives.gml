/// @function cpQuestsRegisterObjectives(objective1.. objective16)
/// @desc Attaches objectives data to the quest
/// @arg {string} objective1.. First objective

for (var i = 0; i < 16; i++)
{
	if (argument_count > i)
	{
		// <name, isVisible?, isProxied?, completed?>
		oHUD.v_playerQuestsObjectives[v_questIndex - 1, (i * 4)] = argument[i];
		oHUD.v_playerQuestsObjectives[v_questIndex - 1, (i * 4) + 1] = true;
		oHUD.v_playerQuestsObjectives[v_questIndex - 1, (i * 4) + 2] = false;
		oHUD.v_playerQuestsObjectives[v_questIndex - 1, (i * 4) + 3] = false;
	}
	else
	{
		break;	
	}
}

return true;