/// mouse_in(min_x,max_x,min_y,max_y)

min_x = 0;
min_y = 0;
max_x = 0;
max_y = 0;

if (argument_count > 0) {min_x = argument[0];}
if (argument_count > 1) {max_x = argument[1];}
if (argument_count > 2) {min_y = argument[2];}
if (argument_count > 3) {max_y = argument[3];}

if (mouse_x > min_x && mouse_x < max_x && mouse_y > min_y && mouse_y < max_y)
   {
    return true;
   }
   
return false;
