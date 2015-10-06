{
    // Blur
    var b; b = argument1;
    draw_set_blend_mode(bm_normal);
    surface_set_target(surfaceWork1);
    draw_clear_alpha(c_black,1);
    draw_surface_ext(argument0,-b,0,1,1,0,c_white,1);
    draw_surface_ext(argument0,b,0,1,1,0,c_white,0.5);
    draw_set_blend_mode(bm_add);
    draw_surface_ext(argument0,0,0,1,1,0,c_black,1);
    surface_set_target(argument0);
    draw_set_blend_mode(bm_normal);
    draw_surface_ext(surfaceWork1,0,-b,1,1,0,c_white,1);
    draw_surface_ext(surfaceWork1,0,b,1,1,0,c_white,0.5);
    draw_set_blend_mode(bm_add);
    draw_surface_ext(surfaceWork1,0,0,1,1,0,c_black,1);
    draw_set_blend_mode(bm_normal);
    surface_reset_target();
}