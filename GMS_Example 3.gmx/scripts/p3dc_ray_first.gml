/*
P3DC (Precise 3D Collisions)
V6.00
----
NOTES:

*Make sure you call p3dc_sort_model(); before using this. It is the fastest ray check available in p3dc
*This will not always work if you have triangles that stick through each other
*Check for a collision between a ray(3d vector) and a 3d model, 3D model does not move (read below to see how
to use it on models that move)

*This can be used to simply check if 2 objects can see each other, or simply if when you shoot you hit a
bot.

----
ARGUMENTS:

Argument0 - model id
Argument1 - Ray x origin
Argument2 - Ray y origin
Argument3 - Ray y origin
[Arg4-6] Creates a vector that represent the rays direction
Argument4 - Vector X component
Argument5 - Vector Y component
Argument6 - Vector Z component

----
RETURNS:

The distance to the *first* triangle that was hit, not necessarily the closest. Returns 10000000 if no triangle was hit.

*/
return external_call(global.p3dc_mrf,argument0,argument1,argument2,argument3,argument4,argument5,argument6);