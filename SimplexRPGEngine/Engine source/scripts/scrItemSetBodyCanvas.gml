/// scrItemSetBodyCanvas(index, walkAnimation, attackAnimation, shootAnimation, dieAnimation)

var i, w, a, s, d;
w = 0;
a = 0;
i = 0;
s = 0;
d = 0;

if (argument_count > 0) {i = argument[0];}
if (argument_count > 1) {w = argument[1];}
if (argument_count > 2) {a = argument[2];}
if (argument_count > 3) {s = argument[3];}
if (argument_count > 4) {d = argument[4];}


vlastnost[vlastnost_bodyCanvasIndex]       = i;
vlastnost[vlastnost_bodyCanvasSlashSprite] = a;
vlastnost[vlastnost_bodyCanvasSprite]      = w;
vlastnost[vlastnost_bodyCanvasFireSprite]  = s;    
vlastnost[vlastnost_bodyCanvasDieSprite]   = d;    

