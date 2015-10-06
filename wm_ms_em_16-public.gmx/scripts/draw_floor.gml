{
    // Draw Light Map
    draw_set_blend_mode(bm_normal);
    d3d_transform_stack_push();
    d3d_transform_add_translation(view_xview[0],view_yview[0],0);
    camera_tilt();
    draw_surface(surfaceBackground,0,0);
    draw_set_blend_mode(bm_subtract);
    draw_surface(surfacePropShadow,0,0);
    
    d3d_transform_stack_pop();    
    d3d_transform_stack_push();
    camera_tilt();

    // Multiply Floor Texture
    draw_set_blend_mode_ext(bm_dest_color,bm_zero);
    draw_background_tiled(backgroundFloor, 0, 0);
    draw_set_blend_mode(bm_normal);
    d3d_transform_stack_pop();
}