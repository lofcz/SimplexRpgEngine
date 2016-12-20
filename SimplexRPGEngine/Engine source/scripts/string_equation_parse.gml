/// string_equation_parse(string, partToRemove)

var s, ss, t;
s  = "";
ss = "";

if (argument_count > 0) {s  = argument[0];}
if (argument_count > 1) {ss = argument[1];}

s = string_replace(s, " ", "");
s = string_replace(s, "=", "");
s = string_replace(s, ss, "");
s = string_replace(s, chr(34), "");
s = string_replace(s, chr(34), "");
s = string_replace(s, "#", "");

return s;
