/*
P3DC (Precise 3D Collisions)
V6.00
----
NOTES:

No error checking so picking a spot not in the included region (defined in p3dc_split_model) will cause an unexpected error
This can be used to check for rotated checks on the split level (rotated player) - look at the example below to see how

----
ARGUMENTS:

Arg0: X
Arg1: Y

----
Returns the id of the split model at X,Y 
*/
return external_call(global.p3dc_gms,argument0,argument1);