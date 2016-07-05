/// stateAddEntry(text)

var text;
text = "Sample text";

if (argument_count > 0) {text = argument[0];}

ds_list_add(oState.list,text);
ds_list_add(oState.list_alpha,2);


