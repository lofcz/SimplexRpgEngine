///string_linebreak(str,w)

var str, w, pos, cut,a;
str = argument0;
w = argument1;
pos = 0;
cut = 0;
a   = 1;

if string_width(str) <= w then return str;
else
{
while (string_count(" ",str) > 0)
    {
    pos = string_pos(" ", str);
    if string_width(string_copy(str,a,pos)) > w
        {
            str = string_replace(str, " ", "#"); 
          //  a += 40;
        }
    else
        str = string_replace(str," ","_");
        //a = 1;
    }
}
str = string_replace_all(str,"_"," ");
return str;