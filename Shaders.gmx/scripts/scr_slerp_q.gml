//scr_slerp_q( x1 , y1 , z1 , w1 , x2 , y2 , z2 , w2 , ratio )
/*
Returns the quaternion between Q1 and Q2 with the given ratio under the variables q3x,q3y,q3z,q3w.
*/
var q1x,q1y,q1z,q1w,q2x,q2y,q2z,q2w,
cosHalfTheta;
q1x = argument0;
q1y = argument1;
q1z = argument2;
q1w = argument3;
q2x = argument4;
q2y = argument5;
q2z = argument6;
q2w = argument7;
cosHalfTheta = q1w*q2w + q1x*q2x + q1y*q2y + q1z*q2z;
if (cosHalfTheta < 0)
{
q2w = -q2w; q2x = -q2x; q2y = -q2y; q2z = q2z;
cosHalfTheta = -cosHalfTheta;
}
if (abs(cosHalfTheta) >= 1.0)
{
q3w = q1w; q3x = q1x; q3y = q1y; q3z = q1z;
return 1; //Caps tween
}
var halfTheta,sinHalfTheta;
halfTheta = arccos(cosHalfTheta);
sinHalfTheta = sqrt(1.0 - cosHalfTheta*cosHalfTheta);
if ( abs(sinHalfTheta) < 0.001)
{
q3w = (q1w * 0.5 + q2w * 0.5);
q3x = (q1x * 0.5 + q2x * 0.5);
q3y = (q1y * 0.5 + q2y * 0.5);
q3z = (q1z * 0.5 + q2z * 0.5);
return 1;
}
var ratioA,ratioB;
ratioA = sin((1 - argument8) * halfTheta) / sinHalfTheta;
ratioB = sin(argument8 * halfTheta) / sinHalfTheta;
//calculate Quaternion.
q3w = (q1w * ratioA + q2w * ratioB);
q3x = (q1x * ratioA + q2x * ratioB);
q3y = (q1y * ratioA + q2y * ratioB);
q3z = (q1z * ratioA + q2z * ratioB);
return 1;