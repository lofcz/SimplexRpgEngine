/// @function lin(val1, val2, amount)
/// @desc Linear stationary inerpolation
/// @arg {int} val1 Start value
/// @arg {int} val2 End value
/// @arg {int} amount Amount of change 

var start, ending, difference;
start = argument0;
ending = argument1;
difference = argument2;

var result;

if (start < ending)
{
    result = min(start + difference, ending); 
}
else
{
    result = max(start - difference, ending);
}

return result;