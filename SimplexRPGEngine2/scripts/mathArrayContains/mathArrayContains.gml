/// @function mathArrayContains(array, value)
/// @desc Checks if target array contains specific value
/// @arg {array} array Target array
/// @arg {any} value Value to search for

var tmp_array, tmp_value;
tmp_array = -1;
tmp_value = 1;

if (argument_count > 0) {tmp_array = argument[0];}
if (argument_count > 1) {tmp_value = argument[1];}

if (tmp_array == -1) {return -1;}

for (var i = 0; i < array_length_1d(tmp_array); i++)
{
	if (tmp_array[i] == tmp_value) 
	{
		return true;
	}
}

return false;
