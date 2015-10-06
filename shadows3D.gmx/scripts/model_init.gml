/// model_init()
/// Called before creating a vertex buffer model.

vertex_format_begin();
vertex_format_add_position_3d();
vertex_format_add_normal();
vertex_format_add_textcoord();
global.vertformat = vertex_format_end();