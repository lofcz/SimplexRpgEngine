/// scrItemSetBodyCanvas(index, walkAnimation, attackAnimation, shootAnimation)

var i, w, a, s;
w = 0;
a = 0;
i = 0;
s = 0;

if (argument_count > 0) {i = argument[0];}
if (argument_count > 1) {w = argument[1];}
if (argument_count > 2) {a = argument[2];}
if (argument_count > 3) {s = argument[3];}

if (w != 0 && a != 0 && s != 0)
   {
    vlastnost[vlastnost_bodyCanvasIndex]       = i;
    vlastnost[vlastnost_bodyCanvasSlashSprite] = a;
    vlastnost[vlastnost_bodyCanvasSprite]      = w;
    vlastnost[vlastnost_bodyCanvasFireSprite]  = s;    
   }

