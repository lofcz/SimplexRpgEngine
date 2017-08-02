/// scrWordwrap(string, width, font)

var str, width, nextWord, f;
str      = "";
width    = 0;
out      = "";
outLine  = "";
nextWord = ""; 
f        = fntPixel;

if (argument_count > 0) {str   = argument[0];}
if (argument_count > 1) {width = argument[1];}
if (argument_count > 2) {f     = argument[2];}

fnt(f);
while (string_length(str) > 0)
    {
     // At first we take next word from string.
     nextWord = scrWordwrapGetNextWord(str, width);
     
     // In case of empty word delete one char and continue.
     if (nextWord == "") {str = string_delete(str, 1, 1); continue;}  
	 if (nextWord == "#") {str = string_delete(str, 1, 1); out += outLine + "#"; outLine = ""; continue;}

     // Don't count SimplexString into the string width.
     tempLine = libUtilityParseTextColored(outLine, f); 
      
     // Add if sum of widths is lesser than max width.  
	 fnt(f);
     if (string_width(tempLine) + string_width(libUtilityParseTextColored(nextWord, f)) < width) 
        {                        
         outLine += nextWord + " ";
         str = string_delete(str, 1, string_length(nextWord));
        }
        else // In other case add newline.
            {
             outLine += nextWord;
             out += outLine + "#";
             outLine = "";
             str = string_delete(str, 1, string_length(nextWord));
            }
    }
fnt(f);
// Add rest of last line to output.   
out += outLine;
return out;