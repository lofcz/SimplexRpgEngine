/// dialogueParse(string)

var a, f, input;
input = "";
ret   = string_length(input)
f     = 0;

if (argument_count > 0) {input = argument[0];}

str   = input;

for(a = 1; a < string_length(str); a++)
    {
     help_text = string_copy(input,a,1); 
     
     if (help_text = "[") {f = 1; input = string_delete(input,a,1);}

     pos = a;
     str = input

     while(f)
        {
         help_text = string_copy(str,a,1); 
         
         if (help_text = "]") {f = 0; }
         input = string_delete(input,a,1);
         str = input
        } 
            
     if (pos < string_length(input)) {pos += 1;}
    }
    
return (string(input));
