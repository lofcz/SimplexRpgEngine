/// @function libUtilityQuestTypeToString(type)
/// @desc Converts e_questType into string equivalent
/// @arg {e_questType} type Quest type

var tmp_t;
tmp_t = e_questType.valMain;

if (argument_count > 0) {tmp_t = argument[0];}

if (tmp_t == e_questType.valDLC) {return __("DlC");}
if (tmp_t == e_questType.valHidden) {return __("Hidden");}
if (tmp_t == e_questType.valMain) {return __("Main");}
if (tmp_t == e_questType.valSide) {return __("Side");}
if (tmp_t == e_questType.valSpecial) {return __("Special");}

return __("Undefined quest type");