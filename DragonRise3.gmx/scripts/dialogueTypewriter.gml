/// dialogueTypewriter()


str = string_copy(message_text[message_current],1,pos) ;
if (pos < string_length(message_text[message_current])) {pos += type_speed;}

help_text = string_copy(str,ceil(pos-1),1); 
if (help_text = "[") {f = 1;}
while(f)
        {
        str = string_copy(message_text[message_current],1,pos) ;
if (pos < string_length(message_text[message_current])) {pos += type_speed;}

help_text = string_copy(str,pos-1,1); 
if (help_text = "]") {f = 0;}

        }
      