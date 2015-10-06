//euler_create_from_matrix(xup, yup, zup, xto, yto, zto)
var xx;
xx=argument1*argument5-argument2*argument4
returnAngle2 = radtodeg(arcsin(median(xx, 1, -1)))
if abs(xx)>0.9999
{
    returnAngle1 = radtodeg(arctan2(argument5,argument2))
    returnAngle3 = 0
}
else
{
    returnAngle1 = radtodeg(arctan2(-argument0,argument3))
    returnAngle3 = radtodeg(arctan2(argument1*argument3-argument0*argument4,argument2*argument3-argument0*argument5))
}