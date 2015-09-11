/*
P3DC (Precise 3D Collisions)
V6.00
----
NOTES:

Check for a collision between two 3d models; Model two can not move. If the model is static it is HIGHLY
recommended to add it to the level model that gets split. Split functions preform a lot faster than a still
check, and they'll do the same thing.

----
ARGUMENTS:

Arg0: model1 id
Arg1: model1 x
Arg2: model1 y
Arg3: model1 z
Arg4: model2 id

*/
return p3dc_check(argument0,argument1,argument2,argument3,argument4,0,0,0);