/// string_starts(string, substring)

var s, ss, t;
s  = "";
ss = "";

if (argument_count > 0) {s  = argument[0];}
if (argument_count > 1) {ss = argument[1];}

t = string_copy(s, 1, string_length(ss));
if (t == ss) {return true;}
return false;
