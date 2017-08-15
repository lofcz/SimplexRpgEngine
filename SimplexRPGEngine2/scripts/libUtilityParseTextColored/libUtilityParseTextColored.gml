/// @function libUtilityParseTextColored(text, font)
/// @desc Returns text from colorText withount flags
/// @arg {string} text Text to parse
/// @arg {font} font Help font

var tmp_text, tmp_output, tmp_parsingFlag, tmp_char, tmp_flagString, tmp_font;
tmp_text = "";
tmp_output = "";
tmp_parsingFlag = false;
tmp_char = "";
tmp_flagString = "";
tmp_font = fntPixel;

if (argument_count > 0) {tmp_text = argument[0];}
if (argument_count > 1) {tmp_font = argument[1];}

fnt(tmp_font);
for (var i = 1; i <= string_length(tmp_text); i++)
{
	tmp_char = string_char_at(tmp_text, i);
	
	if (tmp_char == "[") {tmp_parsingFlag = true; continue;}
	else if (tmp_char == "]") 
	{
		tmp_parsingFlag = false;
		
		if (string_count("icon", tmp_flagString) > 0)
		{
			var tmp_add;
			tmp_add = string_width(" ");
			
			repeat(ceil(16 / tmp_add))
			{
				tmp_output += " ";
			}
		}
		
		tmp_flagString = "";
		continue;
	}
	else
	{
		if (!tmp_parsingFlag) {tmp_output += tmp_char;}
		else {tmp_flagString += tmp_char;}
	}
}

return tmp_output;