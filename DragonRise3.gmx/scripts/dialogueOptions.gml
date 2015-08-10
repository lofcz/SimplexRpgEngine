/// dialogueOptions(id)

if (instance_number(oMessagebox) = 0) {instance_create(view_xview,view_yview,oMessagebox);} // V podstatě statická třída



if (instance_number(oAnswer) = 0)
   {
   // answer = instance_create(view_xview+352,view_yview+320,oAnswer);        
        
    oMessagebox.idd++;
    oMessagebox.option[oMessagebox.idd] = argument0; 
    oMessagebox.c++;
    oMessagebox.parent = (id);

   }



