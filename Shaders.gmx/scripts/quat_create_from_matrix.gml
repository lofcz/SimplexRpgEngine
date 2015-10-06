//quat_create_from_matrix(xup,yup,zup,xto,yto,zto)
//Returns the quaternion of the given matrix representation
//Only needs up and to vectors
var m11 = (argument3 * argument2 - argument5 * argument0)
var tr = argument3 + argument2 + m11
if (tr > 0) 
{ 
    var S = sqrt(tr + 1) * 2; // S=4*qw 
    qw = 0.25 * S;
    qx = (argument1 - argument4 * argument0 + argument3 * argument1) / S;
    qy = (argument5 - argument0) / S; 
    qz = (argument5 * argument1 - argument4 * argument2 - argument4) / S;
    exit;
} 
else if ((argument3 > m11)&(argument3 > argument2)) 
{
    var S = sqrt(1 + argument3 - m11 - argument2) * 2; // S=4*qx 
    qw = (argument1 - argument4 * argument0 + argument3 * argument1) / S;
    qx = 0.25 * S;
    qy = (argument4 + argument5 * argument1 - argument4 * argument2) / S; 
    qz = (argument5 + argument0) / S;
    exit;
} 
else if (m11 > argument2) 
{ 
    var S = sqrt(1 + m11 - argument3 - argument2) * 2; // S=4*qy
    qw = (argument5 - argument0) / S;
    qx = (argument4 + argument5 * argument1 - argument4 * argument2) / S; 
    qy = 0.25 * S;
    qz = (argument4 * argument0 - argument3 * argument1 + argument1) / S;
    exit; 
} 
else 
{ 
    var S = sqrt(1 + argument2 - argument3 - m11) * 2; // S=4*qz
    qw = (argument5 * argument1 - argument4 * argument2 - argument4) / S;
    qx = (argument5 + argument0) / S;
    qy = (argument4 * argument0 - argument3 * argument1 + argument1) / S;
    qz = 0.25 * S;
    exit;
}
/*
FULL SCRIPT (UNOPTIMIZED):
//quat_create_from_matrix(xup,yup,zup,xto,yto,zto)
//Returns the quaternion of the given matrix representation
//Only needs up and to vectors
var m00 = argument3
var m01 = argument4
var m02 = argument5
var m20 = argument0
var m21 = argument1
var m22 = argument2
var m10 = (argument5 * argument1 - argument4 * argument2)
var m11 = (argument3 * argument2 - argument5 * argument0)
var m12 = (argument4 * argument0 - argument3 * argument1)
var tr = m00 + m11 + m22
if (tr > 0) 
{ 
    var S = sqrt(tr + 1) * 2; // S=4*qw 
    qw = 0.25 * S;
    qx = (m21 - m12) / S;
    qy = (m02 - m20) / S; 
    qz = (m10 - m01) / S;
    exit;
} 
else if ((m00 > m11)&(m00 > m22)) 
{
    var S = sqrt(1 + m00 - m11 - m22) * 2; // S=4*qx 
    qw = (m21 - m12) / S;
    qx = 0.25 * S;
    qy = (m01 + m10) / S; 
    qz = (m02 + m20) / S;
    exit;
} 
else if (m11 > m22) 
{ 
    var S = sqrt(1 + m11 - m00 - m22) * 2; // S=4*qy
    qw = (m02 - m20) / S;
    qx = (m01 + m10) / S; 
    qy = 0.25 * S;
    qz = (m12 + m21) / S;
    exit; 
} 
else 
{ 
    var S = sqrt(1 + m22 - m00 - m11) * 2; // S=4*qz
    qw = (m10 - m01) / S;
    qx = (m02 + m20) / S;
    qy = (m12 + m21) / S;
    qz = 0.25 * S;
    exit;
}