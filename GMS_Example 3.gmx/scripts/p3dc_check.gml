/*
P3DC (Precise 3D Collisions)
V6.00
----
NOTES:

Check for a collision between two 3d models; Both of which can move.
The model ID's are the ones returned from p3dc_begin_model() - ARGUMENTS SECTION

----
RETURNS:

returns (1): there is a collision
returns (0): no collision
returns (any other): Error. This is often caused by an incorrect amount
of vertexes/polygons added to the model (say 4 vertexes on a trianglelist)

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

*/
return external_call(global.p3dc_mcs,argument0,argument1,argument2,argument3,argument4,argument5,argument6,argument7);