/// model_start()
/// Starts to create a vertex buffer model.

global.vertbuf = vertex_create_buffer();
vertex_begin(global.vertbuf, global.vertformat);
return global.vertbuf