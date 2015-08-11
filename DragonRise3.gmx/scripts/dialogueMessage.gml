/// dialogueMessage(head,text,index)

head  = "Unassigned";
text  = "Sample text";
index = -1;

if (argument_count > 0) {head  = argument[0];}
if (argument_count > 1) {text  = argument[1];}
if (argument_count > 2) {index = argument[2];}


if (instance_number(oMessagebox) = 0) {instance_create(view_xview,view_yview,oMessagebox);} // V podstatě statická třída

oMessagebox.message_head[oMessagebox.message_number]   = head;
oMessagebox.message_text[oMessagebox.message_number]   = text;
oMessagebox.message_index[oMessagebox.message_number]  = index;

oMessagebox.message_number++;
oMessagebox.idd++;
oMessagebox.parent = (id);
