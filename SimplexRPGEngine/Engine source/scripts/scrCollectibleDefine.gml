/// scrCollectibleDefine(type, index, caption, body, footer)

var i, c, b, f, t;
i = 0;
c = "";
b = "";
f = "";
t = collectibleEnum.item;

if (argument_count > 0) {t = argument[0];}
if (argument_count > 1) {i = argument[1];}
if (argument_count > 2) {c = argument[2];}
if (argument_count > 3) {b = argument[3];}
if (argument_count > 4) {f = argument[4];}

oStatusMenu.collectibleCaption[t, i] = c;
oStatusMenu.collectibleText[t, i]    = scrWordwrap(b, 700, fntPixel);
oStatusMenu.collectibleFooter[t, i]  = f;

