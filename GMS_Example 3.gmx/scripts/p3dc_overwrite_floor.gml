/*
P3DC (Precise 3D Collisions)
V6.00
----
NOTES:

Overwrites a floor in a model.

Arg0: X1
Arg1: Y1
Arg2: Z1

Arg3: X2
Arg4: Y2
Arg5: Z2

----
Returns the TLID of the model.
This is rarely used from this point.

*/
return external_call(global.p3dc_opf,argument0,argument1,argument2,argument3,argument4,argument5);