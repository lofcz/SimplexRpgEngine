/*
    Arguments:
        0 qw quaternion
        1 qx
        2 qy
        3 qz
    Returns:
        scales the quaternion to a length of one
        sets rm to the length
*/
var rm;
rm=max(sqrt(sqr(argument0)+sqr(argument1)+sqr(argument2)+sqr(argument3)),0.00001)
qw=argument0/rm
qx=argument1/rm
qy=argument2/rm
qz=argument3/rm