// draw_scene()
// Everything in this script will cast shadows.
// This is executed 7*N+1 times per step, where N is the amount of lights.

d3d_draw_room(0, 0, 0, room_xsize,room_ysize,room_zsize, tex_wood, tex_wood, tex_bricks)

model_draw(model_table, table_x, table_y, table_z, tex_wood)

d3d_transform_add_rotation_x(bunny_rotation)
d3d_transform_add_rotation_y(bunny_rotation)
d3d_transform_add_rotation_z(bunny_rotation)
d3d_transform_add_translation(bunny_x, bunny_y, bunny_z)
d3d_model_draw(model_bunny, 0, 0, 0, tex_orange);
d3d_transform_set_identity()

d3d_transform_add_rotation_z(teapot_rotation)
d3d_transform_add_translation(teapot_x, teapot_y, teapot_z)
d3d_model_draw(model_teapot,0, 0, 0, tex_orange);
d3d_transform_set_identity()

d3d_transform_add_rotation_x(torus_rotation)
d3d_transform_add_rotation_y(torus_rotation)
d3d_transform_add_rotation_z(torus_rotation)
d3d_transform_add_translation(torus_x, torus_y, torus_z)
d3d_model_draw(model_torus_knot,0, 0, 0, tex_orange);
d3d_transform_set_identity()

/*with (obj_light) {
    draw_set_color(color)
    d3d_draw_block(x - 4, y - 4, z - 4, x + 4, y + 4, z + 4, -1, 1, 1)
}
draw_set_color(c_white)*/