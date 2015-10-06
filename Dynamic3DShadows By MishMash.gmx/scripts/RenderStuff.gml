// Draw stuff
d3d_set_culling( false );
draw_set_color(c_white);
//d3d_model_draw(global.model, 0, 0, 0, background_get_texture( tex_floor ));

d3d_draw_floor(- 1024, -1024, 0, 1024, 1024, 0, background_get_texture( tex_floor ), 32, 32);
with( objZ ){
    d3d_transform_set_identity();
    d3d_transform_add_rotation_z( rot );
    d3d_transform_add_translation( x, y, z );
    d3d_model_draw(objImport.internalFrame[Frame], 0, 0, 0, background_get_texture(background9));
    d3d_transform_set_identity();
}

draw_set_alpha_test(true);
draw_set_alpha_test_ref_value( 210 );
with(objLog){
    d3d_draw_cylinder(x-3, y-3, 0, x+3, y+3, 20, background_get_texture( tex_tree ), 1, 1, 1, 6);
}

with(objMetalFence){
    event_user( 0 );
}
with(objGrass){
    event_user( 0 );
}

with(objBlock){
    d3d_draw_block(x-12, y-12, 0, x+12, y+12, 24, background_get_texture( background2 ),1, 1);
}
draw_set_alpha_test(false);