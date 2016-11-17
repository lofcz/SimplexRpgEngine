/// stateAddEntry(text, color)

var text, color;
text  = "Sample text";
color = -1;

if (argument_count > 0) {text  = argument[0];}
if (argument_count > 1) {color = argument[1];}

if (color == -1) {ds_list_add(oState.list, text);}
else {ds_list_add(oState.list, scrColorText(text, color));}
ds_list_add(oState.list_alpha, 2);


