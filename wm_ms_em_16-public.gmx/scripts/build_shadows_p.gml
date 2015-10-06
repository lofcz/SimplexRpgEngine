{
    //  build_shadows_m(surfaceDestination, objectLight, objectCast, boolCastAll, xoffset, yoffset)
    var xx,yy,dist,rad,color,surfDestination, objLight, objCast, boolCastAll, xoffset, yoffset, drawn;
    surfDestination = argument0;
    objLight = argument1;
    objCast = argument2;
    boolCastAll = argument3;
    xoffset = argument4;
    yoffset = argument5;
    drawn = false;  
    with (objLight) {
        dist = point_distance(x,y,objectPlayer.x,objectPlayer.y) / (radius+objectPlayer.radius);
        if (boolCastAll || (casts && dist < 1))
        {
            xx = x;
            yy = y;
            color = image_blend;
            rad = radius;
            surface_clear(other.surfaceWork1,c_black,1);
            surface_set_target(other.surfaceWork1);
            draw_set_blend_mode(bm_normal);        
            d3d_set_culling(false);
            d3d_transform_stack_push();    
            drawn = false;
            with (objectProp) {
                if (visible) {
                    dist = point_distance(x,y,xx,yy)/rad;
                    if (dist < 1) {
                        draw_set_color(merge_color(color,c_black,sqrt(dist)));
                        d3d_transform_set_rotation_z(direction);
                        d3d_transform_add_scaling(xScale,yScale,0.03);
                        d3d_transform_add_skew_z(x-xx,y-yy);
                        d3d_transform_add_translation(x-xoffset,y-yoffset,0);
                        d3d_model_draw(model,0,0,0,-1);
                        drawn = true;
                    }
                }
            }
            d3d_transform_stack_pop();    
        }
        if (drawn) {
            // Accumulate
            surface_set_target(surfDestination);
            draw_set_blend_mode(bm_add);
            draw_surface(other.surfaceWork1,0,0);
        }
    }        
    draw_set_blend_mode(bm_normal);
    surface_reset_target();
    return surfDestination;
}