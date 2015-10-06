/*
subtract_transform(xup,yup,zup,xto,yto,zto)
Rotates the model towards two perpendicular unit vectors.
*/
var xx,attitude,bank,heading;
xx=argument1*argument5-argument2*argument4
attitude = arcsin(median(xx, 1, -1))
if abs(xx) > 0.9999
{
    heading = arctan2(argument5, argument2)
    bank = 0
}
else
{
    heading = arctan2(-argument0, argument3)
    bank = arctan2(argument1 * argument3 - argument0 * argument4, argument2 * argument3 - argument0 * argument5)
}
d3d_transform_add_rotation_x(-radtodeg(bank))
d3d_transform_add_rotation_z(-radtodeg(attitude))
d3d_transform_add_rotation_y(-radtodeg(heading))