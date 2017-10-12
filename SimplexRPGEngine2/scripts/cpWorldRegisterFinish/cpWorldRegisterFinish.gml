/// @function cpWorldRegisterFinish()
/// @desc Finishes initialization of the world

var inst = instance_create_depth(0, 0, -900, oTilesHandler);
for (var i = 0; i < v_currentLayer; i++)
{
	for (var j = 0; j < array_length_2d(v_layerData, i); j++)
	{
		inst.v_data[i, j] = v_layerData[i, j];	
	}
}

inst.v_layers = v_currentLayer;