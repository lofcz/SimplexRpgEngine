/// @description Insert description here
// You can write your code in this editor
/// Set up

resolution = shader_get_uniform(shdPerlinNoise, "iResolution");
time       = shader_get_uniform(shdPerlinNoise, "time"); 
strenght   = shader_get_uniform(shdPerlinNoise, "strenght"); 

strenghtVal = 5;
timeOffset = 0;
timeVal = 0;