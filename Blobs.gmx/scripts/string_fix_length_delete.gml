///string_fix_length_delete(string,length,trimside 'left' 'center' 'right');


var result=string(argument0);
var lenght_result=string_length(result);


lenght_result=string_length(result);
if lenght_result>argument1 //delete chars
{
switch(argument2)
{
case 'left': result=string_copy(result,(lenght_result-argument1+1),argument1); break;
case 'center': result=string_copy(result,round((lenght_result-argument1+1)/2),argument1); break;
case 'right': result=string_copy(result,1,argument1); break;
default: result=string_copy(result,1,argument1); break;
}
}

return(result);



