/// dialogueOptions(id)

var idd;
idd = 0;

if (argument_count > 0) {idd = argument[0];}

if (instance_number(oMessagebox) = 0) {instance_create(view_xview,view_yview,oMessagebox);}
oMessagebox.option[oMessagebox.message_number-1] = idd; 
oMessagebox.parent                               = (id);
