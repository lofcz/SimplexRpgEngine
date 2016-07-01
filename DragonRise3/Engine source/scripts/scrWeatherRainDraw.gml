/// scrWeatherRainDraw(length)

var length;
length = 2;

if (argument_count > 0) {length = argument[0];}

clr(c_gray, 0.6);
vectorx = (x-(view_xview+view_wview/2))/(view_wview/2);
vectory = (y-(view_yview+view_hview/2))/(view_hview/2);
draw_line_width(x+vectorx*sqr(height) ,y+vectory*sqr(height), x+vectorx*sqr(height+length),y+vectory*sqr(height+length),2);
clr();
