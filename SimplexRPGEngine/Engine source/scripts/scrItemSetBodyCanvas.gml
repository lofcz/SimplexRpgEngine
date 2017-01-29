/// scrItemSetBodyCanvas(index, walkAnimation, attackAnimation, shootAnimation, dieAnimation, bashAnimation, thrustAnimation)

var i, w, a, s, d, b, t;
w = 0;
a = 0;
i = 0;
s = 0;
d = 0;
b = 0;
t = 0;

if (argument_count > 0) {i = argument[0];}
if (argument_count > 1) {w = argument[1];}
if (argument_count > 2) {a = argument[2];}
if (argument_count > 3) {s = argument[3];}
if (argument_count > 4) {d = argument[4];}
if (argument_count > 5) {b = argument[5];}
if (argument_count > 6) {t = argument[6];}


vlastnost[vlastnost_bodyCanvasIndex]        = i;
vlastnost[vlastnost_bodyCanvasSlashSprite]  = a;
vlastnost[vlastnost_bodyCanvasSprite]       = w;
vlastnost[vlastnost_bodyCanvasFireSprite]   = s;    
vlastnost[vlastnost_bodyCanvasDieSprite]    = d;    
vlastnost[vlastnost_bodyCanvasBashSprite]   = b;    
vlastnost[vlastnost_bodyCanvasThrustSprite] = t;    

