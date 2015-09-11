/*
P3DC (Precise 3D Collisions)
V6.00
----
NOTES:

Returns a value from the last triangle hit
No error checking, so picking anything below 0 or above 12 will lead to an unexpected error

----
ARGUMENTS:

Arg0: Set this to a value between 0 and 12 -> 0:X1, 1:Y1, 2:Z1, 3:X2, 4:Y2, 5:Z2, 6:X3, 7:Y3, 8:Z3, 9:NX, 10:NY, 11:NZ, 12:Triangle ID

NX,NY,NZ are the normals of the triangle
Triangle ID is the triangle number (if it was the 5th triangle added, it'll return 5).
TriangleID will NOT be correct if you sort the model, because it moves all the polygons around.
The first 9 numbers (0-8) represent the vertexes of the triangle

*/
return external_call(global.p3dc_gtr,argument0);