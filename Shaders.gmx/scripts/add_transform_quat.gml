/*
add_transform_quat(w,x,y,z)
Rotates the model towards a quaternion
Script created by TheSnidr
www.thesnidr.com
*/
angle = 2 * radtodeg(arccos(argument0));
s = sqrt(1-sqr(argument0)); // assuming quaternion normalised then w is less than 1, so term always positive.
if (s < 0.001) 
{ // test to avoid divide by zero, s is always positive due to sqrt
    // if s close to zero then direction of axis not important
    d3d_transform_add_rotation_axis(1, 0, 0, angle)
}
else
{
    d3d_transform_add_rotation_axis(argument1 / s, argument2 / s, argument3 / s, angle)
}