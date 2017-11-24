/// @function cpSpellsCast(hotslotIndex)
/// @desc Casts spell from target hotbar slot if possible
/// @arg {int} hotslotIndex Hotbar index from oHUD

var tmp_index, tmp_spellIndex;
tmp_index = 0;
tmp_spellIndex = 0;

if (argument_count > 0) {tmp_index = argument[0];}

// First off, check if spell can be casted
if (oHUD.v_hotbar[tmp_index, 0] != 0) {return 0;}
tmp_spellIndex = oHUD.v_hotbar[tmp_index, 1];

if (oHUD.v_playerSpellCD[tmp_spellIndex, 1] == -1)
{
	// Start CD
	oHUD.v_playerSpellCD[tmp_spellIndex, 1] = oHUD.v_playerSpellCD[tmp_spellIndex, 0];
	
	#region Spells database
	
	if (tmp_spellIndex == e_spells.valFireball)
	{
		
	}
	
	#endregion
}