/*
P3DC (Precise 3D Collisions)
V6.00
----
Overwrites a cone in a model. You should NEVER change the amount of
steps around it, or the closed argument. Maintain the same amount of
polygons in the cylinder.

Arg0: X1
Arg1: Y1
Arg2: Z1

Arg3: X2
Arg4: Y2
Arg5: Z2

Arg6: Closed
Arg7: Steps

----
RETURNS:
Returns the TLID of the model.
This is rarely used from this point.
*/
return external_call(global.p3dc_opo,argument0,argument1,argument2,argument3,argument4,argument5,argument6,argument7);