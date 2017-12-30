/// @function cpAffectionsDB(affection)
/// @desc Occurs once stack is activated
/// @arg {e_affection} affection Affection index

var tmp_affection;
tmp_affection = e_affections.valVenom;

if (argument_count > 0) {tmp_affection = argument[0];}

#region Affects database

if (tmp_affection == e_affections.valVenom)
{
	oHUD.v_playerProperty[e_inventoryProperties.valHp] -= 5;
	return true;
}

#endregion

return false;