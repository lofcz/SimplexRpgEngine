/// libUtilityBuildCollision(source, shiftX, shiftY)

var a;

//show_message("xs:"+string(argument1)+"ys"+string(argument2));
if (argument1 > 0)
{
	a = [argument0[0], argument0[1], argument0[2] + argument1, argument0[3]];
	return a;
}
if (argument1 < 0)
{
	a = [argument0[0] + argument1, argument0[1], argument0[2], argument0[3]]
	return a;
}
if (argument2 > 0)
{
	a = [argument0[0], argument0[1], argument0[2], argument0[3] + argument2]
	return a;
}
if (argument2 < 0)
{
	a = [argument0[0], argument0[1] + argument2, argument0[2], argument0[3]]
	return a;
}

a = [argument0[0], argument0[1], argument0[2], argument0[3]];
return a;