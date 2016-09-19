/// dialogueOptions(id)

if (instance_number(oMessagebox) = 0) {instance_create(view_xview,view_yview,oMessagebox);}
oMessagebox.option[oMessagebox.message_number-1] = argument0; 
oMessagebox.parent = (id);
