///string_trim_pixel_width(string,pixel_width)

//cuts a string at pixel_width

var result='';

var i=1;
while(string_width(result+string_char_at(argument0,i))<argument1) && ( i<string_length(argument0)+1)
{
result+=string_char_at(argument0,i);
i++;
}

return(result);

