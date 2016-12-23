/// scrvalueIndex(value)

var value;
value = 1;

if (argument_count > 0) {value = argument[0];}

ret = value;

if (value >= 10000) {ret = string(value div 10000 + string("kk"));}
else if (value >= 1000) {ret = string(value div 1000 + string("k"));}

clr(c_white, min(fAlpha, 0.5));
fnt(fntPixelSmall);
draw_roundrect_ext(xx+17-(string_width(string(ret))/2),yy+16,xx+22+(string_width(string(ret))/2),yy+30,10,10,0);
clr(c_black, min(filterAlpha * 2, 1));
draw_text_colour(xx+22-(string_width(string(ret))/2),yy+14,ret,c_dkgray,c_dkgray,c_dkgray,c_dkgray,min(fAlpha * 2, 1));
draw_text_colour(xx+21-(string_width(string(ret))/2),yy+14,ret,c_black,c_black,c_black,c_black,min(fAlpha * 2, 1));
fnt(fntText);
