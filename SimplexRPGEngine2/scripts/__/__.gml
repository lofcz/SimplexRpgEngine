/// @function __(text, number)
/// @desc Translates target text into current language
/// @arg {string} text Text to translate
/// @arg {int} number Used for inflection

var tmp_text, tmp_number;
tmp_text = "";
tmp_number = 1;

if (argument_count > 0) {tmp_text = argument[0];}
if (argument_count > 1) {tmp_number = argument[1];}

if (tmp_text == "Inventory")
{
	if (oHUD.v_lang == "cz") {return "Inventář";}
	else {return tmp_text;}
}
else if (tmp_text == "use")
{
	if (oHUD.v_lang == "cz") {return "použít";}
	else {return tmp_text;}
}
else if (tmp_text == "open")
{
	if (oHUD.v_lang == "cz") {return "otevřít";}
	else {return tmp_text;}
}
else if (tmp_text == "close")
{
	if (oHUD.v_lang == "cz") {return "zavřít";}
	else {return tmp_text;}
}
else if (tmp_text == "Equipment")
{
	if (oHUD.v_lang == "cz") {return "Vybavení";}
	else {return tmp_text;}
}