/// scrEnemyAiAddAction(script, priority)

var s, p;
s = -1;
p = 0;

if (argument_count > 0) {s = argument[0];}
if (argument_count > 1) {p = argument[1];}

if (s != -1)
    {
     ds_priority_add(priorities, s, p);
    }
