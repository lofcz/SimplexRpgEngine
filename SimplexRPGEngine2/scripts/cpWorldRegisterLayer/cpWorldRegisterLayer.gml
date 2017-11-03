/// @function cpWorldRegisterLayer(layerName, layerSprite, layerData)
/// @desc Registers tile layer into map data
/// @arg {string} layerName Name of layer
/// @arg {sprite} layerSprite Sprite source of layer [not tileset index]
/// @arg {array} layerData Use cpWorldLayerDataFile() or cpWorldLayerDataString() to get this

v_layerData[v_currentLayer, 0] = argument[0];
v_layerData[v_currentLayer, 1] = argument[1];
v_layerData[v_currentLayer, 2] = argument[2];

/*
for (var i = 2; i < array_length_1d(argument[2]); i++)
{
	v_layerData[v_currentLayer, 2 + i] = argument[i];	
}*/

v_currentLayer++;