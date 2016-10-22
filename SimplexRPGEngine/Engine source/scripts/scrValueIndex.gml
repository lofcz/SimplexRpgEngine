/// scrvalueIndex(value)

var value, xc;
value = 1
xc = 0;

if (argument_count > 0) {value = argument[0];}
if (argument_count > 1) {xc    = argument[1];}

ret = value;

if (value >= 10000)
   {
     ret = string(value div 10000 + string("kk"));
     stack_index = 8; 

   }

else if (value >= 1000)
   {
     ret = string(value div 1000 + string("k"));
     stack_index = 7; 
   }
else if (value >= 500) {stack_index = 6;}
else if (value >= 250) {stack_index = 5;}
else if (value >= 100) {stack_index = 4;}
else if (value >= 50)  {stack_index = 3;}
else if (value >= 25)  {stack_index = 2;}
else if (value >= 10)  {stack_index = 1;}
else {stack_index = 0;}

clr(c_white, min(filterAlpha, 0.5));
fnt(fntPixelSmall);
draw_roundrect_ext(xx+17-(string_width(string(ret))/2),yy+16,xx+22+(string_width(string(ret))/2),yy+30,10,10,0);
clr(c_black, min(filterAlpha * 2, 1));
draw_text_colour(xx+17,yy+16,ret,c_dkgray,c_dkgray,c_dkgray,c_dkgray,1);
draw_text_colour(xx+16,yy+16,ret,c_black,c_black,c_black,c_black,1);
fnt(fntText);
