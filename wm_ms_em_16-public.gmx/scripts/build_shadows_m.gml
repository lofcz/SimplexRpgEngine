{
    //  build_shadows_m(surfaceDestination, objectLight, boolCastAll, xoffset, yoffset)

    draw_set_color(c_black);
    d3d_set_culling(false);

    with (argument1) if (argument2 || point_distance(x,y,objectPlayer.x,objectPlayer.y) < (radius+objectPlayer.radius))
    {
        surface_set_target(other.surfaceWork1);
        draw_clear(c_black);
        draw_set_blend_mode(bm_normal);        
        
        d3d_transform_stack_push();
        d3d_transform_set_translation(x-argument3,y-argument4,0);
        draw_sprite_ext(sprite, image_index, 0, 0, image_xscale, image_yscale, image_angle, image_blend, image_alpha);        

        if (casts || argument2) {
            // Shadow Casting Light or Player View
            d3d_set_culling(true);
            draw_set_color(c_black);
            d3d_transform_set_identity();
            d3d_transform_add_skew_z(-x,-y);
            d3d_transform_add_translation(-argument3,-argument4,0);
            d3d_model_draw(global.modelShadow,0,0,0,-1);
        }
        d3d_transform_stack_pop();    

        // Accumulate
        surface_set_target(argument0);
        draw_set_blend_mode(bm_add);
        draw_surface(other.surfaceWork1,0,0);
    }        
    draw_set_blend_mode(bm_normal);
    surface_reset_target();
    return argument0;
}