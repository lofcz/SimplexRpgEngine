/*
line_plane_intersection(xfrom, yfrom, zfrom, xto, yto, zto, px, py, pz, nx, ny, nz)
(xfrom, yfrom, zfrom) is the coordinates of the camera
(px, py, pz) is a point in the plane you're checking
[nx, ny, nz] is the normal vector of the plane you're checking
*/
var t = (argument11 * argument5 + argument10 * argument4 + argument9 * argument3)
if t = 0 {return 0}
t = ((argument8 - argument2) * argument11 + (argument7 - argument1) * argument10 + (argument6 - argument0) * argument9) / t
if t <= 0 {return 0}
returnX = argument0 + argument3 * t
returnY = argument1 + argument4 * t
returnZ = argument2 + argument5 * t
returnDistance = t
return 1;