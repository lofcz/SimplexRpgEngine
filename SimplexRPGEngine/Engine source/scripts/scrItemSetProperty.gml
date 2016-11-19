/// scrItemSetProperty(index, value, pointsValue)

var i, v, p;
i = 0;
v = 1;
p = 1;

if (argument_count > 0) {i = argument[0];}
if (argument_count > 1) {v = argument[1];}
if (argument_count > 2) {p = argument[2];}

vlastnost[i] = v;
points += (v * p);
