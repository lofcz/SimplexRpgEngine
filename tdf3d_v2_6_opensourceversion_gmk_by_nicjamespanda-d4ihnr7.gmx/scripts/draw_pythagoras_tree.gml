/// draw_pythagoras_tree( itterations, x, y, angle_1, angle_2);

    var a,b,A,B;
    A = argument3;
    B = argument4;
   
    
    a = sin(degtorad(A)) / sin( degtorad( 180 - A - B));
    b = sin(degtorad(B)) / sin( degtorad( 180 - A - B));

    d3d_transform_stack_push();
    d3d_transform_add_translation( argument1, argument2, 0);
    draw_set_colour(c_white);
    draw_set_alpha(0.2);
    draw_rectangle(-50, -50, 50, 50, 0);
    d3d_transform_stack_pop();
    
    if(argument0 > 0) {
        d3d_transform_stack_push();
        d3d_transform_add_translation( 50, -50, 0);
        d3d_transform_add_rotation_z( A);
        d3d_transform_add_scaling( b, b, 1);
        d3d_transform_add_translation( -50, -50, 0);
        draw_pythagoras_tree( argument0 - 1, argument1, argument2, argument3, argument4);
        
        d3d_transform_stack_pop();
        d3d_transform_add_translation( -50, -50, 0);
        d3d_transform_add_rotation_z( -B);
        d3d_transform_add_scaling( a, a, 1);
        d3d_transform_add_translation( 50, -50, 0);
        draw_pythagoras_tree( argument0 - 1, argument1, argument2, argument3, argument4);        
    }
    d3d_transform_set_identity();
