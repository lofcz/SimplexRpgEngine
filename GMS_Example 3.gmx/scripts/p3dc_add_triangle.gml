/*
P3DC (Precise 3D Collisions)
V6.00
----
NOTES:

Add a polygon to the current model; Current model is returned by the last called begin_define_model();

----
ARGUMENTS:

Arg0: Point1 X
Arg1: Point1 Y
Arg2: Point1 Z

Arg3: Point2 X
Arg4: Point2 Y
Arg5: Point2 Z

Arg6: Point3 X
Arg7: Point3 Y
Arg8: Point3 Z

----
RETURNS:

Returns the triangle location identifier (Triangle LID).
Only used for overwriting models after they've been created.

*/
return external_call(global.p3dc_mat,argument0,argument1,argument2,argument3,argument4,argument5,argument6,argument7,argument8);