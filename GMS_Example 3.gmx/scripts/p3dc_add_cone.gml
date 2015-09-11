/*
P3DC (Precise 3D Collisions)
V6.00
----
NOTES:

Adds a cone to the current model; Current model is returned by the last called p3dc_begin_model();
Same arguments for d3d_draw_cone(x1,y1,z1,x2,y2,z2,closed,steps);

----
ARGUMENTS:

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
Returns the triangle location identifier (Triangle LID).
Only used for overwriting models after they've been created.
*/
return external_call(global.p3dc_apo,argument0,argument1,argument2,argument3,argument4,argument5,argument6,argument7);