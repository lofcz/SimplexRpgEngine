/*
P3DC (Precise 3D Collisions)
V6.00
----
NOTES:

This will check for a ray collision on the 3D model that has been split. The split
model should be the level. This is the *FASTEST* function in P3DC, because splitting
the model and calling the split functions uses an accelerated form of a QUADTREE for
collisions. This minimizes the ammount of triangles that need to be checked, up to 2500x
less. Recommended to use this function on the level


If the ray [X/Y] origin are not in the space defined with p3dc_split_model, then it will cause an unexpected error


----
ARGUMENTS:

Argument0: Ray x origin
Argument1: Ray y origin
Argument2: Ray y origin
[Arg3-5] Creates a vector that represent the rays direction
Argument3: Vector X component
Argument4: Vector Y component
Argument5: Vector Z component

----
Returns The distance to the *closest* triangle that was hit. Returns 10000000 if
no triangle was hit.
*/

return external_call(global.p3dc_mr3,argument0,argument1,argument2,argument3,argument4,argument5);