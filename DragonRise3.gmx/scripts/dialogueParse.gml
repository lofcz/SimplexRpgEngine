/// dialogueParse(string)
//show_message("PARSE STARTING");
var a,f;
input = "";
ret   = string_length(input)
f = 0;
if (argument_count > 0) {input = argument[0];}
str = input;//string_copy(message_text[message_current],1,pos) ;

for(a = 0; a < string_length(str); a++)
{

help_text = string_copy(input,a,1); 
if (help_text = "[") {f = 1; input = string_delete(input,a,1);}
pos = a;
str = input
while(f)
        {
      //  str = string_copy(input,1,string_length(input)) ;
     //   if (pos < string_length(input)) {pos += 1;}

help_text = string_copy(str,a,1); 
if (help_text = "]") {f = 0; }//show_message(""); 
input = string_delete(input,a,1);
str = input
//show_message(input);
        }
      
if (pos < string_length(input)) {pos += 1;}
}
//show_message("PARSE: "+input);
//show_message(string(string_width(text))+"#"+string(string_width(input)));

return (string(input));
