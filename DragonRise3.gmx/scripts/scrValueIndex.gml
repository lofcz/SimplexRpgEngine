/// scrvalueIndex(value)


value = 1
xc = 0;

if (argument_count > 0) {value = argument[0];}
if (argument_count > 1) {xc    = argument[1];}

ret = value;

if (value >= 10000)
   {
     ret = string(value div 10000+string("kk"));
     stack_index = 8; 

   }

else if (value >= 1000)
   {
     ret = string(value div 1000+string("k"));
     stack_index = 7; 
   }
else if (value >= 500) {stack_index = 6;}
else if (value >= 250) {stack_index = 5;}
else if (value >= 100) {stack_index = 4;}
else if (value >= 50)  {stack_index = 3;}
else if (value >= 25)  {stack_index = 2;}
else if (value >= 10)  {stack_index = 1;}
else {stack_index = 0;}

//draw_set_font(fntRetroSmall);
//draw_rectangle_colour(xx+16,yy+16,xx+32,yy+32,c_gray,c_gray,c_gray,c_gray,0);
draw_text_colour(xx+17,yy+16,ret,c_dkgray,c_dkgray,c_dkgray,c_dkgray,1);
draw_text_colour(xx+16,yy+16,ret,c_black,c_black,c_black,c_black,1);
draw_set_font(fntText);
//slot[xc,inv_sprite_number] = stack_index;
