/// scrCollectibleDefine(type, index, caption, body, footer, imageIndex)

var i, c, b, f, t, I;
i = 0;
c = "";
b = "";
f = "";
t = collectibleEnum.item;
I = 86;

if (argument_count > 0) {t = argument[0];}
if (argument_count > 1) {i = argument[1];}
if (argument_count > 2) {c = argument[2];}
if (argument_count > 3) {b = argument[3];}
if (argument_count > 4) {f = argument[4];}
if (argument_count > 5) {I = argument[5];}

oStatusMenu.collectibleCaption[t, i] = c;
oStatusMenu.collectibleText[t, i]    = scrWordwrap(b, 700, fntPixel);
oStatusMenu.collectibleFooter[t, i]  = f;
oStatusMenu.collectibleIndex[t, i]   = I;

