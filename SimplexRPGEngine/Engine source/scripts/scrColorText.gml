/// scrColorText(text, color)

var color, text;
text  = "";
color = c_yellow;

if (argument_count > 0) {text  = argument[0];}
if (argument_count > 1) {color = argument[1];}


return(scrColorflag(color) + text +  scrEndColorflag());
