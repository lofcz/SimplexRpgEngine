/* Creates the animation vertex format
*/

vertex_format_begin();

    vertex_format_add_position_3d();
    vertex_format_add_textcoord();
    vertex_format_add_normal();
    vertex_format_add_custom(vertex_type_float3,vertex_usage_colour)//x2,y2,z2
    vertex_format_add_custom(vertex_type_float3,vertex_usage_colour)//xn2,yn2,zn2
 

global.animation_format = vertex_format_end();