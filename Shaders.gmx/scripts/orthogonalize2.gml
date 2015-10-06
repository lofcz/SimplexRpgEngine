/*
orthogonalize2(vx,vy,vz,x,y,z)
Makes a vector from [x,y,z] that is orthogonal to [vx,vy,vz]
Does cross product twice and returns the resulting vector
*/
var l;
l=argument0*argument3+argument1*argument4+argument2*argument5
returnX=argument3-argument0*l
returnY=argument4-argument1*l
returnZ=argument5-argument2*l