/// d3d_draw_room(x1,y1,z1,x2,y2,z2,floortex,ceiltex,wallstex)
var x1,y1,z1,x2,y2,z2,ftex,ctex,wtex;
x1=argument0
y1=argument1
z1=argument2
x2=argument3
y2=argument4
z2=argument5
ftex=argument6
ctex=argument7
wtex=argument8

d3d_primitive_begin_texture(pr_trianglelist, ftex) // Floor
d3d_vertex_normal_texture(x1,y1,z1,0,0,1,0,0)
d3d_vertex_normal_texture(x2,y1,z1,0,0,1,1,0)
d3d_vertex_normal_texture(x1,y2,z1,0,0,1,0,1)
d3d_vertex_normal_texture(x2,y1,z1,0,0,1,1,0)
d3d_vertex_normal_texture(x2,y2,z1,0,0,1,1,1)
d3d_vertex_normal_texture(x1,y2,z1,0,0,1,0,1)
d3d_primitive_end()

d3d_primitive_begin_texture(pr_trianglelist, ctex) // Ceiling
d3d_vertex_normal_texture(x1,y1,z2,0,0,-1,0,0)
d3d_vertex_normal_texture(x1,y2,z2,0,0,-1,0,1)
d3d_vertex_normal_texture(x2,y1,z2,0,0,-1,1,0)
d3d_vertex_normal_texture(x2,y1,z2,0,0,-1,1,0)
d3d_vertex_normal_texture(x1,y2,z2,0,0,-1,0,1)
d3d_vertex_normal_texture(x2,y2,z2,0,0,-1,1,1)
d3d_primitive_end()

d3d_primitive_begin_texture(pr_trianglelist, wtex) // Walls
d3d_vertex_normal_texture(x1,y2,z2,1,0,0,0,0)
d3d_vertex_normal_texture(x1,y1,z2,1,0,0,1,0)
d3d_vertex_normal_texture(x1,y2,z1,1,0,0,0,1)
d3d_vertex_normal_texture(x1,y1,z2,1,0,0,1,0)
d3d_vertex_normal_texture(x1,y1,z1,1,0,0,1,1)
d3d_vertex_normal_texture(x1,y2,z1,1,0,0,0,1)

d3d_vertex_normal_texture(x2,y2,z2,-1,0,0,0,0)
d3d_vertex_normal_texture(x2,y2,z1,-1,0,0,0,1)
d3d_vertex_normal_texture(x2,y1,z2,-1,0,0,1,0)
d3d_vertex_normal_texture(x2,y1,z2,-1,0,0,1,0)
d3d_vertex_normal_texture(x2,y2,z1,-1,0,0,0,1)
d3d_vertex_normal_texture(x2,y1,z1,-1,0,0,1,1)

d3d_vertex_normal_texture(x1,y1,z2,0,1,0,0,0)
d3d_vertex_normal_texture(x2,y1,z2,0,1,0,1,0)
d3d_vertex_normal_texture(x2,y1,z1,0,1,0,1,1)
d3d_vertex_normal_texture(x1,y1,z2,0,1,0,0,0)
d3d_vertex_normal_texture(x2,y1,z1,0,1,0,1,1)
d3d_vertex_normal_texture(x1,y1,z1,0,1,0,0,1)

d3d_vertex_normal_texture(x1,y2,z2,0,-1,0,0,0)
d3d_vertex_normal_texture(x2,y2,z1,0,-1,0,1,1)
d3d_vertex_normal_texture(x2,y2,z2,0,-1,0,1,0)
d3d_vertex_normal_texture(x1,y2,z2,0,-1,0,0,0)
d3d_vertex_normal_texture(x1,y2,z1,0,-1,0,0,1)
d3d_vertex_normal_texture(x2,y2,z1,0,-1,0,1,1)
d3d_primitive_end()