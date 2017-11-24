/// draw_rectangle_cd(x1, y1, x2, y2, value)

draw_set_colour(c_red);
draw_set_alpha(0.6);

var v, x1, y1, x2, y2, xm, ym, vd, vx, vy, vl;
v = (argument4 / 360);
v = 1 - v;
if (v <= 0) return 0 
x1 = argument0; y1 = argument1; 
x2 = argument2; y2 = argument3; 

xm = (x1 + x2) / 2; ym = (y1 + y2) / 2;
draw_primitive_begin(pr_trianglefan)
draw_vertex(xm, ym); draw_vertex(xm, y1)


if (v >= 0.125) draw_vertex(x1, y1) 
if (v >= 0.375) draw_vertex(x1, y2)
if (v >= 0.625) draw_vertex(x2, y2)
if (v >= 0.875) draw_vertex(x2, y1)

vd = pi * (v * 2 - 1) 
vx = sin(vd)
vy = cos(vd) 

vl = max(abs(vx), abs(vy))
if (vl < 1) {
    vx /= vl
    vy /= vl
}

draw_vertex(xm + vx * (x2 - x1) / 2, ym + vy * (y2 - y1) / 2)
draw_primitive_end()
