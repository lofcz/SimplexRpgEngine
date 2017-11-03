/// @function cpWorldLayerDataFile(file)
/// @desc Gets layer data from file
/// @arg {file} file File to use

#macro mcLayerOptions 4

enum e_layerOptions
{
	canBeAttacked,
	canBeDestroyed,
	dropExp,
	maskSolid
}

var tmp_array, tmp_output;
tmp_array = libUtilityReadFile(argument0);

for (var i = 0; i < mcLayerOptions; i++)
{
	tmp_output[i] = 0;	
}

for (var i = 0; i < array_length_1d(tmp_array); i++)
{
	var tmp_line;
	tmp_line = tmp_array[i];

	if (string_count("can-attack", tmp_line))	 {tmp_output[e_layerOptions.canBeAttacked]  = true;}
	if (string_count("can-destroy", tmp_line))	 {tmp_output[e_layerOptions.canBeDestroyed] = true;}
	if (string_count("drop-exp-auto", tmp_line)) {tmp_output[e_layerOptions.dropExp]        = true;}
	if (string_count("mask-solid-basic", tmp_line)) {tmp_output[e_layerOptions.maskSolid]   = true;}
}

return tmp_output;