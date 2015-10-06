/// shadows3D_init(shadowmapsize, screenwidth, screenheight, lightobject)
/// Startup scripts for shadows. The higher shadow map size, the better detail, but more RAM is required.
/// lightobject is an empty dummy object for storing lights, it has the variables x,y,z,range,color.

global.shadows3D_worldAmbient = 0;
global.shadows3D_shadowMapSize = argument0
global.shadows3D_screenWidth = argument1
global.shadows3D_screenHeight = argument2
global.shadows3D_shadowMapXp = surface_create(global.shadows3D_shadowMapSize, global.shadows3D_shadowMapSize)
global.shadows3D_shadowMapXn = surface_create(global.shadows3D_shadowMapSize, global.shadows3D_shadowMapSize)
global.shadows3D_shadowMapYp = surface_create(global.shadows3D_shadowMapSize, global.shadows3D_shadowMapSize)
global.shadows3D_shadowMapYn = surface_create(global.shadows3D_shadowMapSize, global.shadows3D_shadowMapSize)
global.shadows3D_shadowMapZp = surface_create(global.shadows3D_shadowMapSize, global.shadows3D_shadowMapSize)
global.shadows3D_shadowMapZn = surface_create(global.shadows3D_shadowMapSize, global.shadows3D_shadowMapSize)
global.shadows3D_tempLightMap = surface_create(global.shadows3D_screenWidth, global.shadows3D_screenHeight)
global.shadows3D_finalLightMap = surface_create(global.shadows3D_screenWidth, global.shadows3D_screenHeight)
global.shadows3D_lightObject = argument3

// Uniforms
global.shadows3D_uniform_shadowMap_lightPosition = shader_get_uniform(shdr_shadows3D_shadowmap, "lightPosition")
global.shadows3D_uniform_shadowMap_lightRange = shader_get_uniform(shdr_shadows3D_shadowmap, "lightRange")
global.shadows3D_uniform_lightPosition = shader_get_uniform(shdr_shadows3D,"lightPosition")
global.shadows3D_uniform_lightRange = shader_get_uniform(shdr_shadows3D,"lightRange")
global.shadows3D_uniform_lightColor = shader_get_uniform(shdr_shadows3D,"lightColor")
global.shadows3D_uniform_worldAmbient = shader_get_uniform(shdr_shadows3D,"worldAmbient")
global.shadows3D_uniform_shadowMapSize = shader_get_uniform(shdr_shadows3D,"shadowMapSize")