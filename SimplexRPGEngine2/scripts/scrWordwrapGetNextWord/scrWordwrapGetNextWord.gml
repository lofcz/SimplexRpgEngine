/// scrWordwrapGetNextWord(string)

var str, i, qS, I;
str = argument[0];
i   = 1;
qS  = ""
I = 0;

if (string_char_at(str, 1) == "#") {return "#";}

while (string_char_at(str, i) != " " && string_char_at(str, i) != "#")
    {
     qS += string_char_at(str, i);
     i++;     
     
     if (i > string_length(str)) {break;}
	 I++;
    }
    

return qS;