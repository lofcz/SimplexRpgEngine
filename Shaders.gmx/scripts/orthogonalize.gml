/*
orthogonalize(vx,vy,vz,x,y,z)
Makes a unit vector from [x,y,z] that is orthogonal to [vx,vy,vz]
*/
var l;
l=argument0*argument3+argument1*argument4+argument2*argument5
normalize(argument3-argument0*l,argument4-argument1*l,argument5-argument2*l)