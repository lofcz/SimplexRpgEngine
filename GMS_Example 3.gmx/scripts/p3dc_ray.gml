/*
P3DC (Precise 3D Collisions)
V6.00
----
NOTES:

Check for a collision between a ray(3d vector) and a 3d model.

----
ARGUMENTS:

Arg0: model ID
Arg1: model X
Arg2: model Y
Arg3: model Z
Arg4: Ray x origin
Arg5: Ray y origin
Arg6: Ray y origin
[Arg7-9] Creates a vector that represent the rays direction
Arg7: Vector X component
Arg8: Vector Y component
Arg9: Vector Z component

----
The distance to the *closest* triangle that was hit. Returns 10000000 if no triangle was hit.
*/
return external_call(global.p3dc_mrs,argument0,argument1,argument2,argument3,argument4,argument5,argument6,argument7,argument8,argument9);