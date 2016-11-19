/// scrItemSetBodyCanvas(index, walkAnimation, attackAnimation)

var i, w, a;
w = 0;
a = 0;
i = 0;

if (argument_count > 0) {i = argument[0];}
if (argument_count > 1) {w = argument[1];}
if (argument_count > 2) {a = argument[2];}

if (w != 0 && a != 0)
   {
    vlastnost[vlastnost_bodyCanvasIndex]       = i;
    vlastnost[vlastnost_bodyCanvasSlashSprite] = a;
    vlastnost[vlastnost_bodyCanvasSprite]      = w;
   }

