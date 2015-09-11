/*
P3DC (Precise 3D Collisions)
V6.00
----
NOTES:

Check for a collision between a ray(3d vector) and a 3d model that doesn't move.

----
ARGUMENTS:

Arg0: model ID
Arg1: Ray x origin
Arg2: Ray y origin
Arg3: Ray y origin
[Arg4-6] Creates a vector that represent the rays direction
Arg4: Vector X component
Arg5: Vector Y component
Arg6: Vector Z component

----
Returns the distance to the *closest* triangle that was hit. Returns 10000000 if no triangle was hit.
*/
return p3dc_ray(argument0,0,0,0,argument1,argument2,argument3,argument4,argument5,argument6);