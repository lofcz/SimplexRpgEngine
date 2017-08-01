/// @function libUtilityParseTextColored(text)
/// @desc Returns text from colorText withount flags
/// @arg {string} text Text to parse

var tmp_text, tmp_output, tmp_parsingFlag, tmp_char, tmp_flagString;
tmp_text = "";
tmp_output = "";
tmp_parsingFlag = false;
tmp_char = "";
tmp_flagString = "";

if (argument_count > 0) {tmp_text = argument[0];}

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