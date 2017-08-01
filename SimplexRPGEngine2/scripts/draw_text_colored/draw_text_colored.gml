/// @function draw_text_colored(x, y, text, w, font)
/// @desc Draws text using bbcode flags: _sc(color, string), _sb(string) [bold], _si(string) [italic], _sp(sprite, image, text)
/// @arg {int} x X
/// @arg {int} y Y
/// @arg {string} text Text to be drawn
/// @arg {int} w Max line width, simulating gm draw_ext format
/// @arg {font} font Font to use

var tmp_input, tmp_sequenceState, tmp_currentColor, tmp_x, tmp_y, tmp_flagString, tmp_baseColor, tmp_startX, tmp_startY, tmp_flagActiveBold, tmp_boldDifY, tmp_flagActiveItalic, tmp_w, tmp_cW, tmp_font;
tmp_baseColor = c_white;
tmp_input = "This is [bold][color=" +string(c_yellow) + "]text[/color][/bold], bold and colored. #This is newline.#[italic]This is italic text[/italic]##And look, cute [icon=sItems,4] icon";
tmp_sequenceState = "print";
tmp_currentColor = tmp_baseColor;
tmp_flagString = "";
tmp_x = mouse_x;
tmp_y = mouse_y + 32;
tmp_flagActiveBold = false;
tmp_flagActiveItalic = false;
tmp_cW = 0;
tmp_w = -1;
tmp_font = fntPixel;

if (argument_count > 0) {tmp_x = argument[0];}
if (argument_count > 1) {tmp_y = argument[1];}
if (argument_count > 2) {tmp_input = argument[2];}
if (argument_count > 3) {tmp_w = argument[3];}
if (argument_count > 4) {tmp_font = argument[4];}

tmp_startX = tmp_x;
tmp_startY = tmp_y;

fnt(tmp_font);

// If w parameter is set, linebreak the text
if (tmp_w != -1)
{
	tmp_input = scrWordwrap(tmp_input, tmp_w, tmp_font);
}

tmp_sequenceState = "print";
for (var i = 1; i <= string_length(tmp_input); i++)
{
	var tmp_char;
	tmp_char = string_char_at(tmp_input, i);
	
	if (tmp_char == "#") {tmp_y += ((string_height("#") / 3) * 2) + 2; tmp_x = tmp_startX; continue;}
	else if (tmp_char == "[") {tmp_sequenceState = "parseFlag"; continue;}
	else if (tmp_char == "]") 
	{
		// First we deside if flag is closing or opening
		if (string_count("/", tmp_flagString) > 0)
		{
			if (string_count("color", tmp_flagString) > 0)
			{			
				tmp_currentColor = tmp_baseColor;
			}	
			
			if (string_count("bold", tmp_flagString) > 0)
			{			
				tmp_flagActiveBold = false;
			}	
			
			if (string_count("italic", tmp_flagString) > 0)
			{			
				tmp_flagActiveItalic = false;
			}					
		}
		else
		{
			if (string_count("color", tmp_flagString) > 0)
			{
				var tmp_flagRem;
				tmp_flagRem = string_replace(tmp_flagString, "color=", "");
			
				tmp_currentColor = real(tmp_flagRem);
			}
			
			if (string_count("bold", tmp_flagString) > 0)
			{			
				tmp_flagActiveBold = true;
			}
			
			if (string_count("italic", tmp_flagString) > 0)
			{			
				tmp_flagActiveItalic = true;
			}	
			
			if (string_count("icon", tmp_flagString) > 0)
			{			
				var tmp_flagRem, tmp_flagPart1, tmp_flagPart2;
				tmp_flagRem = string_replace(tmp_flagString, "icon=", "");
				tmp_flagPart1 = string_copy(tmp_flagRem, 1, string_pos(",", tmp_flagRem) - 1);
				
				tmp_flagRem = string_replace(tmp_flagRem, tmp_flagPart1, "");
				tmp_flagRem = string_replace(tmp_flagRem, ",", "");
				
				tmp_flagPart2 = tmp_flagRem;
				
				draw_sprite(real(tmp_flagPart1), real(tmp_flagPart2), tmp_x + 8, tmp_y + 8);
				tmp_x += 16;
				

			}			
		}
		tmp_sequenceState = "print"; 
		tmp_flagString = "";		
		continue;
	}
	else
	{
		if (tmp_sequenceState == "print")
		{			
			if (!tmp_flagActiveBold) {fnt(tmp_font); tmp_boldDifY = 0}
			else {fnt(tmp_font); tmp_boldDifY = string_height(tmp_char); fnt(fntPixelHuge); tmp_boldDifY = string_height(tmp_char) - tmp_boldDifY;}
			
			clr(tmp_currentColor, -1);
			draw_text_transformed(tmp_x, tmp_y - tmp_boldDifY / 2, tmp_char, 1, 1, -(tmp_flagActiveItalic * 5));
			tmp_x += string_width(tmp_char);
		}
		
		if (tmp_sequenceState == "parseFlag")
		{
			tmp_flagString 	+= tmp_char;
		}
	}
	
}

clr();