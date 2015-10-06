/*
add_transform_up(xup,yup,zup)
Rotates the model towards an up-vector (neglecting the to-vector)
Script created by TheSnidr
www.thesnidr.com
*/
d3d_transform_add_rotation_axis(argument1+(abs(argument2)>0.9999),-argument0,0,radtodeg(arccos(median(argument2, -1, 1))))