//normalize(x,y,z)
//Returns the unit vector with the same direction
returnLength=point_distance_3d(0,0,0,argument0,argument1,argument2)
if returnLength!=0
{
    returnX=argument0/returnLength
    returnY=argument1/returnLength
    returnZ=argument2/returnLength
    return returnLength;
}
returnX=0
returnY=0
returnZ=0
return 0;