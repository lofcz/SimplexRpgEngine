/*
P3DC (Precise 3D Collisions)
V6.00
----
Check for a collision between two 3d models; Both of which can move.

----
RETURNS:

returns (1): there is a collision
returns (0): no collision
returns (any other): Error

----
ARGUMENTS:

Arg0: model1 id
Arg1: model1 x
Arg2: model1 y
Arg3: model1 z
Arg4: model2 id
Arg5: model2 x
Arg6: model2 y
Arg7: model2 z
[Arg8-10] Creates a vector that represent the model 1's rotation
Arg8: Vector X component
Arg9: Vector Y component
Arg10: Vector Z component
...For the vector that represents model2's rotation use p3dc_set_modrot(<...>);

*/
return external_call(global.p3dc_mcr,argument0,argument1,argument2,argument3,argument4,argument5,argument6,argument7,argument8,argument9,argument10);