/*
model_add_torus(model, minor radius, major radius, steps, hrep, vrep)

Written by TheSnidr
www.thesnidr.com
*/
var m, minr, majr, q1, q2, hrep, vrep, d1, d2, r, _d1;

m = argument0
minr = argument1
majr = argument2
q1 = pi / argument3
q2 = 2 * q1
hrep = argument4 / pi / 2
vrep = argument5 / pi / 2
for (d1 = 0; d1 < pi * 2; d1 += q1)
{
    d3d_model_primitive_begin(m, pr_trianglestrip)
    for (d2 = 0; d2 <= pi * 2; d2 += q2)
    {
        r = (majr + minr * cos(d2))
        d3d_model_vertex_normal_texture(m, cos(d1) * r, sin(d1) * r, minr * sin(d2), cos(d1) * cos(d2), sin(d1) * cos(d2), sin(d2), hrep * d1, vrep * d2)
        _d1 = d1 + q1
        d3d_model_vertex_normal_texture(m, cos(_d1) * r, sin(_d1) * r, minr * sin(d2), cos(_d1) * cos(d2), sin(_d1) * cos(d2), sin(d2), hrep * _d1, vrep * d2)
    }
    d3d_model_primitive_end(m)
}