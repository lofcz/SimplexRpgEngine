/// scrTrailSetUp(maxVerticles, width1, width2, color1, color2, alpha1, alpha2, xscatter, yscatter, xdrift, ydrift)

mv = 60;
w1 = 5;
w2 = 0;
c1 = c_black;
c2 = c_white;
a1 = 1;
a2 = 0;
xs = 1;
ys = 1;
xd = 1;
yd = 1;

if (argument_count > 0)  {mw = argument[0];}
if (argument_count > 1)  {w1 = argument[1];}
if (argument_count > 2)  {w2 = argument[2];}
if (argument_count > 3)  {c1 = argument[3];}
if (argument_count > 4)  {c2 = argument[4];}
if (argument_count > 5)  {a1 = argument[5];}
if (argument_count > 6)  {a2 = argument[6];}
if (argument_count > 7)  {xs = argument[7];}
if (argument_count > 8)  {ys = argument[8];}
if (argument_count > 9)  {xd = argument[9];}
if (argument_count > 10) {yd = argument[10];}

trail = scrTrailCreate(mw, x, y);

