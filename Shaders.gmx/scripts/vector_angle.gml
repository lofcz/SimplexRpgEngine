/*
vector_angle(x,y,z,vx,vy,vz)
Finds the angle between two vectors in radians
*/
return arccos(dot_product3d(argument0,argument1,argument2,argument3,argument4,argument5)/sqrt(0.00001+(sqr(argument0)+sqr(argument1)+sqr(argument2))*(sqr(argument3)+sqr(argument4)+sqr(argument5))))