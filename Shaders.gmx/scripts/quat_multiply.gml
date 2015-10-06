/* 
quat_multiply(aw,ax,ay,az,bw,bx,by,bz)
    Arguments:
        0 r0
        1 r1
        2 r2
        3 r3
        4 s0
        5 s1
        6 s2
        7 s3
    Returns:
        multiply two quaternions r and s
        arguments are real,i,j,k,real2,i2,j2,k2
        result is returned in variables qw, qx, qy, qz.
        note that the order of the two quaternions is very
        important. multiplyQuaternion(s,r) is not the same as
        multiplyQuaternion(r,s)
*/
qw = argument0 * argument4 - argument1 * argument5 - argument2 * argument6 - argument3 * argument7;
qx = argument0 * argument5 + argument1 * argument4 + argument2 * argument7 - argument3 * argument6;
qy = argument0 * argument6 + argument2 * argument4 + argument3 * argument5 - argument1 * argument7;
qz = argument0 * argument7 + argument3 * argument4 + argument1 * argument6 - argument2 * argument5;
rm=max(sqrt(sqr(qw)+sqr(qx)+sqr(qy)+sqr(qz)),0.00001)
qw /= rm
qx /= rm
qy /= rm
qz /= rm