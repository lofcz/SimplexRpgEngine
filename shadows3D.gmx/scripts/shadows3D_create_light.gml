/// shadows3D_create_light(x,y,z,range,color)
/// x,y,z is position, range is the amount of units to light up.
var l = instance_create(argument0, argument1, global.shadows3D_lightObject);
l.z = argument2
l.range = argument3
l.color = argument4