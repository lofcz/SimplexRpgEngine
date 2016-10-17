/// scrMapIntro(text, r, g, b)

var text,i,r,g,b;
text = "Sample text";
r    = 0;
g    = 0;
b    = 0;

if (argument_count > 0) {text = argument[0];}
if (argument_count > 1) {r    = argument[1];}
if (argument_count > 2) {g    = argument[2];}
if (argument_count > 3) {b    = argument[3];}

i      = instance_create(view_xview,view_yview,oMapIntro);
i.text = text;
i.r    = r;
i.g    = g;
i.b    = b;
