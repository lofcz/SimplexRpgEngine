/// shadows3D_draw(script,projection...)
/// Executes the given script with shadows added. The other arguments are for the camera projection (d3d_set_projection_ext)

var i, lights, firstLight;
lights = instance_number(global.shadows3D_lightObject)
firstLight = instance_find(global.shadows3D_lightObject, 0)

for (i = 0; i < lights; i++) {
    var l = instance_find(global.shadows3D_lightObject, i)
    
    // Update shadow maps
    shader_set(shdr_shadows3D_shadowmap)
    shader_set_uniform_f(global.shadows3D_uniform_shadowMap_lightPosition, l.x, l.y, l.z)
    shader_set_uniform_f(global.shadows3D_uniform_shadowMap_lightRange, l.range)
    
    // X+
    surface_set_target(global.shadows3D_shadowMapXp)
    draw_clear(c_white)
    d3d_set_projection_ext(l.x, l.y, l.z, l.x + 1, l.y, l.z, 0, 0, 1, 90, 1, 0.1, l.range)
    script_execute(argument0)
    surface_reset_target()
    
    // X-
    surface_set_target(global.shadows3D_shadowMapXn)
    draw_clear(c_white)
    d3d_set_projection_ext(l.x, l.y, l.z, l.x - 1, l.y, l.z, 0, 0, 1, 90, 1, 0.1, l.range)
    script_execute(argument0)
    surface_reset_target()
    
    // Y+
    surface_set_target(global.shadows3D_shadowMapYp)
    draw_clear(c_white)
    d3d_set_projection_ext(l.x, l.y, l.z, l.x, l.y + 1, l.z, 0, 0, 1, 90, 1, 0.1, l.range)
    script_execute(argument0)
    surface_reset_target()
    
    // Y-
    surface_set_target(global.shadows3D_shadowMapYn)
    draw_clear(c_white)
    d3d_set_projection_ext(l.x, l.y, l.z, l.x, l.y - 1, l.z, 0, 0, 1, 90, 1, 0.1, l.range)
    script_execute(argument0)
    surface_reset_target()
    
    // Z+
    surface_set_target(global.shadows3D_shadowMapZp)
    draw_clear(c_white)
    d3d_set_projection_ext(l.x, l.y, l.z, l.x + 0.0001, l.y, l.z + 1, 0, 0, 1, 90, 1, 0.1, l.range)
    script_execute(argument0)
    surface_reset_target()
    
    // Z-
    surface_set_target(global.shadows3D_shadowMapZn)
    draw_clear(c_white)
    d3d_set_projection_ext(l.x, l.y, l.z, l.x + 0.0001, l.y, l.z - 1, 0, 0, 1, 90, 1, 0.1, l.range)
    script_execute(argument0)
    surface_reset_target()
    
    shader_reset()
    
    // Create lightmap
    shader_set(shdr_shadows3D)
    shader_set_uniform_f(global.shadows3D_uniform_lightPosition, l.x, l.y, l.z)
    shader_set_uniform_f(global.shadows3D_uniform_lightRange, l.range)
    shader_set_uniform_f(global.shadows3D_uniform_lightColor, color_get_red(l.color) / 255, color_get_green(l.color) / 255, color_get_blue(l.color) / 255)
    shader_set_uniform_f(global.shadows3D_uniform_shadowMapSize, global.shadows3D_shadowMapSize)
    texture_set_stage(shader_get_sampler_index(shdr_shadows3D, "shadowMapXp"), surface_get_texture(global.shadows3D_shadowMapXp))
    texture_set_stage(shader_get_sampler_index(shdr_shadows3D, "shadowMapXn"), surface_get_texture(global.shadows3D_shadowMapXn))
    texture_set_stage(shader_get_sampler_index(shdr_shadows3D, "shadowMapYp"), surface_get_texture(global.shadows3D_shadowMapYp))
    texture_set_stage(shader_get_sampler_index(shdr_shadows3D, "shadowMapYn"), surface_get_texture(global.shadows3D_shadowMapYn))
    texture_set_stage(shader_get_sampler_index(shdr_shadows3D, "shadowMapZp"), surface_get_texture(global.shadows3D_shadowMapZp))
    texture_set_stage(shader_get_sampler_index(shdr_shadows3D, "shadowMapZn"), surface_get_texture(global.shadows3D_shadowMapZn))
    shader_set_uniform_f(global.shadows3D_uniform_worldAmbient, global.shadows3D_worldAmbient)
    
    texture_set_interpolation(true)
    texture_set_repeat(false)
    surface_set_target(global.shadows3D_tempLightMap)
    draw_clear(c_black)
    d3d_set_projection_ext(argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8, argument9, argument10, argument11, argument12, argument13)
    script_execute(argument0)
    surface_reset_target()
    
    shader_reset()
    
    // Add current light map to final one
    d3d_end()
    surface_set_target(global.shadows3D_finalLightMap)
    if (i = 0) draw_clear(c_black)
    draw_set_blend_mode(bm_add)
    draw_surface(global.shadows3D_tempLightMap, 0, 0)
    draw_set_blend_mode(bm_normal)
    surface_reset_target()
    d3d_start()
}

// Regular projection
texture_set_interpolation(true)
texture_set_repeat(true)
draw_set_color(c_white)
d3d_set_projection_ext(argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8, argument9, argument10, argument11, argument12, argument13)
script_execute(argument0)

// Multiply final product with 3d projection on screen
d3d_set_projection_ortho(0, 0, global.shadows3D_screenWidth, global.shadows3D_screenHeight, 0)
if (lights > 0) {
    draw_set_blend_mode_ext(bm_dest_color, bm_zero)
    draw_set_blend_mode_ext(bm_zero, bm_src_color)
    draw_surface(global.shadows3D_finalLightMap, 0, 0)
    draw_set_blend_mode(bm_normal)
}