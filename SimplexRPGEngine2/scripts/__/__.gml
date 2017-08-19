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
else if (tmp_text == "Coins")
{
	if (oHUD.v_lang == "cz") {return "Mincí";}
	else {return tmp_text;}
}
else if (tmp_text == "Crafting")
{
	if (oHUD.v_lang == "cz") {return "Výroba";}
	else {return tmp_text;}
}
else if (tmp_text == "Search")
{
	if (oHUD.v_lang == "cz") {return "Hledat";}
	else {return tmp_text;}
}
else if (tmp_text == "Items")
{
	if (oHUD.v_lang == "cz") {return "Předměty";}
	else {return tmp_text;}
}
else if (tmp_text == "Enchanting")
{
	if (oHUD.v_lang == "cz") {return "Očarování";}
	else {return tmp_text;}
}
else if (tmp_text == "Materials")
{
	if (oHUD.v_lang == "cz") {return "Materiály";}
	else {return tmp_text;}
}
else if (tmp_text == "Alchemy")
{
	if (oHUD.v_lang == "cz") {return "Alchemie";}
	else {return tmp_text;}
}
else if (tmp_text == "Food")
{
	if (oHUD.v_lang == "cz") {return "Jídlo";}
	else {return tmp_text;}
}
else if (tmp_text == "Anvil")
{
	if (oHUD.v_lang == "cz") {return "Kovadlina";}
	else {return tmp_text;}
}