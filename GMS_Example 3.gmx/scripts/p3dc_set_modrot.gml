/*
P3DC (Precise 3D Collisions)
V6.00
----
NOTES:

Sets the rotation of Model (1 or 2) to be used with:
p3dc_check_rotation(<...>); and p3dc_ray_rotation(<...>);

----


[Arg0-2]: Creates a vector that represent the models rotation
Arg0: Vector X component
Arg1: Vector Y component
Arg2: Vector Z component

----
Returns true
*/
//return external_call(global.p3dc_smr,argument0,argument1,argument2);
return external_call(global.p3dc_mrr,argument0,argument1,argument2,argument3,argument4,argument5,argument6,argument7,argument8,argument9);