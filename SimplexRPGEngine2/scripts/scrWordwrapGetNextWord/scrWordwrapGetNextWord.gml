/// scrWordwrapGetNextWord(string)

var str, i, qS;
str = argument[0];
i   = 1;
qS  = ""

while (string_char_at(str, i) != " ")
    {
     qS += string_char_at(str, i);
     i++;     
     
     if (i > string_length(str)) {break;}
    }
    
return qS;