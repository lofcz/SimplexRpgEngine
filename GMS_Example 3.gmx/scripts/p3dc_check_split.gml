/*
P3DC (Precise 3D Collisions)
V6.00
----
NOTES:

Check for a collision between a 3d model and the split model, which
SHOULD be the level model.

If the model [X/Y] origin are not in the space defined with p3dc_split_model, then it will cause an unexpected error

----
ARGUMENTS:

Arg0: model1 id
Arg1: model1 x
Arg2: model1 y
Arg3: model1 z

----
RETURNS:
1: if there is a collision
0: there is no collision
<Any other>: ERROR

*/
return external_call(global.p3dc_mc3,argument0,argument1,argument2,argument3);