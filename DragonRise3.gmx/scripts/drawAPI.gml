#define drawAPI
/// drawAPI()
/*

- draw_hover_block(x1,x2,y1,y2,color,alpha)
  
  Used to easily draw rectangle over target area, default is
  yellow rectangle with 0.6 alpha. 
  
- 






















#define draw_hover_block
/// draw_hover_block(x1,x2,y1,y2,color,alpha)

x1 = 0;
x2 = 0;
y1 = 0;
y2 = 0;

color = c_yellow;
alpha = 0.6;

if (argument_count > 0) {x1 = argument[0];}
if (argument_count > 1) {x2 = argument[1];}
if (argument_count > 2) {y1 = argument[2];}
if (argument_count > 3) {y2 = argument[3];}

if (argument_count > 4) {color = argument[4];}
if (argument_count > 5) {alpha = argument[5];}



clr(color,alpha);
draw_rectangle(x1,y1,x2-1,y2-1,0);
clr();