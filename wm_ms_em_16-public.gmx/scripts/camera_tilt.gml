{
    d3d_transform_add_translation(-objectPlayer.x,-objectPlayer.y,0);
    d3d_transform_add_rotation_z(view_angle[0]);
    d3d_transform_add_rotation_x(-25);
    d3d_transform_add_scaling(2,2,2);
    d3d_transform_add_translation(objectPlayer.x,objectPlayer.y,0);   
}