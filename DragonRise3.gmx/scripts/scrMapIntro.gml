/// scrMapIntro(text)

var text,i;
text = "Sample text";

if (argument_count > 0) {text = argument[0];}

i = instance_create(view_xview,view_yview,oMapIntro);
i.text = text;