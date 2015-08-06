///string_get_argument(string,separator_char,position_0_to_N);

/* One of arguments stored in string separated by a defined character can be returned. Zero is first.

Example:
days = 'monday,tuesday,wednesday,thursday,friday';   //sample string
Odin_s_day = get_argument( days,',',2);              //Odin_s_day will be 'wednesday'
 
*/ 



var _str=argument0;         //input string
var _sep=argument1;         //separator
var _pos=argument2;         //position

//temp variables
var separator_counter=0;
var ch='';
var output_string='';

//main loop
for(i=1;i<=string_length(_str);i++)
{
ch=string_char_at(_str,i);             //get a char

if (ch==_sep) 
  { separator_counter++; }   //recognize separator and count its number
 else
  {
    if separator_counter==_pos { output_string+=ch; } //another chars can be returned if position meets
  }
}

return(output_string);