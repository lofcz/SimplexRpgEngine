/*
sphere_get_xyz(x,y)
Returns the coordinates on the surface of the sphere with radius pln_r from equirectangular coordinates.
*/
var xyang,zang;
xyang=-2*pi*argument0
zang=pi*argument1
xx=cos(xyang)*sin(zang)
yy=sin(xyang)*sin(zang)
zz=cos(zang)