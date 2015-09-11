/*
P3DC (Precise 3D Collisions)
V6.00
----
NOTES:

-Splits a model into many smaller ones to be collision checked. To be used with models that have an origin of [0,0,0].
-Only One model can be split at a time (Split the level)
-Make sure that WIDTH divided by X REGIONS turns out to be a whole number, or risk an unexpected error
-Make sure that HEIGHT divided by Y REGIONS turns out to be a whole number, or risk an unexpected error.
-Use the split collision checking for it to be optimized, and additionally you can return the collision model id of
part of the model with p3dc_get_splitid(...)

----
ARGUMENTS:

Arg0: Model to split
Arg1: Model Width (Positive whole number, make sure it's LARGER than the furthest away X value from [0,0,0])
Arg2: Model Height (Positive whole number, make sure it's LARGER than the furthest away Y value from [0,0,0])
Arg3: X Regions (The number of times to split the level across the X plane) - MAXIMUM OF 50 REGIONS
Arg4: Y Regions (The number of times to split the level across the Y plane) - MAXIMUM OF 50 REGIONS
Arg5: "Extra Space". This is the area/space that the regions will overlap each other with.

*/
return external_call(global.p3dc_bs3,argument0,argument1,argument2,argument3,argument4,argument5);