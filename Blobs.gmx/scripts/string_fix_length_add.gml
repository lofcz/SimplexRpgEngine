///string_fix_length_add(string,length,trimside 'left' 'center' 'right',char);


var result=string(argument0);
var lenght_result=string_length(result);
var side_right=true;

while lenght_result<argument1 //add chars
{
switch(argument2)
{
case 'left': result=argument3+result; break;
case 'center': 
if side_right==true { result+=argument3; } else { result=argument3+result;  }
side_right=!side_right;
break;
case 'right': result+=argument3; break;

default: result+=argument3; break;
}
lenght_result=string_length(result);
}

return(result);
